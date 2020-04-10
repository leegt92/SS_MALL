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
			String b_name, String b_phonenum, String b_addr) {
		//구매 
		buyMapper.buy(m_number, p_number, amount, totalprice, b_kakao_tid, b_memo, b_name, b_phonenum, b_addr);
		
		//재고 및 판매량 업데이트		
		buyMapper.updateProduct(p_number,amount);
		
		//회원 포인트적립
		int point = (int) Math.floor((double) Integer.parseInt(totalprice) * 0.01);
		
		if (point > 50000) {
			point = 50000;
		}
		System.out.println(point);
		
		buyMapper.plusPoint(m_number,point);
		
	}

	public MemberVO memberInfo(String m_id) {
		
		return buyMapper.memberInfo(m_id);
	}

}
