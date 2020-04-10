package edu.bit.ssmall.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.bit.ssmall.page.Criteria;
import edu.bit.ssmall.page.PageMaker;
import edu.bit.ssmall.service.AdminService;
import edu.bit.ssmall.service.BoardNoticeService;
import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductVO;
import edu.bit.ssmall.vo.RefundVO;

@Controller
@RequestMapping("admin")
public class AdminPageController {
	
	@Autowired
	AdminService adminService;

	@Autowired
	BoardNoticeService boardnoticeService;
	
	@Autowired
	BoardNoticeService bservice;

	
	@RequestMapping(value = "asList", method ={RequestMethod.GET,RequestMethod.POST})
	public String asList(Model model) {
		System.out.println("asList 시작");
		
		return "Admin/admin_asList";

	}
	
	@RequestMapping(value = "requestList", method ={RequestMethod.GET,RequestMethod.POST})
	public String requestList(Model model) {
		System.out.println("requestList 시작");
		
		return "Admin/admin_requestList";

	}
	
	@RequestMapping(value = "requestWrite", method ={RequestMethod.GET,RequestMethod.POST})
	public String requestWrite(Model model) {
		System.out.println("requestWrite 시작");
		
		return "Admin/admin_requestWrite";

	}

	
	//관리자 게시판 첫 화면 여긴 통계같은거 나오면 좋을듯?
	@RequestMapping(value = "adminpage", method ={RequestMethod.GET,RequestMethod.POST})
	public String adminpage(Model model) {
		System.out.println("adminpage 시작");
		
		
		return "Admin/adminpage";

	}	
	
	//회원관리 누르면 시작
	@RequestMapping(value = "memberList",method = {RequestMethod.GET,RequestMethod.POST})
	public String memberList(Criteria criteria, Model model) {
		System.out.println("memberList 시작");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		System.out.println("현재페이지 : "+criteria.getPage());
		System.out.println("화면에 보여질 페이지수 : "+criteria.getPerPageNum());

		int startNum = criteria.getStartNum();
		int endNum = criteria.getEndNum();

		int totalCount = adminService.countMember();
		System.out.println("회원 조회 : " + totalCount);
		
		pageMaker.setTotalCount(totalCount);
		
		List<MemberVO> member = adminService.memberList(startNum, endNum);
		System.out.println(member);

		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("member", member);
		model.addAttribute("admin", adminService.adminList());
		
		return "Admin/admin_memberList";

	}	
	
	//선택한 회원 정보
	@RequestMapping(value = "memberInfo",method = {RequestMethod.GET,RequestMethod.POST})
	public String memberInfo(Criteria criteria, Model model, HttpServletRequest request) {
		System.out.println("memberInfo 시작");			
		String m_number = request.getParameter("m_number");
	
		model.addAttribute("member",adminService.memberInfo(m_number));
		model.addAttribute("buyList", adminService.buyList(m_number));
		model.addAttribute("refundList", adminService.refundList(m_number));
		model.addAttribute("requestList", adminService.requestList(m_number));
		model.addAttribute("asList", adminService.asList(m_number));
		
		return "Admin/admin_memberInfo";
	}	
		
	//상품 목록 누르면 시작
	@RequestMapping(value = "productList", method = {RequestMethod.GET,RequestMethod.POST})
	public String productList(Criteria criteria, Model model) {
		System.out.println("productList 시작");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		System.out.println("현재페이지 : "+criteria.getPage());
		System.out.println("화면에 보여질 페이지수 : "+criteria.getPerPageNum());

		int startNum = criteria.getStartNum();
		int endNum = criteria.getEndNum();

		int totalCount = adminService.countProduct();

		System.out.println("상품 수 : " + totalCount);

		
		pageMaker.setTotalCount(totalCount);
		
		List<ProductVO> list = adminService.productList(startNum, endNum);
		System.out.println(list);

		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("list", list);
		
		
		return "Admin/admin_productList";

	}
	
	@RequestMapping(value = "addProduct", method = {RequestMethod.GET,RequestMethod.POST})
	public String addProduct(Model model) {
		
		System.out.println("addProduct 시작");
		
		
		return "Admin/admin_addProduct";
	}
	
