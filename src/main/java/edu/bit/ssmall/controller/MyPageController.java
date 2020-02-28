package edu.bit.ssmall.controller;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.bit.ssmall.page.PageMaker;
import edu.bit.ssmall.page.Criteria;
import edu.bit.ssmall.service.MypageService;
import edu.bit.ssmall.valid.MemberValidator;
import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MyPageController {
	
	/*
	 * ============DB 수정사항============================= 1BUY테이블에 주문배송완료여부(B_DONE) 추가
	 * 2BUY테이블에 주문수량(B_AMOUNT) 추가 3PRODUCT 테이블에 P_IMAGE(대표사진) 추가 4BANSWERNO
	 * BOARD테이블에 추가. 추가 어디에 답변했는지에 관한 것. 5BANSWERED(답변완료여부) BOARD테이블에 추가.
	 * 6MEMBER(M_NUMBER)-BOARD(M_NUMBER)간에 주키-포린키 관계에서 ON DELETE CASCADE 추가
		7MEMBER(M_NUMBER)-BUY(M_NUMBER)간에 주키-포린키 관계에서 ON DELETE CASCADE 추가
	 */
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	MypageService mypageService;
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
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
				List<Integer> b_numbers = mypageService.getOrderedBnumbers(m_number);
				model.addAttribute("b_numbers",b_numbers);
				List<String> p_images = new ArrayList<String>();
				List<String> p_names = new ArrayList<String>();
				List<Integer> p_prices = new ArrayList<Integer>();
				List<Date> b_dates = new ArrayList<Date>();
				List<Integer> b_amounts = new ArrayList<Integer>();
				for(int i=0; i < b_numbers.size(); i++) {
					String p_image = mypageService.getPimage(b_numbers.get(i));
					p_images.add(p_image);
					String p_name = mypageService.getPname(b_numbers.get(i));
					p_names.add(p_name);
					int p_price = mypageService.getPprice(b_numbers.get(i));
					p_prices.add(p_price);
					Date b_date = mypageService.getBdate(b_numbers.get(i));
					b_dates.add(b_date);
					int b_amount = mypageService.getBamount(b_numbers.get(i));
					b_amounts.add(b_amount);
				}
				model.addAttribute("p_images",p_images);
				model.addAttribute("p_names",p_names);
				model.addAttribute("p_prices",p_prices);
				model.addAttribute("b_dates",b_dates);
				model.addAttribute("b_amounts",b_amounts);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return "myPage";

	}	
	
	@RequestMapping(value = "/myPage_shoppingList", method = RequestMethod.GET)
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
			List<Integer> b_numbers = mypageService.getBnumbers(m_number);
			model.addAttribute("b_numbers",b_numbers);
			List<String> p_images = new ArrayList<String>();
			List<String> p_names = new ArrayList<String>();
			List<Integer> p_prices = new ArrayList<Integer>();
			List<Date> b_dates = new ArrayList<Date>();
			List<Integer> b_amounts = new ArrayList<Integer>();
			for(int i=0; i < b_numbers.size(); i++) {
				String p_image = mypageService.getPimage(b_numbers.get(i));
				p_images.add(p_image);
				String p_name = mypageService.getPname(b_numbers.get(i));
				p_names.add(p_name);
				int p_price = mypageService.getPprice(b_numbers.get(i));
				p_prices.add(p_price);
				Date b_date = mypageService.getBdate(b_numbers.get(i));
				b_dates.add(b_date);
				int b_amount = mypageService.getBamount(b_numbers.get(i));
				b_amounts.add(b_amount);
			}
			model.addAttribute("p_images",p_images);
			model.addAttribute("p_names",p_names);
			model.addAttribute("p_prices",p_prices);
			model.addAttribute("b_dates",b_dates);
			model.addAttribute("b_amounts",b_amounts);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "myPage_shoppingList";

	}	
	
	@RequestMapping(value = "/myPage_orderedList", method = RequestMethod.GET)
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
			List<Integer> b_numbers = mypageService.getOrderedBnumbers(m_number);
			model.addAttribute("b_numbers",b_numbers);
			List<String> p_images = new ArrayList<String>();
			List<String> p_names = new ArrayList<String>();
			List<Integer> p_prices = new ArrayList<Integer>();
			List<Date> b_dates = new ArrayList<Date>();
			List<Integer> b_amounts = new ArrayList<Integer>();
			for(int i=0; i < b_numbers.size(); i++) {
				String p_image = mypageService.getPimage(b_numbers.get(i));
				p_images.add(p_image);
				String p_name = mypageService.getPname(b_numbers.get(i));
				p_names.add(p_name);
				int p_price = mypageService.getPprice(b_numbers.get(i));
				p_prices.add(p_price);
				Date b_date = mypageService.getBdate(b_numbers.get(i));
				b_dates.add(b_date);
				int b_amount = mypageService.getBamount(b_numbers.get(i));
				b_amounts.add(b_amount);
			}
			model.addAttribute("p_images",p_images);
			model.addAttribute("p_names",p_names);
			model.addAttribute("p_prices",p_prices);
			model.addAttribute("b_dates",b_dates);
			model.addAttribute("b_amounts",b_amounts);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "myPage_orderedList";

	}	
	
	@RequestMapping(value = "/myPage_askRequestView", method = RequestMethod.GET)
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

		return "myPage_askRequestView";

	}
	
	@RequestMapping(value = "/myPage_askRequestView2", method = RequestMethod.GET)
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

		return "myPage_askRequestView2";

	}
	
	@RequestMapping(value = "/myPage_aSRequestView", method = RequestMethod.GET)
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

		return "myPage_aSRequestView";

	}
	
	@RequestMapping(value = "/myPage_askRequest", method = RequestMethod.GET)
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
			
			if(bTitle != null && bContent != null) {
				mypageService.insertAsk(bTitle, bContent, m_number);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "myPage_askRequest";

	}	
	
	@RequestMapping(value = "/myPage_askAS", method = RequestMethod.GET)
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
			
			if(bTitle != null && bContent != null) {
				mypageService.insertAS(bTitle, bContent, m_number);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "myPage_askAS";

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
			
			 if(passwordEncoder.matches(pw, m_pw)) {
				 return "myPage_reviseInformation2";
			 }else {
				 return "checkPwError";
			 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "myPage_reviseInformation";

	}
	
	@RequestMapping(value = "/myPage_reviseInformation2", method = RequestMethod.POST)
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
	    	return "checkPwError3";
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
					return "myPage_reviseInformation2";
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

		return "myPage_reviseInformation2";

	}
	
	@RequestMapping(value = "/myPage_reviseInformation3", method = RequestMethod.POST)
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

		return "myPage_reviseInformation3";

	}
	
	@RequestMapping("/pwChange")
	public String pwChange(HttpServletRequest request,MemberVO memberVO, Errors errors, Model model, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		
		String hashpw = passwordEncoder.encode(memberVO.getM_password());
		memberVO.setM_password(hashpw); // 암호화 해서 저장한다.
		
		return "myPage_reviseInformation2";
	}
	
	@RequestMapping(value = "/withdrawal.do", method = RequestMethod.GET)
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
	return "myPage_reviseInformation4";
	}
	
	@RequestMapping(value = "/myPage_askRequest2", method = RequestMethod.GET)
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
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "myPage_askRequest2";

	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
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

	    return "redirect:myPage_askRequestView";


	}
	
	
	
}
