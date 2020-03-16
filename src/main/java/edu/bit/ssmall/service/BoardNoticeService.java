package edu.bit.ssmall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.BoardNoticeMapper;
import edu.bit.ssmall.vo.BoardNoticeVO;

@Service 
public class BoardNoticeService {
	
	@Inject
	BoardNoticeMapper boardMpper;
	
	
	public List<BoardNoticeVO> selectBoardList() throws Exception{
	  
	  return boardMpper.selectBoardList(); 
	}
	
	public BoardNoticeVO selectBoardOne(String bId) {
		boardMpper.upHit(bId);
		return boardMpper.selectBoardOne(bId);
		
	}
	
	public int selectCountBoard() {
		
		return boardMpper.selectCountBoard();
	}
	
	public List<BoardNoticeVO> selectBoardListPage(int startNum,int endNum){
		return boardMpper.selectBoardListPage(startNum, endNum);
	}

	
 
}

