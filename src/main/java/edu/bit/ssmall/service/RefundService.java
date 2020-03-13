package edu.bit.ssmall.service;

import java.net.URISyntaxException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestClientException;

import edu.bit.ssmall.kakaopay.KakaoPay;
import edu.bit.ssmall.kakaopay.KakaoPayCancelVO;
import edu.bit.ssmall.mapper.RefundMapper;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.RefundVO;

@Service
@Transactional
public class RefundService {
	@Autowired
	KakaoPay kakaoPay;
	
	@Autowired
	RefundMapper refundMapper;
	
	//구매내역 조회
	public BuyVO getBuyInfo(String b_number) {
		
		
		return refundMapper.getBuyInfo(b_number);
	}

	//환불내역 추가 및 구매내역 삭제
	@Transactional
	public String addRefund(String tid, int m_number, int p_number,int b_number, int b_amount, int b_total, HttpServletRequest request) throws RestClientException, URISyntaxException {
		KakaoPayCancelVO kakaoPayCancelVO = kakaoPay.KakaoPayCancel(Integer.toString(b_amount), tid, request);
		if(kakaoPayCancelVO.equals(null)) {
			//취소가 안된다면 메인페이지로 
			return "/";
		}
		refundMapper.addRefund(m_number,p_number,b_amount,b_total);
		refundMapper.removeBuy(m_number,b_number);
		refundMapper.productRefund(p_number, b_amount);
		HttpSession session = request.getSession();
		session.setAttribute("success", "success");
		return "myPage_refundList";
	}

	//환불내역 확인
	public ArrayList<RefundVO> refundInfo(String m_id) {
		String m_number = refundMapper.getM_number(m_id);
		
		return refundMapper.refundInfo(m_number);
	}

	



	
}
