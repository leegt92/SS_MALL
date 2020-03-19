package edu.bit.ssmall.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.AdminMapper;
import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductVO;
import edu.bit.ssmall.vo.RefundVO;

@Service
public class AdminService {
	
	@Autowired
	AdminMapper adminMapper;
	
	public int countMember() {
		
		return adminMapper.countMember();
	}
	public int countProduct() {
		
		return adminMapper.countProduct();
	}
	
	public ArrayList<ProductVO> productList(int startNum , int endNum) {
		System.out.println("상품 전체리스트");
		return adminMapper.productList(startNum,endNum);
	}
		
	public ArrayList<MemberVO> memberList(int startNum , int endNum) {
		System.out.println("회원 리스트");
		
		return adminMapper.memberList(startNum,endNum);
	}

	public MemberVO memberInfo(String m_number) {
		System.out.println("해당회원 정보");
		return adminMapper.memberInfo(m_number);
	}

	public ArrayList<BuyVO> buyList(String m_number) {
		System.out.println("해당회원 구매내역");
		return adminMapper.buyList(m_number);
	}
	public ArrayList<RefundVO> refundList(String m_number) {
		
		System.out.println("해당회원 환불내역");
		
		return adminMapper.refundList(m_number);
	}
	public ArrayList<BoardVO> requestList(String m_number) {
		
		System.out.println("해당회원 환불내역");
		
		return adminMapper.requestList(m_number);
	}
	
	public ArrayList<BoardVO> asList(String m_number) {
		
		System.out.println("해당회원 환불내역");
		
		return adminMapper.asList(m_number);
	}

}
