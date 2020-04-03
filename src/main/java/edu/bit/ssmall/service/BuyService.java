package edu.bit.ssmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.bit.ssmall.mapper.BuyMapper;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductImageVO;

@Service
public class BuyService {

	@Autowired
	BuyMapper buyMapper;
	
	public ProductImageVO productinfo(String p_number) {
		
		return buyMapper.productinfo(p_number);
	}
	
	@Transactional
	public void buy(String m_number, String p_number, String amount, String totalprice, String b_kakao_tid, String b_memo,
			String b_name, String b_phonenum, String b_addr, int usePoint) {
		//구매 
		buyMapper.buy(m_number, p_number, amount, totalprice, b_kakao_tid, b_memo, b_name, b_phonenum, b_addr);
		
		//재고 및 판매량 업데이트		
		buyMapper.updateProduct(p_number,amount);
		
		//포인트 적립
		plusPoint(m_number, p_number, usePoint);
	
	}
	
	//회원 포인트 적립
	public void plusPoint(String m_number, String p_number, int usePoint) {

		//회원 포인트 적립
		ProductImageVO productImageVO = buyMapper.productinfo(p_number);
				
		System.out.println("상품 원래 가격  : " + productImageVO.getP_price());
			
		int point = (int) (productImageVO.getP_price() * 0.01);			
		System.out.println("적립 포인트 : " + point);
		buyMapper.plusPoint(m_number, point);	
		
	}
	
	//회원 포인트 사용
	public void minusPoint(int m_number, int usePoint) {

		if(usePoint != 0) {
			System.out.println("사용 포인트 : " + usePoint);
			buyMapper.minusPoint(m_number, usePoint);
		}
		System.out.println("포인트를 사용하지 않았습니다 \n 사용 포인트 : "+usePoint);
		
		
	}

	public MemberVO memberInfo(String m_id) {
		
		return buyMapper.memberInfo(m_id);
	}

}
