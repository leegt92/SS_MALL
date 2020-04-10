package edu.bit.ssmall.controller;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.google.gson.JsonObject;


import edu.bit.ssmall.page.Criteria;
import edu.bit.ssmall.page.PageMaker;
import edu.bit.ssmall.service.MypageService;
import edu.bit.ssmall.service.PageService;
import edu.bit.ssmall.service.RefundService;

import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.Product_BuyVO;
import edu.bit.ssmall.vo.RefundVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("mypage")
public class MyPageController {
	
	/*
	 * ============DB �닔�젙�궗�빆============================= 
	 * 1BUY�뀒�씠釉붿뿉 二쇰Ц諛곗넚�셿猷뚯뿬遺�(B_DONE) 異붽�
	 * 2BUY�뀒�씠釉붿뿉 二쇰Ц�닔�웾(B_AMOUNT) 異붽� 
	 * 3PRODUCT �뀒�씠釉붿뿉 P_IMAGE(���몴�궗吏�) 異붽� 
	 * 4BANSWERNO BOARD�뀒�씠釉붿뿉 異붽�. 異붽� �뼱�뵒�뿉 �떟蹂��뻽�뒗吏��뿉 愿��븳 寃�. 
	 * 5BANSWERED(�떟蹂��셿猷뚯뿬遺�) BOARD�뀒�씠釉붿뿉 異붽�.
	 * 6MEMBER(M_NUMBER)-BOARD(M_NUMBER)媛꾩뿉 二쇳궎-�룷由고궎 愿�怨꾩뿉�꽌 ON DELETE CASCADE 異붽� �쉶.�깉�떆 寃뚯떆湲��엳�쑝硫� �궘�젣�븞�릺�꽌 �궘�젣
		7MEMBER(M_NUMBER)-BUY(M_NUMBER)媛꾩뿉 二쇳궎-�룷由고궎 愿�怨꾩뿉�꽌 ON DELETE CASCADE 異붽� �쉶.�깉�떆 援щℓ�궡�뿭�엳�쑝硫� �궘�젣�븞�릺�꽌 援щℓ�궡�뿭�룄 �궘�젣
	 */
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	RefundService refundService;
	
	@Autowired
	PageService pageService;
	
	@RequestMapping(value = "/myPage", method =  {RequestMethod.GET,RequestMethod.POST})
	public String myPage(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			int m_point = mypageService.getMpoint(name);
			model.addAttribute("m_point", m_point);
			List<Product_BuyVO> p_b_vos = mypageService.getP_BVO(m_number);
			model.addAttribute("p_b_vos",p_b_vos);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "MyPage/myPage";

	}	
	
