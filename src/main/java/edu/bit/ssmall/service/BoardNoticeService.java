package edu.bit.ssmall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.BoardNoticeMapper;
import edu.bit.ssmall.vo.BoardNoticeVO;
import edu.bit.ssmall.vo.BoardVO;

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

	public List<BoardNoticeVO> selectBoardListPage(int startNum, int endNum) {
		return boardMpper.selectBoardListPage(startNum, endNum);
	}

	public List<BoardNoticeVO> selectGradeBoardListPage(int startNum, int endNum) {
		return boardMpper.selectGradeBoardListPage(startNum, endNum);
	}

/////////////////////////////
	public int BoardSearchCount(String keyword) {

		return boardMpper.BoardSearchCount(keyword);
	}

	public List<BoardNoticeVO> BoardSearchListPage(int startNum, int endNum, String keyword) {
		// TODO Auto-generated method stub
		return boardMpper.BoardSearchListPage(startNum, endNum, keyword);
	}

////////////////////////////////////
	public int BoardGradeSearchCount(String keyword) {

		return boardMpper.BoardGradeSearchCount(keyword);

	}

	public List<BoardNoticeVO> BoardGradeSearchListPage(int startNum, int endNum, String keyword) {

		return boardMpper.BoardGradeSearchListPage(startNum, endNum, keyword);
	}

	public int getMnum(String m_id) throws Exception {

		return boardMpper.getMnum(m_id);
	}

	public int selectAskCountBoard(int m_number) throws Exception {
		return boardMpper.selectAskCountBoard(m_number);
	}

	public List<BoardVO> selectAskBoardListPage(int m_number, int startNum, int endNum) throws Exception {
		return boardMpper.selectAskBoardListPage(m_number, startNum, endNum);
	}

	public BoardVO getAllAskRequestAnswer(String bid) throws Exception {
		return boardMpper.getAllAskRequestAnswer(bid);
	}

	public String getMname(String m_id) throws Exception {

		return boardMpper.getMname(m_id);
	}

	public void insertAsk(String bName, String bTitle, String bContent, int m_number) throws Exception {
		boardMpper.insertAsk(bName, bTitle, bContent, m_number);
	}

	public void updateAskAS(String bTitle, String bContent, String bId) throws Exception {
		boardMpper.updateAskAS(bTitle, bContent, bId);
	}

	public void deleteAskAS(String bId) throws Exception {
		boardMpper.deleteAskAS(bId);
	}

	public List<BoardNoticeVO> selectBoardList() throws Exception {

		return boardMpper.selectBoardList();
	}

}
