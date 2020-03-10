package edu.bit.ssmall.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.ProductMapper;
import edu.bit.ssmall.vo.BoardVO;
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

	public List<ProductImageVO> selectProductOne2(String p_number) {	 
		return productMapper.selectProductOne2(p_number); 
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

	public ProductVO productOne(String p_number) {
		// TODO Auto-generated method stub
		return productMapper.productOne(p_number);
	}

	public List<BoardVO> boardVO() {
			
		return productMapper.boardVO();
	}

	public BoardVO boardOne(String bid) {
		// TODO Auto-generated method stub
		return productMapper.boardOne(bid);
	}
}