	@RequestMapping(value = "/myPage_shoppingList", method={RequestMethod.GET,RequestMethod.POST})
	public String myPage_shoppingList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			int m_point = mypageService.getMpoint(name);
			model.addAttribute("m_point", m_point);
			List<Product_BuyVO> p_b_vos = mypageService.getP_BVO(m_number);
			model.addAttribute("p_b_vos",p_b_vos);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "MyPage/myPage_shoppingList";

	}	
	
	@RequestMapping(value = "/myPage_orderedList", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage_orderedList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			int m_point = mypageService.getMpoint(name);
			model.addAttribute("m_point", m_point);
			List<Product_BuyVO> p_b_vos = mypageService.getOrderedP_BVO(m_number);
			model.addAttribute("p_b_vos",p_b_vos);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "MyPage/myPage_orderedList";

	}	
	
	@RequestMapping(value = "/myPage_askRequestView", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage_askRequestView(Criteria criteria, Model model, BoardVO boardVO) {
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
			int totalCount = mypageService.selectAskCountBoard(m_number);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<BoardVO> askRequestboards = mypageService.selectAskBoardListPage(m_number, startNum, endNum);
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

		return "MyPage/myPage_askRequestView";

	}
	
	@RequestMapping(value = "/myPage_askRequestView2", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage_askRequestView2(Criteria criteria, Model model, BoardVO boardVO) {
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
			int totalCount = mypageService.selectAskCountBoard(m_number);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<BoardVO> askRequestboards = mypageService.selectAskBoardListPage(m_number, startNum, endNum);
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

		return "MyPage/myPage_askRequestView2";

	}
	
	@RequestMapping(value = "/myPage_aSRequestView", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage_aSRequestView(Criteria criteria, Model model, BoardVO boardVO) {
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
			int totalCount = mypageService.selectASCountBoard(m_number);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<BoardVO> aSRequestboards = mypageService.selectASBoardListPage(m_number, startNum, endNum);
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

		return "MyPage/myPage_aSRequestView";

	}
	
	@RequestMapping(value = "/myPage_askRequest", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage_askRequest(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    
	    String bTitle = request.getParameter("bTitle");
	    String bContent = request.getParameter("bContent");
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number); 
			String bName = mypageService.getMname(name);
			model.addAttribute("bName", bName);
			if(bTitle != null && bContent != null) {
				mypageService.insertAsk(bName, bTitle, bContent, m_number);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "MyPage/myPage_askRequest";

	}	
	
	@RequestMapping(value = "/mypage/myPage_askRequest_back", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage_askRequest_back(Criteria criteria, Model model, HttpServletRequest request, BoardVO boardVO) {
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
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			String bName = mypageService.getMname(name);
			model.addAttribute("bName", bName);
		
			if(bTitle != null && bContent != null) {
				mypageService.insertAsk(bName, bTitle, bContent, m_number);
				
			}
			int totalCount = mypageService.selectAskCountBoard(m_number);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<BoardVO> askRequestboards = mypageService.selectAskBoardListPage(m_number, startNum, endNum);
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
	    
		   
		/*
		 * try { file.transferTo(new File(filePath + fileName)); } catch(Exception e) {
		 * System.out.println("업로드 오류"); }
		 */
	
			return "MyPage/myPage_askRequestView";
	
	}
	
	@RequestMapping(value = "/myPage_askAS", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage_askAS(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    
	    String bTitle = request.getParameter("bTitle");
	    String bContent = request.getParameter("bContent");
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			String bName = mypageService.getMname(name);
			model.addAttribute("bName", bName);
			
			if(bTitle != null && bContent != null) {
				mypageService.insertAS(bName, bTitle, bContent, m_number);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "MyPage/myPage_askAS";

	}
	
	@RequestMapping(value = "/myPage_askAS_back", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage_askAS_back(Model model, Criteria criteria, HttpServletRequest request, BoardVO boardVO) {
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
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			String bName = mypageService.getMname(name);
			model.addAttribute("bName", bName);
			
			if(bTitle != null && bContent != null) {
				mypageService.insertAS(bName, bTitle, bContent, m_number);
			}
			int totalCount = mypageService.selectASCountBoard(m_number);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<BoardVO> aSRequestboards = mypageService.selectASBoardListPage(m_number, startNum, endNum);
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

		return "MyPage/myPage_aSRequestView";

	}
	
	
	
	@RequestMapping(value = "/myPage_reviseInformation", method = {RequestMethod.GET, RequestMethod.POST})
	public String myPage_reviseInformation(Model model,HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
		String pw = request.getParameter("m_password"); 
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			String m_pw = mypageService.getMpw(name);
			String m_id = mypageService.getMid(name);
			String m_email = mypageService.getMemail(name);
			String m_naver = mypageService.getMnaver(name);
			String m_kakao = mypageService.getMkakao(name);
			model.addAttribute("m_email",m_email);
			model.addAttribute("m_id",m_id);
			model.addAttribute("m_number", m_number);
			model.addAttribute("m_pw", m_pw);
			String m_name2 = mypageService.getMname(name);
			model.addAttribute("m_name2",m_name2);
			int m_age3 = mypageService.getMage(name);
			model.addAttribute("m_age3",m_age3);
			String m_adress2 = mypageService.getMadress(name);
			model.addAttribute("m_adress2",m_adress2);
			String m_phonenum2 = mypageService.getMphonenum(name);
			model.addAttribute("m_phonenum2",m_phonenum2);
			
			 if(m_naver != null || m_kakao != null) {
				 return "MyPage/myPage_reviseInformation2-2";
			 }
			 
			 if(passwordEncoder.matches(pw, m_pw)) {
				 return "MyPage/myPage_reviseInformation2-2";
			 }else {
				 return "MyPage/checkPwError";
			 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "MyPage/myPage_reviseInformation";

	}
	
	@RequestMapping(value = "/myPage_reviseInformation2", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage_reviseInformation2(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    
	    String m_password = request.getParameter("m_password");
	    String m_checkpassword = request.getParameter("m_checkpassword");
	    String m_name = request.getParameter("m_name");
	    String m_age = request.getParameter("m_age");
	    String m_adress = request.getParameter("m_adress");
	    String m_phonenum = request.getParameter("m_phonenum");
	    String m_receive_email = request.getParameter("m_receive_email");
	    if(m_name == "" && m_age == "" && m_adress == "" && m_phonenum == "" && m_password == "" && m_receive_email == null) {
	    	return "MyPage/checkPwError3";
	    }
	    
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			String m_id = mypageService.getMid(name);
			model.addAttribute("m_id",m_id);
			String m_email = mypageService.getMemail(name);
			model.addAttribute("m_email",m_email);
			String m_name2 = mypageService.getMname(name);
			model.addAttribute("m_name2",m_name2);
			int m_age3 = mypageService.getMage(name);
			model.addAttribute("m_age3",m_age3);
			String m_adress2 = mypageService.getMadress(name);
			model.addAttribute("m_adress2",m_adress2);
			String m_phonenum2 = mypageService.getMphonenum(name);
			model.addAttribute("m_phonenum2",m_phonenum2);
			
			if(m_password != "") {
				if(m_password.equals(m_checkpassword)) {
					String hashpw = passwordEncoder.encode(m_password); 
					mypageService.updateMpassword(hashpw, name);
				}
				else {
					return "MyPage/myPage_reviseInformation2";
				}
			}
			if(m_name != "") {
		    	mypageService.updateMname(m_name, name);
		    }
			if(m_age != "") {
				int m_age2 = Integer.parseInt(m_age);
		    	mypageService.updateMage(m_age2, name);
		    }
			if(m_adress != "") {
		    	mypageService.updateMadress(m_adress, name);
		    }
			if(m_phonenum != "") {
		    	mypageService.updateMphonenum(m_phonenum, name);
		    }
			if(m_receive_email.equals("0")) {
				mypageService.updateMreceiveToYes(name);
			}
			if(m_receive_email.equals("1")) {
				mypageService.updateMreceiveToNo(name);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "MyPage/myPage_reviseInformation2";

	}
	
	@RequestMapping(value = "/myPage_reviseInformation2_2", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage_reviseInformation2_2(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    
	    String m_age = request.getParameter("m_age");
	    String m_adress = request.getParameter("m_adress");
	    String m_phonenum = request.getParameter("m_phonenum");
	    String m_receive_email = request.getParameter("m_receive_email");
	    if(m_age == "" && m_adress == "" && m_phonenum == ""  && m_receive_email == null) {
	    	return "MyPage/checkPwError3_2";
	    }
	    
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			String m_id = mypageService.getMid(name);
			model.addAttribute("m_id",m_id);
			String m_email = mypageService.getMemail(name);
			model.addAttribute("m_email",m_email);
			String m_name2 = mypageService.getMname(name);
			model.addAttribute("m_name2",m_name2);
			int m_age3 = mypageService.getMage(name);
			model.addAttribute("m_age3",m_age3);
			String m_adress2 = mypageService.getMadress(name);
			model.addAttribute("m_adress2",m_adress2);
			String m_phonenum2 = mypageService.getMphonenum(name);
			model.addAttribute("m_phonenum2",m_phonenum2);
			
			if(m_age != "") {
				int m_age2 = Integer.parseInt(m_age);
		    	mypageService.updateMage(m_age2, name);
		    }
			if(m_adress != "") {
		    	mypageService.updateMadress(m_adress, name);
		    }
			if(m_phonenum != "") {
		    	mypageService.updateMphonenum(m_phonenum, name);
		    }
			if(m_receive_email.equals("0")) {
				mypageService.updateMreceiveToYes(name);
			}
			if(m_receive_email.equals("1")) {
				mypageService.updateMreceiveToNo(name);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "MyPage/myPage_reviseInformation2-2";

	}
	
	@RequestMapping(value = "/myPage_reviseInformation3", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage_reviseInformation3(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "MyPage/myPage_reviseInformation3";

	}
	
	@RequestMapping(value="/pwChange" ,method = {RequestMethod.GET,RequestMethod.POST})
	public String pwChange(HttpServletRequest request,MemberVO memberVO, Errors errors, Model model, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		
		String hashpw = passwordEncoder.encode(memberVO.getM_password());
		memberVO.setM_password(hashpw); // �븫�샇�솕 �빐�꽌 ���옣�븳�떎.
		
		return "MyPage/myPage_reviseInformation2";
	}
	
	@RequestMapping(value = "/withdrawal.do", method =  {RequestMethod.GET,RequestMethod.POST})
	public String withdraw(Model model) {
		System.out.println("GKGKGKGKGK!!!!!!!!");
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    Object principal = auth.getPrincipal();
		 
		    String name = "";
		    if(principal != null) {
		        name = auth.getName();
		    }
		    
		    try {
				int m_number = mypageService.getMnum(name);
				model.addAttribute("m_number", m_number);
				mypageService.withdrawMember(name);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    return "MyPage/myPage_reviseInformation4";
	}
	
	@RequestMapping(value = "/myPage_askRequest2", method =  {RequestMethod.GET,RequestMethod.POST})
	public String myPage_askRequest2(Model model, HttpServletRequest request) {
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
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			
			if(bTitle != null && bContent != null) {
				mypageService.updateAskAS(bTitle, bContent, bId);
			}
			String FbTitle = mypageService.selectFbTitle(bId);
		    String FbContent = mypageService.selectFbContent(bId);
			model.addAttribute("FbTitle",FbTitle);
		    model.addAttribute("FbContent",FbContent);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "MyPage/myPage_askRequest2";

	}
	
	@RequestMapping(value = "/myPage_askRequest2_back", method =  {RequestMethod.GET,RequestMethod.POST})
	public String myPage_askRequest2_back(Criteria criteria, Model model, HttpServletRequest request, BoardVO boardVO) {
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
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			
			if(bTitle != null && bContent != null) {
				mypageService.updateAskAS(bTitle, bContent, bId);
			}
			int totalCount = mypageService.selectAskCountBoard(m_number);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<BoardVO> askRequestboards = mypageService.selectAskBoardListPage(m_number, startNum, endNum);
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

		return "MyPage/myPage_askRequestView";

	}
	
	@RequestMapping(value = "/myPage_askAS2", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage_askAS2(Model model, HttpServletRequest request) {
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
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			
			if(bTitle != null && bContent != null) {
				mypageService.updateAskAS(bTitle, bContent, bId);
			}
			String FbTitle = mypageService.selectFbTitle(bId);
		    String FbContent = mypageService.selectFbContent(bId);
			model.addAttribute("FbTitle",FbTitle);
		    model.addAttribute("FbContent",FbContent);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "MyPage/myPage_askAS2";

	}
	
	@RequestMapping(value = "/myPage_aSRequest2_back", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage_aSRequest2_back(Criteria criteria, Model model, HttpServletRequest request, BoardVO boardVO) {
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
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			
			if(bTitle != null && bContent != null) {
				mypageService.updateAskAS(bTitle, bContent, bId);
			}
			int totalCount = mypageService.selectASCountBoard(m_number);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<BoardVO> aSRequestboards = mypageService.selectASBoardListPage(m_number, startNum, endNum);
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

		return "MyPage/myPage_aSRequestView";

	}
	
	@RequestMapping(value = "/delete.do", method = {RequestMethod.GET,RequestMethod.POST})
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
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			int totalCount = mypageService.selectAskCountBoard(m_number);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<BoardVO> askRequestboards = mypageService.selectAskBoardListPage(m_number, startNum, endNum);
			model.addAttribute("askRequestboards", askRequestboards);
			List<BoardVO> askRequestboardsAnswers = new ArrayList<BoardVO>(); 
			for(int i=0; i<askRequestboards.size(); i++) { 
				BoardVO answer =mypageService.getAllAskRequestAnswer(askRequestboards.get(i).getBid());
				askRequestboardsAnswers.add(i, answer); 
				}
			  model.addAttribute("askRequestboardsAnswers", askRequestboardsAnswers);
			
				mypageService.deleteAskAS(bId);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	    return "redirect:/mypage/myPage_askRequestView";


	}
	
	@RequestMapping(value = "/delete2.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String delete2(Criteria criteria, Model model, HttpServletRequest request, BoardVO boardVO) {
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
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
			int totalCount = mypageService.selectAskCountBoard(m_number);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("pageMaker", pageMaker);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			List<BoardVO> askRequestboards = mypageService.selectAskBoardListPage(m_number, startNum, endNum);
			model.addAttribute("askRequestboards", askRequestboards);
			List<BoardVO> askRequestboardsAnswers = new ArrayList<BoardVO>(); 
			for(int i=0; i<askRequestboards.size(); i++) { 
				BoardVO answer =mypageService.getAllAskRequestAnswer(askRequestboards.get(i).getBid());
				askRequestboardsAnswers.add(i, answer); 
				}
			  model.addAttribute("askRequestboardsAnswers", askRequestboardsAnswers);
			
				mypageService.deleteAskAS(bId);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	    return "redirect:/myPage_aSRequestView";
	}
	
	 @RequestMapping(value="/mine/imageUpload.do", method =  {RequestMethod.GET,RequestMethod.POST})
	    public void imageUpload(HttpServletRequest request,
	            HttpServletResponse response, MultipartHttpServletRequest multiFile
	            , @RequestParam MultipartFile upload) throws Exception{
		 System.out.println("가나다라마");
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
	            String fileUrl = "/ssmall/mypage/mine/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;  // 작성화면
	            
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
