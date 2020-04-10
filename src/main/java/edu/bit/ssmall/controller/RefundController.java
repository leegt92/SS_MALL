package edu.bit.ssmall.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bit.ssmall.iamport.IamPort;
import edu.bit.ssmall.service.RefundService;
import edu.bit.ssmall.vo.BuyVO;

@Controller
@RequestMapping("refund")
public class RefundController {
	
	@Autowired
	IamPort iamport;
	
	@Autowired
	RefundService refundService;
	
	//환불하기
	@RequestMapping(value="refund", method= {RequestMethod.GET,RequestMethod.POST})
	public String refund(HttpServletRequest request, HttpServletResponse response, Principal principal, Model model) throws Exception{		
		System.out.println("refund 시작");
		String imp_uid = request.getParameter("imp_uid"); //환불하려는 구매번호
		
		System.out.println("imp_uid : "+imp_uid);

		ArrayList<BuyVO> buyVO = refundService.getBuyInfo(imp_uid); //구매내역 조회
		System.out.println(buyVO);
		
				
		if(iamport.cancel(imp_uid) == null) {
			HttpSession session = request.getSession();
			session.setAttribute("fail", "fail");
			
			return "redirect:/mypage/myPage_orderedList";			
		}
		for (int i = 0; i < buyVO.size(); i++) {
			int m_number = buyVO.get(i).getM_number();
			int p_number = buyVO.get(i).getP_number();
			int b_number = buyVO.get(i).getB_number();
			int b_amount = buyVO.get(i).getB_amount();
			int b_total = buyVO.get(i).getB_total();
		
			refundService.addRefund(m_number,p_number,b_number,b_amount,b_total, imp_uid);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("success", "success");

		return "redirect:/mypage/myPage_refundList";
	
	}
	
}

	
