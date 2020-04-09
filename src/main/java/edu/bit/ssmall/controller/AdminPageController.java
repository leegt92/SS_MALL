package edu.bit.ssmall.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.bit.ssmall.page.Criteria;
import edu.bit.ssmall.page.PageMaker;
import edu.bit.ssmall.service.AdminService;
import edu.bit.ssmall.service.BoardNoticeService;
import edu.bit.ssmall.service.MypageService;
import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.Board_MemberVO;
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
	
	@Autowired
	MypageService mypageService;

	@RequestMapping(value = "/doAnswer", method ={RequestMethod.GET,RequestMethod.POST})
	public String admin_doAnswer(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    
	    String bId = request.getParameter("bId");
		model.addAttribute("bId",bId);
	    String bTitle = request.getParameter("answerTitle");
	    String bContent = request.getParameter("answerContent");
	    String name = "";
	    
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
	    	String FanswerbTitle = mypageService.selectFanswerbTitle(bId);
	    	System.out.println("성원숭2" + FanswerbTitle);
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number); 
			String bName = mypageService.getMname(name);
			model.addAttribute("bName", bName);
			if(FanswerbTitle == null) {
				adminService.updateBanswered(bId);
				adminService.insertAnswer(bName, bTitle, bContent, m_number, bId);
			}
			else {
				adminService.updateAnswer(bTitle, bContent, bId);
			}
			String type = adminService.selectBtype(bId);
			if(type.equals("문의/건의")) {
				return "redirect:/admin/requestList";
			}
			else {
				return "redirect:/admin/asList";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return "Admin/admin_asList";
	}	
	
	@RequestMapping(value = "asList", method ={RequestMethod.GET,RequestMethod.POST})
	public String admin_aSRequestView(Criteria criteria, Model model, BoardVO boardVO) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			int totalCount = adminService.selectASCountBoard();
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<Board_MemberVO> aSRequestboards = adminService.selectAnsweredASBoardListPage(startNum, endNum);
			model.addAttribute("aSRequestboards", aSRequestboards);
			List<BoardVO> aSRequestboardsAnswers = new ArrayList<BoardVO>(); 
			for(int i=0; i<aSRequestboards.size(); i++) { 
				BoardVO answer =mypageService.getAllASRequestAnswer(aSRequestboards.get(i).getBid());
				aSRequestboardsAnswers.add(i, answer); 
				}
			  model.addAttribute("aSRequestboardsAnswers", aSRequestboardsAnswers);
			  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "Admin/admin_asList";

	}
	
	@RequestMapping(value = "unAnsweredasList", method ={RequestMethod.GET,RequestMethod.POST})
	public String admin_unAnsweredaSRequestView(Criteria criteria, Model model, BoardVO boardVO) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			int totalCount = adminService.selectASCountBoard();
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<Board_MemberVO> aSRequestboards = adminService.selectUnAnsweredASBoardListPage(startNum, endNum);
			model.addAttribute("aSRequestboards", aSRequestboards);
			List<BoardVO> aSRequestboardsAnswers = new ArrayList<BoardVO>(); 
			for(int i=0; i<aSRequestboards.size(); i++) { 
				BoardVO answer =mypageService.getAllASRequestAnswer(aSRequestboards.get(i).getBid());
				aSRequestboardsAnswers.add(i, answer); 
				}
			  model.addAttribute("aSRequestboardsAnswers", aSRequestboardsAnswers);
			  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "Admin/admin_unAnsweredasList";

	}
	
	@RequestMapping(value = "requestList", method ={RequestMethod.GET,RequestMethod.POST})
		public String admin_askRequestView(Criteria criteria, Model model, BoardVO boardVO) {
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(criteria);
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    Object principal = auth.getPrincipal();
		    String name = "";
		    if(principal != null) {
		        name = auth.getName();
		    }
		    
		    try {
				int m_number = mypageService.getMnum(name);
				model.addAttribute("m_number", m_number);
				int totalCount = adminService.selectAskCountBoard();
				pageMaker.setTotalCount(totalCount);
				model.addAttribute("pageMaker", pageMaker);
				int startNum = criteria.getStartNum(); 
				int endNum = criteria.getEndNum();
				List<Board_MemberVO> askRequestboards = adminService.selectAnsweredAskBoardListPage(startNum, endNum);
				model.addAttribute("askRequestboards", askRequestboards);
				List<BoardVO> askRequestboardsAnswers = new ArrayList<BoardVO>(); 
				for(int i=0; i<askRequestboards.size(); i++) { 
					BoardVO answer =mypageService.getAllAskRequestAnswer(askRequestboards.get(i).getBid());
					askRequestboardsAnswers.add(i, answer); 
					}
				  model.addAttribute("askRequestboardsAnswers", askRequestboardsAnswers);
				  
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return "Admin/admin_requestList";

	}
	
	@RequestMapping(value = "unAnsweredrequestList", method ={RequestMethod.GET,RequestMethod.POST})
	public String admin_unAnsweredaskRequestView(Criteria criteria, Model model, BoardVO boardVO) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			int totalCount = adminService.selectAskCountBoard();
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<Board_MemberVO> askRequestboards = adminService.selectUnAnsweredAskBoardListPage(startNum, endNum);
			model.addAttribute("askRequestboards", askRequestboards);
			List<BoardVO> askRequestboardsAnswers = new ArrayList<BoardVO>(); 
			for(int i=0; i<askRequestboards.size(); i++) { 
				BoardVO answer =mypageService.getAllAskRequestAnswer(askRequestboards.get(i).getBid());
				askRequestboardsAnswers.add(i, answer); 
				}
			  model.addAttribute("askRequestboardsAnswers", askRequestboardsAnswers);
			  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	return "Admin/admin_unAnsweredrequestList";

}
	
	@RequestMapping(value = "requestWrite", method ={RequestMethod.GET,RequestMethod.POST})
	public String requestWrite(Model model, HttpServletRequest request, Board_MemberVO boardVO) {
		String bId = request.getParameter("bId");
		model.addAttribute("bId",bId);
		
		try {
		String FbTitle = mypageService.selectFbTitle(bId);
	    String FbContent = mypageService.selectFbContent(bId);
		model.addAttribute("FbTitle",FbTitle);
	    model.addAttribute("FbContent",FbContent);
	    String FanswerbTitle = mypageService.selectFanswerbTitle(bId);
	    String FanswerbContent = mypageService.selectFanswerbContent(bId);
	    model.addAttribute("FanswerbTitle",FanswerbTitle);
	    model.addAttribute("FanswerbContent",FanswerbContent);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
	


@RequestMapping(value="/mine/imageUpload.do", method = RequestMethod.POST)
public void imageUpload(HttpServletRequest request,
        HttpServletResponse response, MultipartHttpServletRequest multiFile
        , @RequestParam MultipartFile upload) throws Exception{
    // 랜덤 문자 생성
    UUID uid = UUID.randomUUID();
    
    OutputStream out = null;
    PrintWriter printWriter = null;
    
    //인코딩
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    
    try{
        
        //파일 이름 가져오기
        String fileName = upload.getOriginalFilename();
        byte[] bytes = upload.getBytes();
        
        //이미지 경로 생성
        String path = "C:\\Users\\user\\git\\SS_MALL\\src\\main\\webapp\\img\\"; //fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
        String ckUploadPath = path + uid + "_" + fileName;
        File folder = new File(path);
        
        //해당 디렉토리 확인
        if(!folder.exists()){
            try{
                folder.mkdirs(); // 폴더 생성
            }catch(Exception e){
                e.getStackTrace();
            }
        }
        
        out = new FileOutputStream(new File(ckUploadPath));
        out.write(bytes);
        out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
        
        String callback = request.getParameter("CKEditorFuncNum");
        printWriter = response.getWriter();
        String fileUrl = "/ssmall/admin/mine/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;  // 작성화면
        
    // 업로드시 메시지 출력
      printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
      printWriter.flush();
        
    }catch(IOException e){
        e.printStackTrace();
    } finally {
      try {
       if(out != null) { out.close(); }
       if(printWriter != null) { printWriter.close(); }
      } catch(IOException e) { e.printStackTrace(); }
     }
    
    return;
	}

	
@RequestMapping(value="/mine/ckImgSubmit.do")
public void ckSubmit(@RequestParam(value="uid") String uid
                        , @RequestParam(value="fileName") String fileName
                        , HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException{
    
    //서버에 저장된 이미지 경로
    String path = "C:\\Users\\user\\git\\SS_MALL\\src\\main\\webapp\\img\\";

    String sDirPath = path + uid + "_" + fileName;

    File imgFile = new File(sDirPath);
    
    //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
    if(imgFile.isFile()){
        byte[] buf = new byte[1024];
        int readByte = 0;
        int length = 0;
        byte[] imgBuf = null;
        
        FileInputStream fileInputStream = null;
        ByteArrayOutputStream outputStream = null;
        ServletOutputStream out = null;
        
        try{
            fileInputStream = new FileInputStream(imgFile);
            outputStream = new ByteArrayOutputStream();
            out = response.getOutputStream();
            
            while((readByte = fileInputStream.read(buf)) != -1){
                outputStream.write(buf, 0, readByte);
            }
            
            imgBuf = outputStream.toByteArray();
            length = imgBuf.length;
            out.write(imgBuf, 0, length);
            out.flush();
            
        }catch(IOException e){
            e.printStackTrace();
        }finally {
            outputStream.close();
            fileInputStream.close();
            out.close();
        }
    }
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

