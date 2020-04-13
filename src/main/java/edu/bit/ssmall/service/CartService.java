package edu.bit.ssmall.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.CartMapper;
import edu.bit.ssmall.vo.CartViewVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductImageVO;

@Service
public class CartService {

	@Autowired
	CartMapper cartMapper;
	
	
	public MemberVO memberInfo(String m_id) {
		
		return cartMapper.memberInfo(m_id);		
	}

	public ProductImageVO productInfo(String p_number) {
		
		return cartMapper.productInfo(p_number);
	}


	public void addCart(String p_number, int m_number, String b_amount, int totalprice) {
		// TODO Auto-generated method stub
		cartMapper.addCart(p_number,m_number,b_amount,totalprice);
	}

	public ArrayList<CartViewVO> cartInfo(int m_number) {
		
		return cartMapper.cartInfo(m_number);
	}

	public void cartDelete(String c_id) {
		cartMapper.cartDelete(c_id);
		
	}

	public CartViewVO cartByCid(String c_id) {
		return cartMapper.cartByCid(c_id);
		
	}

	public ArrayList<CartViewVO> miniCartInfo(String m_id) {
		
		return cartMapper.miniCartInfo(m_id);
	}

	public String getP_name(int p_number) {
		// TODO Auto-generated method stub
		return cartMapper.getP_name(p_number);
	}
	
}
