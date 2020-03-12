package edu.bit.ssmall.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.bit.ssmall.mapper.RefundMapper;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.RefundVO;

@Service
public class RefundService {
	
	@Autowired
	RefundMapper refundMapper;
	
	//구매내역 조회
	public BuyVO getBuyInfo(String p_name, String m_id) {
		
		String m_number = refundMapper.getP_number(p_name); //회원번호 추출
		String p_number = refundMapper.getM_number(m_id); //상품번호 추출
		
		return refundMapper.getBuyInfo(m_number, p_number);
	}

	//환불내역 추가 및 구매내역 삭제
	@Transactional
	public void addRefund(int m_number, int p_number, int b_amount, int b_total) {
		
		refundMapper.addRefund(m_number,p_number,b_amount,b_total);
		refundMapper.removeBuy(m_number,p_number);
		refundMapper.productRefund(p_number, b_amount);
	}

	//환불내역 확인
	public ArrayList<RefundVO> refundInfo(String m_id) {
		String m_number = refundMapper.getM_number(m_id);
		
		return refundMapper.refundInfo(m_number);
	}

	



	
}
