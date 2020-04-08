package edu.bit.ssmall.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.AdminMapper;
import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.Board_MemberVO;
import edu.bit.ssmall.vo.ProductVO;

@Service
public class AdminService {
	
	@Autowired
	AdminMapper adminMapper;

	public ArrayList<ProductVO> productList(int startNum , int endNum) {
		
		return adminMapper.productList(startNum,endNum);
	}

	public int countProduct() {
		// TODO Auto-generated method stub
		return adminMapper.countProduct();
	}
	
	public List<Board_MemberVO> getAllAskRequest() throws Exception {
		return adminMapper.getAllAskRequest();	
	}
	
	public int selectAskCountBoard() throws Exception {
		return adminMapper.selectAskCountBoard();	
	}
	
	public List<Board_MemberVO> selectAskBoardListPage(int startNum, int endNum) throws Exception {
		return adminMapper.selectAskBoardListPage(startNum, endNum);	
	}
	
	public List<Board_MemberVO> getAllASRequest() throws Exception {
		return adminMapper.getAllASRequest();	
	}
	
	public int selectASCountBoard() throws Exception {
		return adminMapper.selectASCountBoard();	
	}
	
	public List<Board_MemberVO> selectASBoardListPage(int startNum, int endNum) throws Exception {
		return adminMapper.selectASBoardListPage(startNum, endNum);	
	}
}
