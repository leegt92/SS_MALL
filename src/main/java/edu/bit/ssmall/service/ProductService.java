package edu.bit.ssmall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.ProductMapper;
import edu.bit.ssmall.page.Criteria;
import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductImageVO;
import edu.bit.ssmall.vo.ProductReplyVO;
import edu.bit.ssmall.vo.ProductVO;

@Service
public class ProductService {

	@Inject
	ProductMapper productMapper;
	
	public List<ProductImageVO> selectProductList() {		
		return productMapper.selectProductList();
	}
	
	public List<ProductImageVO> selectProductOne(String p_number) {		
		return productMapper.selectProductOne(p_number);
	}
	 
	public List<ProductImageVO> selectProductListAmount() {	  
		return productMapper.selectProductListAmount(); 
	}
	 
	public List<ProductReplyVO> productReply(String p_number){		
		return productMapper.productReply(p_number);
	}
	
	public void productReplyWrite(ProductReplyVO productReplyVO){	
		productMapper.productReplyWrite(productReplyVO);
	}
	
	public void updateBoard(String btitle, String bcontent, String bid ) {
		productMapper.updateBoard(btitle,bcontent,bid);
	}
	
	public void replyDelete(BoardVO boardVO){
		productMapper.replyDelete(boardVO);
	}


	public List<BoardVO> boardVO() {
			
		return productMapper.boardVO();
	}

	public BoardVO boardOne(String bid) {
		// TODO Auto-generated method stub
		return productMapper.boardOne(bid);
	}
	//구매 하기위해 하나 만들었음
	public ProductVO productOne(String p_number) {
			
		return productMapper.productOne(p_number);
	}

	public int principalGetMid(String m_id) {
		
		return productMapper.principalGetMid(m_id);
	}

	public int checkMid(String bid) {
		// TODO Auto-generated method stub
		return productMapper.checkMid(bid);
	}

	public void writeReplyReply(ProductReplyVO productReplyVO) {
		productMapper.updateShape(productReplyVO);//대댓글을 달 시, bstep을 +1해주기 위해.
		productMapper.insertReply(productReplyVO);
		
		//bstep이란 댓글이 a,b,c 3개가 위에서부터 순서대로 있을때, 1이라는 대댓글을 a에 달게되면
		//a		a	처럼 대댓글이 댓글들 사이에 끼어들어야 하기 때문에, 댓글의 대상이 되는 a와
		//b		1	대댓글인 1을 제외한 나머지를 전부 한칸씩 내려서 공간을 만들고, 거기에 1을 넣을 필요가 있다.
		//c		b	그렇게 공간을 만들기 위해 bstep을 a와 1을 제외하고 전부 +1해주는것.
		//		c
		//글목록 불러오는부분의 sql구문 고쳐야함. bstep에 의해 순서가 정해지도록.
		
		
	}
	//대댓글을 달기위해 게시글번호를 가지고 board테이블에서 상품번호가 일치하는 bstep 뽑아옴
	public int checkBstep(String bid) {
		return productMapper.checkBstep(bid);		
	}
	//대댓글을 달기위해 게시글번호를 가지고 board테이블에서 상품번호가 일치하는 bindent 뽑아옴
	public int checkBindent(String bid) {
		return productMapper.checkBindent(bid);		
	}
	//페이징시 전체상품의 갯수를 확인하기 위해.
	public int selectCountProduct() {
		
		return productMapper.selectCountProduct();
	}
	//페이징처리된 상품목록을 불러올 코드.
	public List<ProductVO> selectProductListPage(int startNum, int endNum) {
		
		return productMapper.selectProductListPage(startNum, endNum);
	}
	//검색시 검색어에 대응하는 상품 갯수를 페이징시 전체상품의 갯수를 확인하기 위해.
	public int searchCountProduct(String keyword) {
		
		return productMapper.searchCountProduct(keyword);
	}
	//검색시 페이징처리된 상품목록을 불러올 코드
	public List<ProductVO> searchProductListPage(int startNum, int endNum, String keyword) {
		
		return productMapper.searchProductListPage(startNum, endNum, keyword);
	}
	
	//검색시 검색어에 대응하는 상품 갯수를 페이징시 전체상품의 갯수를 확인하기 위해.
	//product 왼쪽상단 시계, 지갑 누르면 그 카테고리에 해당하는 상품만 나오게 하기위해
	public int searchCountProductCategory(String keyword) {		
		return productMapper.searchCountProductCategory(keyword);
	}
	//검색시 페이징처리된 상품목록을 불러올 코드
	//product 왼쪽상단 시계, 지갑 누르면 그 카테고리에 해당하는 상품만 나오게 하기위해
	public List<ProductVO> searchProductListPageCategory(int startNum, int endNum, String keyword) {		
		return productMapper.searchProductListPageCategory(startNum, endNum, keyword);
	}
	
	//필터 브랜드버전==================================================================
	//검색시 검색어에 대응하는 상품 갯수를 페이징시 전체상품의 갯수를 확인하기 위해.
	//product 왼쪽상단 시계, 지갑 누르면 그 카테고리에 해당하는 상품만 나오게 하기위해
	public int searchCountProductBrand(String keyword) {		
		return productMapper.searchCountProductBrand(keyword);
	}
	//검색시 페이징처리된 상품목록을 불러올 코드
	//product 왼쪽상단 시계, 지갑 누르면 그 카테고리에 해당하는 상품만 나오게 하기위해
	public List<ProductVO> searchProductListPageBrand(int startNum, int endNum, String keyword) {		
		return productMapper.searchProductListPageBrand(startNum, endNum, keyword);
	}

}
