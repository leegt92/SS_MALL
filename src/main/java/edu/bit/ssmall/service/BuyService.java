package edu.bit.ssmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.BuyMapper;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.MemberVO;

@Service
public class BuyService {

	@Autowired
	BuyMapper buyMapper;
	
	public BuyVO productinfo(String p_number) {
		
		return buyMapper.productinfo(p_number);
	}

	public MemberVO memberInfo(String m_id) {
		return buyMapper.memberInfo(m_id);	
	}

	public String productName(String p_number) {
		
		return buyMapper.productName(p_number);
	}

	public void buyOne(String p_name, String e_mail, String b_amount, String b_totalprice) {
		String p_number = buyMapper.productNum(p_name);
		String m_number = buyMapper.memberNum(e_mail);
		System.out.println(b_amount);
		System.out.println(b_totalprice);
		
		buyMapper.buy(p_number,m_number,b_amount,b_totalprice);
		
	}

}
