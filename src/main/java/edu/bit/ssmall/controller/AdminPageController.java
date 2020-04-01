package edu.bit.ssmall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bit.ssmall.page.Criteria;
import edu.bit.ssmall.page.PageMaker;
import edu.bit.ssmall.service.AdminService;
import edu.bit.ssmall.service.BoardNoticeService;
import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.ProductVO;

@Controller
@RequestMapping("admin")
public class AdminPageController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	BoardNoticeService boardnoticeService;
	
	@Autowired
	BoardNoticeService bservice;

	
	//관리자 게시판 첫 화면 여긴 통계같은거 나오면 좋을듯?
	@RequestMapping(value = "adminpage", method ={RequestMethod.GET,RequestMethod.POST})
	public String adminpage(Model model) {
		System.out.println("adminpage 시작");
		
		
		return "Admin/adminpage";

	}	
	
	//회원관리 누르면 시작
	@RequestMapping(value = "memberList",method = {RequestMethod.GET,RequestMethod.POST})
	public String memberList(Model model) {
		System.out.println("memberList 시작");
		
		return "Admin/admin_memberList";

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
		System.out.println("환불내역 조회 : " + totalCount + "회");
		
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
	
}	
	







	/*
	 * //1:1문의 관리하는 컨트롤
	 * 
	 * @RequestMapping(value = "requestList", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public String requestList(Model
	 * model) { System.out.println("requestList 시작");
	 * 
	 * return "Admin/admin_requestList"; }
	 * 
	 * //as요청 관리하는 컨트롤
	 * 
	 * @RequestMapping(value = "asList", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public String asList(Model model) {
	 * System.out.println("asList 시작");
	 * 
	 * return "Admin/admin_asList"; }
	 */

