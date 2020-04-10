package edu.bit.ssmall.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

/*===========================페이징을 위한 카운트 ========================================================*/
	public int countMember() {
		
		return adminMapper.countMember();
	}
	public int countProduct() {
		
		return adminMapper.countProduct();
	}
	
	public int countBuy(String m_number) {
		
		return adminMapper.countBuy(m_number);
	}
	
	public int countRefund(String m_number) {
		
		return adminMapper.countRefund(m_number);
	}
	
	public int countSearchMember(String search) {
		
		return adminMapper.countSearchMember(search);
	}

/*===========================페이징처리 ========================================================*/	
	
	public ArrayList<ProductVO> productList(int startNum , int endNum) {
		System.out.println("상품 전체리스트");
		return adminMapper.productList(startNum,endNum);
	}
		
	public ArrayList<MemberVO> memberList(int startNum , int endNum) {
		System.out.println("회원 전체리스트");
		
		return adminMapper.memberList(startNum,endNum);
	}
	
	public ArrayList<BuyVO> buyInfo(String m_number, int startNum , int endNum) {
		System.out.println("회원의 구매 리스트");
		
		return adminMapper.buyInfo(m_number,startNum, endNum);
	}
	public ArrayList<RefundVO> refundInfo(String m_number, int startNum, int endNum) {
		System.out.println("회원의 환불 리스트");
		return adminMapper.refundInfo(m_number,startNum, endNum);
	}
	
	public List<MemberVO> searchMemberList(int startNum, int endNum, String search) {
		System.out.println("회원의 검색 후  리스트");
		return adminMapper.searchMemberList(startNum,endNum, search);
	}
	
/*===========================회원관리========================================================*/	
	
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
		
		System.out.println("해당회원 1:1문의내역");
		
		return adminMapper.requestList(m_number);
	}
	
	public ArrayList<BoardVO> asList(String m_number) {
		
		System.out.println("해당회원 AS문의내역");
		
		return adminMapper.asList(m_number);
	}
	
	public ArrayList<MemberVO> adminList() {
		System.out.println("관리자리스트");
		return adminMapper.adminList();
	}
	
	public void updateAuthority(String m_number, String m_authority) {
		adminMapper.updateAuthority(m_number, m_authority);
		
	}
/*===========================검색했을때 처리========================================================*/		
	
	public ArrayList<MemberVO> memberSearch(String search) {
		
		return adminMapper.memberSearch(search);
	}
	
	public ArrayList<ProductVO> productSearch(String search) {
		// TODO Auto-generated method stub
		return adminMapper.productSearch(search);
	}
	
	
/*===========================상품 수정 처리========================================================*/	
	public ProductVO productOne(String p_number) {
		
		return adminMapper.productOne(p_number);
	}
	

	public void updateProduct(String p_number, String p_name, String p_brand, String p_price, String p_stock, String originFileName, int p_enabled) {
		adminMapper.updateProduct(p_number, p_name, p_brand, p_price, p_stock, originFileName, p_enabled);		
	}
	

	public void updateImage(String p_number, String originFileName, int i_type) {

		adminMapper.updateImage(p_number, originFileName,i_type);			
	}
	
	public void updateOnlyProduct(String p_number, String p_name, String p_brand, String p_price, String p_stock, int p_enabled) {
		adminMapper.updateOnlyProduct(p_number, p_name, p_brand, p_price, p_stock, p_enabled);
		
	}

	
	
}
