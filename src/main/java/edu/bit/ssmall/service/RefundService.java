package edu.bit.ssmall.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.bit.ssmall.mapper.BuyMapper;
import edu.bit.ssmall.mapper.RefundMapper;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.ProductImageVO;
import edu.bit.ssmall.vo.RefundVO;

@Service
public class RefundService {
	
	
	@Autowired
	RefundMapper refundMapper;
	
	@Autowired
	BuyMapper buyMapper;
	
	//구매내역 조회
	public ArrayList<BuyVO> getBuyInfo(String imp_uid) {
		
		
		return refundMapper.getBuyInfo(imp_uid);
	}

	//환불내역 추가 및 구매내역 삭제
	@Transactional
	public void addRefund(int m_number, int p_number, int b_number, int b_amount, int b_total, String imp_uid)  {
		
		refundMapper.addRefund(m_number,p_number,b_amount,b_total);
		
		ProductImageVO productImageVO = buyMapper.productinfo(Integer.toString(p_number));
		
		int point = (int)(productImageVO.getP_price() * 0.01 * b_amount);
		
		System.out.println("포인트회수 : "+ point);		
		refundMapper.minusPoint(m_number, point); //포인트회수
		refundMapper.removeBuy(m_number,b_number); //구매내역 삭제
		refundMapper.productRefund(p_number, b_amount); //상품재고량 판매량 업데이트
	}

	//환불내역 확인
	public ArrayList<RefundVO> refundInfo(String m_id) {
		String m_number = refundMapper.getM_number(m_id);
		
		return refundMapper.refundInfo(m_number);
	}

	



	
}
