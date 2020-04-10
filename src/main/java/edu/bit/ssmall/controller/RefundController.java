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
import edu.bit.ssmall.noticepage.Criteria;
import edu.bit.ssmall.noticepage.PageMaker;
import edu.bit.ssmall.service.RefundService;
import edu.bit.ssmall.vo.BoardNoticeVO;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.RefundVO;

@Controller
@RequestMapping("refund")
public class RefundController {
	
	@Autowired
	KakaoPay kakaopay;
	
	@Autowired
	RefundService refundService;
	
	//환불하기
	@RequestMapping(value="refund", method= {RequestMethod.GET,RequestMethod.POST})
	public String refund(HttpServletRequest request, HttpServletResponse response, Principal principal, Model model) throws Exception{		
		System.out.println("refund 시작");
		String b_number = request.getParameter("b_number"); //환불하려는 구매번호
		
		System.out.println("b_number : "+b_number);
		

		BuyVO buyVO = refundService.getBuyInfo(b_number); //구매내역 조회
		System.out.println(buyVO);
		
		String amount = Integer.toString(buyVO.getB_amount());
		String tid = buyVO.getB_kakao_tid();
		
		KakaoPayCancelVO kakaoPayCancelVO = kakaopay.KakaoPayCancel(amount, tid, request); //취소시작
		
		
		System.out.println(kakaoPayCancelVO);
		
		//취소가 되면 db작업 환불테이블 추가 구매테이블 삭제 상품 재고증가  판매량 감소
		String result = refundService.addRefund(tid,buyVO.getM_number(),buyVO.getP_number(),buyVO.getB_number(),buyVO.getB_amount(), buyVO.getB_total(), request);
		
		return "redirect:/"+result;
	}
	


	
}