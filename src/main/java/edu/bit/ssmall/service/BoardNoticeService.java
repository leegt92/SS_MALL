package edu.bit.ssmall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.BoardNoticeMapper;

import edu.bit.ssmall.vo.BoardNoticeVO;
import edu.bit.ssmall.vo.ProductVO;

@Service 
public class BoardNoticeService {
	
	@Inject
	BoardNoticeMapper boardMpper;

	
	public BoardNoticeVO selectBoardOne(String bId) {
		boardMpper.upHit(bId);
		return boardMpper.selectBoardOne(bId);
		
	}
	
	public int selectCountBoard() {
		
		return boardMpper.selectCountBoard();
	}
	public int selectCountGradeBoard() {
		
		return boardMpper.selectCountGradeBoard();
	}

	
	
	  public List<BoardNoticeVO> selectBoardListPage(int startNum,int endNum){
	  return boardMpper.selectBoardListPage(startNum, endNum);
	  }
	
	
	public List<BoardNoticeVO> selectGradeBoardListPage(int startNum,int endNum){
		return boardMpper.selectGradeBoardListPage(startNum, endNum);
	}
/////////////////////////////
	public int BoardSearchCount(String keyword) {
		
		return boardMpper.BoardSearchCount(keyword);
	}

	public List<BoardNoticeVO> BoardSearchListPage(int startNum, int endNum, String keyword) {
		// TODO Auto-generated method stub
		return boardMpper.BoardSearchListPage( startNum,endNum,keyword);
	}
////////////////////////////////////
	public int BoardGradeSearchCount(String keyword) {
		
		return boardMpper.BoardGradeSearchCount(keyword);
	
	}

	public List<BoardNoticeVO> BoardGradeSearchListPage(int startNum, int endNum, String keyword) {
		
		return boardMpper.BoardGradeSearchListPage(startNum,endNum,keyword);
	}

	
	

}

