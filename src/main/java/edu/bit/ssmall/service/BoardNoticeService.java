package edu.bit.ssmall.service;

import java.util.List;

import javax.activation.CommandMap;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.BoardNoticeMapper;
import edu.bit.ssmall.mapper.MypageMapper;
import edu.bit.ssmall.vo.BoardNoticeVO;
import edu.bit.ssmall.vo.BoardVO;

@Service 
public class BoardNoticeService {
	
	@Autowired
	BoardNoticeMapper boardnoticeMapper;
	
	@Inject
	BoardNoticeMapper boardMpper;
	
		public int getMnum(String m_id) throws Exception{

		return boardnoticeMapper.getMnum(m_id);
	}
		
		public int selectAskCountBoard(int m_number) throws Exception {
			return boardnoticeMapper.selectAskCountBoard(m_number);	
		}
	
		public List<BoardVO> selectAskBoardListPage(int m_number, int startNum, int endNum) throws Exception {
			return boardnoticeMapper.selectAskBoardListPage(m_number, startNum, endNum);	
		}
	
		public BoardVO getAllAskRequestAnswer(String bid) throws Exception {
			return boardnoticeMapper.getAllAskRequestAnswer(bid);	
		}
		
		public String getMname(String m_id) throws Exception{
			
			return boardnoticeMapper.getMname(m_id);
		}
		
		public void insertAsk(String bName, String bTitle, String bContent, int m_number ) throws Exception{
			boardnoticeMapper.insertAsk(bName, bTitle, bContent, m_number);
		}
		
		public void updateAskAS(String bTitle, String bContent, String bId ) throws Exception{
			boardnoticeMapper.updateAskAS(bTitle, bContent, bId);
		}
		
		public void deleteAskAS(String bId) throws Exception{
			boardnoticeMapper.deleteAskAS(bId);
		}
		
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

	public static void insertVOBoard(BoardNoticeVO boardVO) {
		// TODO Auto-generated method stub
		
	}

	
}

