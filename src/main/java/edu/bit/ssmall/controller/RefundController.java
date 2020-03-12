package edu.bit.ssmall.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bit.ssmall.kakaopay.KakaoPay;
import edu.bit.ssmall.kakaopay.KakaoPayCancelVO;
import edu.bit.ssmall.service.RefundService;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.RefundVO;

@Controller
public class RefundController {
	
	@Autowired
	KakaoPay kakaopay;
	
	@Autowired
	RefundService refundService;
	
	//환불하기
	@RequestMapping(value="refund", method= {RequestMethod.GET,RequestMethod.POST})
	public String refund(HttpServletRequest request, HttpServletResponse response, Principal principal, Model model) throws Exception{		
		String p_name = request.getParameter("p_name"); //환불하려는 상품명
		String m_id = principal.getName(); //회원 id 
		System.out.println("p_name : "+p_name);
		System.out.println("m_id : "+m_id);

		BuyVO buyVO = refundService.getBuyInfo(p_name, m_id); //구매내역 조회
		String amount = Integer.toString(buyVO.getB_amount());
		String tid = buyVO.getB_kakao_tid();
		
		KakaoPayCancelVO kakaoPayCancelVO = kakaopay.KakaoPayCancel(amount, tid, request); //취소시작
		
		if(kakaoPayCancelVO.equals(null)) {
			//취소가 안된다면 메인페이지로 
			return "redirect:/";
		}
		System.out.println(kakaoPayCancelVO);
		
		//취소가 되면 db작업 환불테이블 추가 구매테이블 삭제 상품 재고증가  판매량 감소
		refundService.addRefund(buyVO.getM_number(),buyVO.getP_number(),buyVO.getB_amount(), buyVO.getB_total());
		
		
		//환불내역리스트로
		return "redirect:/myPage_refundList";
	}

	@RequestMapping(value="myPage_refundList", method= {RequestMethod.GET,RequestMethod.POST})
	public String myPage_refundList(HttpServletRequest request, HttpServletResponse response, Principal principal, Model model) throws Exception{		
		String m_id = principal.getName();
		
		ArrayList<RefundVO> refundVO = refundService.refundInfo(m_id);
		System.out.println(refundVO);
		
	
		model.addAttribute("refund", refundVO);
		
		
		return "myPage_refundList";
	}
}