	//공지사항 관리하는 컨트롤
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)//문의글들 띄워놓는 부분에 대한 컨트롤러
	public String noticeList(Criteria criteria, Model model, BoardVO boardVO) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = boardnoticeService.getMnum(name);
			model.addAttribute("m_number", m_number);
			int totalCount = boardnoticeService.selectAskCountBoard(m_number);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<BoardVO> askRequestboards = boardnoticeService.selectAskBoardListPage(m_number, startNum, endNum);
			model.addAttribute("askRequestboards", askRequestboards);
			List<BoardVO> askRequestboardsAnswers = new ArrayList<BoardVO>(); 
			for(int i=0; i<askRequestboards.size(); i++) { 
				BoardVO answer =boardnoticeService.getAllAskRequestAnswer(askRequestboards.get(i).getBid());
				askRequestboardsAnswers.add(i, answer); 
				}
			  model.addAttribute("askRequestboardsAnswers", askRequestboardsAnswers);
			  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "Admin/admin_noticeList";
	}
	
	@RequestMapping(value = "/noticeWrite", method = RequestMethod.GET)//실제로 입력하는 창 에 대한 컨트롤러 밑에꺼랑 세트
	public String noticeWrite(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    
	    String bTitle = request.getParameter("bTitle");
	    String bContent = request.getParameter("bContent");
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = boardnoticeService.getMnum(name);
			model.addAttribute("m_number", m_number); 
			String bName = boardnoticeService.getMname(name);
			model.addAttribute("bName", bName);
			if(bTitle != null && bContent != null) {
				boardnoticeService.insertAsk(bName, bTitle, bContent, m_number);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "Admin/admin_noticeWrite";

	}
	
	@RequestMapping(value = "/admin_noticeWrite_back", method = RequestMethod.GET)//이것도 입력하는 창에 대한 컨트롤러인데 입력하는 창에 대한 컨트롤러가 두개인 이유는 위에꺼랑 쌍으로 구현해야 입력직후 게시글 목록으로 돌아오는 걸 구현할 수 있어서이다.
	public String admin_noticeWrite_back(Criteria criteria, Model model, HttpServletRequest request, BoardVO boardVO) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    
	    String bTitle = request.getParameter("bTitle");
	    String bContent = request.getParameter("bContent");
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = boardnoticeService.getMnum(name);
			model.addAttribute("m_number", m_number);
			String bName = boardnoticeService.getMname(name);
			model.addAttribute("bName", bName);
			
			if(bTitle != null && bContent != null) {
				boardnoticeService.insertAsk(bName, bTitle, bContent, m_number);
			}
			int totalCount = boardnoticeService.selectAskCountBoard(m_number);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<BoardVO> askRequestboards = boardnoticeService.selectAskBoardListPage(m_number, startNum, endNum);
			model.addAttribute("askRequestboards", askRequestboards);
			List<BoardVO> askRequestboardsAnswers = new ArrayList<BoardVO>(); 
			for(int i=0; i<askRequestboards.size(); i++) { 
				BoardVO answer =boardnoticeService.getAllAskRequestAnswer(askRequestboards.get(i).getBid());
				askRequestboardsAnswers.add(i, answer); 
				}
			  model.addAttribute("askRequestboardsAnswers", askRequestboardsAnswers);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "Admin/admin_noticeList";

	}
	
	@RequestMapping(value = "/noticeWrite2", method = RequestMethod.GET) //글 수정하는 창에 대한 컨트롤러
	public String noticeWrite2(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    
	    String bTitle = request.getParameter("bTitle");
	    String bContent = request.getParameter("bContent");
	    String bId = request.getParameter("bId");
	    model.addAttribute("bId",bId);
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = boardnoticeService.getMnum(name);
			model.addAttribute("m_number", m_number);
			
			if(bTitle != null && bContent != null) {
				boardnoticeService.updateAskAS(bTitle, bContent, bId);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return "Admin/admin_noticeWrite2";
	}
	//회원 검색
	@RequestMapping(value = "memberSearch", method = {RequestMethod.GET,RequestMethod.POST})
	public String memberSearch(Model model, HttpServletRequest request, Criteria criteria) {
		System.out.println("memberSearch 시작");
		System.out.println(request.getParameter("search"));
		String search = request.getParameter("search");
		if(search.equals("")) {
			return "redirect:/admin/memberList";
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		System.out.println("현재페이지 : "+criteria.getPage());
		System.out.println("화면에 보여질 페이지수 : "+criteria.getPerPageNum());

		int startNum = criteria.getStartNum();
		int endNum = criteria.getEndNum();

		int totalCount = adminService.countSearchMember(search);
		System.out.println("회원 수 : " + totalCount);
		
		pageMaker.setTotalCount(totalCount);
		
		List<MemberVO> list = adminService.searchMemberList(startNum, endNum, search);
		System.out.println(list);

		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("search", list);
		model.addAttribute("keyword",search);
		
		return "Admin/admin_memberList";
	}
	
	//상품 검색 이름이나 브랜드
	@RequestMapping(value = "productSearch", method = {RequestMethod.GET,RequestMethod.POST})
	public String productSearch(Model model, HttpServletRequest request) {
		System.out.println("productSearch 시작");
		System.out.println(request.getParameter("search"));
		String search = request.getParameter("search");
		if(search.equals("")) {
			return "redirect:/admin/productList";
		}
		model.addAttribute("search", adminService.productSearch(search));
		return "Admin/admin_productList";
	}

	@RequestMapping(value = "buyInfo", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyInfo(Model model,Criteria criteria, HttpServletRequest request) {
		System.out.println("buyInfo 시작");
	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		System.out.println("현재페이지 : "+criteria.getPage());
		System.out.println("화면에 보여질 페이지수 : "+criteria.getPerPageNum());

		int startNum = criteria.getStartNum();
		int endNum = criteria.getEndNum();
		String m_number = request.getParameter("m_number");
		
		int totalCount = adminService.countBuy(m_number);
		System.out.println("구매내역 : " + totalCount);
		
		pageMaker.setTotalCount(totalCount);
		int totalPrice = 0;
		ArrayList<BuyVO> list = adminService.buyList(m_number);
		for (int i = 0; i < list.size(); i++) {
			totalPrice += list.get(i).getB_total();
		}
	
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("buyInfo", adminService.buyInfo(m_number, startNum, endNum));
		model.addAttribute("pageMaker", pageMaker);
		
		return "Admin/admin_memberBuyList";
	}
	
	@RequestMapping(value = "refundInfo", method = {RequestMethod.GET,RequestMethod.POST})
	public String refundInfo(Model model,Criteria criteria, HttpServletRequest request) {
		System.out.println("buyInfo 시작");
	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		System.out.println("현재페이지 : "+criteria.getPage());
		System.out.println("화면에 보여질 페이지수 : "+criteria.getPerPageNum());

		int startNum = criteria.getStartNum();
		int endNum = criteria.getEndNum();
		String m_number = request.getParameter("m_number");
		
		int totalCount = adminService.countRefund(m_number);
		System.out.println("환불내역 : " + totalCount);
		
		pageMaker.setTotalCount(totalCount);
		
		int totalPrice = 0;
		ArrayList<RefundVO> list = adminService.refundList(m_number);
		for (int i = 0; i < list.size(); i++) {
			totalPrice += list.get(i).getR_price();
		}
	
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("refundInfo", adminService.refundInfo(m_number, startNum, endNum));
		model.addAttribute("pageMaker", pageMaker);
		
		return "Admin/admin_memberRefundList";
	}
	
	@RequestMapping(value = "updateAutoritiy", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateAutoritiy(Model model,Criteria criteria, HttpServletRequest request) {
		String m_number = request.getParameter("m_number");
		String m_authority = request.getParameter("m_authority");
		
		adminService.updateAuthority(m_number, m_authority);
		
		return "redirect:/admin/memberInfo?m_number="+m_number;

	}
	
	@RequestMapping(value = "/noticeWrite2_back", method = RequestMethod.GET)//위에꺼랑 세트 이것까지 구현시 수정직후 알아서 게시글로 돌아옴
	public String noticeWrite2_back(Criteria criteria, Model model, HttpServletRequest request, BoardVO boardVO) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	   
	    String bTitle = request.getParameter("bTitle");
	    String bContent = request.getParameter("bContent");
	    String bId = request.getParameter("bId");
	    model.addAttribute("bId",bId);
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = boardnoticeService.getMnum(name);
			model.addAttribute("m_number", m_number);
			
			if(bTitle != null && bContent != null) {
				boardnoticeService.updateAskAS(bTitle, bContent, bId);
			}
			int totalCount = boardnoticeService.selectAskCountBoard(m_number);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<BoardVO> askRequestboards = boardnoticeService.selectAskBoardListPage(m_number, startNum, endNum);
			model.addAttribute("askRequestboards", askRequestboards);
			List<BoardVO> askRequestboardsAnswers = new ArrayList<BoardVO>(); 
			for(int i=0; i<askRequestboards.size(); i++) { 
				BoardVO answer =boardnoticeService.getAllAskRequestAnswer(askRequestboards.get(i).getBid());
				askRequestboardsAnswers.add(i, answer); 
				}
			  model.addAttribute("askRequestboardsAnswers", askRequestboardsAnswers);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "Admin/noticeWrite_back";


	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET) //삭제는 딱히 UI가 없고 그냥 삭제 논리대로 철기하는 컨트롤러 삭제버튼 누르면 이 컨트롤러를 탄다.
	public String delete(Criteria criteria, Model model, HttpServletRequest request, BoardVO boardVO) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    
	    String bId = request.getParameter("bId");
	    model.addAttribute("bId",bId);
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = boardnoticeService.getMnum(name);
			model.addAttribute("m_number", m_number);
			int totalCount = boardnoticeService.selectAskCountBoard(m_number);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<BoardVO> askRequestboards = boardnoticeService.selectAskBoardListPage(m_number, startNum, endNum);
			model.addAttribute("askRequestboards", askRequestboards);
			List<BoardVO> askRequestboardsAnswers = new ArrayList<BoardVO>(); 
			for(int i=0; i<askRequestboards.size(); i++) { 
				BoardVO answer =boardnoticeService.getAllAskRequestAnswer(askRequestboards.get(i).getBid());
				askRequestboardsAnswers.add(i, answer); 
				}
			  model.addAttribute("askRequestboardsAnswers", askRequestboardsAnswers);
			
			  boardnoticeService.deleteAskAS(bId);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	    return "redirect:/admin/noticeList";


	}
	

	@RequestMapping(value="productModify", method = {RequestMethod.GET,RequestMethod.POST})
	public String productModify(Model model, HttpServletRequest request){
		String p_number = request.getParameter("p_number");
		System.out.println("p_number : "+p_number);
		
		ProductVO productVO = adminService.productOne(p_number);
		model.addAttribute("product", productVO);
		
		return "Admin/admin_productModify";
	}
	
	@RequestMapping(value = "productUpdate", method = {RequestMethod.GET,RequestMethod.POST})
	public String productUpdate(MultipartHttpServletRequest mtfRequest, Model model) {
		HttpSession session = mtfRequest.getSession();
		String p_number = mtfRequest.getParameter("p_number");
		String p_name = mtfRequest.getParameter("p_name");
		String p_brand = mtfRequest.getParameter("p_brand");
		String p_price = mtfRequest.getParameter("p_price");
		String p_stock = mtfRequest.getParameter("p_stock");
		String enabled = mtfRequest.getParameter("p_enabled");
		int p_enabled = 1;
		if (enabled.equals("비활성화")) {
			enabled = "0";
			p_enabled = Integer.parseInt(enabled);
		}
		
		System.out.println("p_number : " + p_number);
		System.out.println("p_name : " + p_name);
		System.out.println("p_brand : " + p_brand);
		System.out.println("p_price : " + p_price);
		System.out.println("p_stock : " + p_stock);
		
		String path = "C:\\Users\\user\\git\\SS_MALL\\src\\main\\webapp\\resources\\productimage\\";
		String realPath = session.getServletContext().getRealPath("/");		

		System.out.println("productUpdate 시작");
		System.out.println("==================");
		System.out.println("path : " + path);
		System.out.println("realPath : " + realPath);		
		System.out.println("==================");
		
		MultipartFile file1 = mtfRequest.getFile("file1");
		MultipartFile file2 = mtfRequest.getFile("file2");		
		MultipartFile file3 = mtfRequest.getFile("file3");

		MultipartFile[] arr = {file1, file2, file3};
		
		int i_type = 1;
		
		for (int i = 0; i < arr.length; i++) {
			String originFileName = arr[i].getOriginalFilename(); // 원본 파일 명
			
			//아무파일도 선택 안할시
			if(originFileName.equals("")) {
				i_type++;
				System.out.println(i+"번째 파일 업로드안함");
				continue;
			}
			
	
			long fileSize = arr[i].getSize(); // 파일 사이즈
			String safeFile = path + originFileName; // 경로 + 이름
			String realFile = realPath + "\\resources\\productimage\\" + originFileName;

			System.out.println(i + "번째 사진 업로드 시작! ");
			System.out.println("====================================");
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			System.out.println("savaFile : " + safeFile);
			System.out.println("realFile : " + realFile);
			System.out.println("====================================");

			try {
				arr[i].transferTo(new File(safeFile));
				arr[i].transferTo(new File(realFile));
				adminService.updateImage(p_number, originFileName, i_type);
				i_type++;
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		
		if(!file1.getOriginalFilename().equals("")) {
			adminService.updateProduct(p_number, p_name, p_brand, p_price, p_stock, file1.getOriginalFilename(), p_enabled);
		}else {
			adminService.updateOnlyProduct(p_number, p_name, p_brand, p_price, p_stock, p_enabled);
		}

		return "redirect:/admin/productList";
		// 여기부턴 대표사진 업로드
	}
	



}	




