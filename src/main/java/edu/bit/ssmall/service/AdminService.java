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
	
	public List<Board_MemberVO> selectUnAnsweredAskBoardListPage(int startNum, int endNum) throws Exception {
		return adminMapper.selectUnAnsweredAskBoardListPage(startNum, endNum);	
	}
	
	public List<Board_MemberVO> selectAnsweredAskBoardListPage(int startNum, int endNum) throws Exception {
		return adminMapper.selectAnsweredAskBoardListPage(startNum, endNum);	
	}
	
	public List<Board_MemberVO> getAllASRequest() throws Exception {
		return adminMapper.getAllASRequest();	
	}
	
	public int selectASCountBoard() throws Exception {
		return adminMapper.selectASCountBoard();	
	}
	
	public List<Board_MemberVO> selectUnAnsweredASBoardListPage(int startNum, int endNum) throws Exception {
		return adminMapper.selectUnAnsweredASBoardListPage(startNum, endNum);	
	}
	
	public List<Board_MemberVO> selectAnsweredASBoardListPage(int startNum, int endNum) throws Exception {
		return adminMapper.selectAnsweredASBoardListPage(startNum, endNum);	
	}

	//글 타입 검색(as요청인지 1:1문의인지...)
	public String selectBtype(String bId) throws Exception {
		return adminMapper.selectBtype(bId);
	}
	
	//답변 insert 하기
	public void insertAnswer(String bName, String bTitle, String bContent, int m_number, String bId ) throws Exception{
		adminMapper.insertAnswer(bName, bTitle, bContent, m_number, bId);
	}
	
	//인서트된 답변 수정하기
	public void updateAnswer(String bTitle, String bContent, String bId ) throws Exception{
		adminMapper.updateAnswer(bTitle, bContent, bId);
	}
	
	//답변미완료 글 답변완료로 수정하기
	public void updateBanswered(String bId) throws Exception{
		adminMapper.updateBanswered(bId);
	}
}
