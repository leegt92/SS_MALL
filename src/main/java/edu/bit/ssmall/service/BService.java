package edu.bit.ssmall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.BoardMapper;
import edu.bit.ssmall.vo.BoardVO;

@Service 
public class BService {
	
	@Inject
	BoardMapper boardMpper;
	
	public List<BoardVO> selectBoardList() throws Exception{
		
		return boardMpper.selectBoardList();
	}

	public BoardVO selectBoardOne(String bId) {
		
		return boardMpper.selectBoardOne(bId);
		
	}
 
}

