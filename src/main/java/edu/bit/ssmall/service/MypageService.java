package edu.bit.ssmall.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.LoginMapper;
import edu.bit.ssmall.mapper.MypageMapper;
import edu.bit.ssmall.page.Criteria;
import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.Product_BuyVO;

@Service
public class MypageService {
	/*======================Member 관련 SQL문============================================*/
	
	@Autowired
	MypageMapper mypageMapper;
	
	
	public int getMnum(String m_id) throws Exception{
		
		return mypageMapper.getMnum(m_id);
	}
	
	public String getMpw(String m_id) throws Exception{
		
		return mypageMapper.getMpw(m_id);
	}
	
	public String getMid(String m_id) throws Exception{
		
		return mypageMapper.getMid(m_id);
	}

	public String getMname(String m_id) throws Exception{
	
		return mypageMapper.getMname(m_id);
	}
	
	public int getMage(String m_id) throws Exception{
		
		return mypageMapper.getMage(m_id);
	}
	
	public String getMadress(String m_id) throws Exception{
		
		return mypageMapper.getMadress(m_id);
	}
	
	public String getMphonenum(String m_id) throws Exception{
		
		return mypageMapper.getMphonenum(m_id);
	}
	
	public String getMemail(String m_id) throws Exception{
		
		return mypageMapper.getMemail(m_id);
	}
	
	public int getMpoint(String m_id) throws Exception{
		
		return mypageMapper.getMpoint(m_id);
	}
	
	public String getMnaver(String m_id) throws Exception{
		
		return mypageMapper.getMnaver(m_id);
	}

	public String getMkakao(String m_id) throws Exception{
	
		return mypageMapper.getMkakao(m_id);
	}
	
	public void updateMname(String m_name, String m_id) throws Exception{
		mypageMapper.updateMname(m_name, m_id);
	}
	
	public void updateMage(int m_age, String m_id) throws Exception{
		mypageMapper.updateMage(m_age, m_id);
	}
	
	public void updateMadress(String m_adress, String m_id) throws Exception{
		mypageMapper.updateMadress(m_adress, m_id);
	}
	
	public void updateMphonenum(String m_phonenum, String m_id) throws Exception{
		mypageMapper.updateMphonenum(m_phonenum, m_id);
	}

	public void updateMreceiveToYes(String m_id) throws Exception{
		mypageMapper.updateMreceiveToYes(m_id);
	}
	
	public void updateMreceiveToNo(String m_id) throws Exception{
		mypageMapper.updateMreceiveToNo(m_id);
	}
	
	public void updateMpassword(String m_password, String m_id) throws Exception{
		mypageMapper.updateMpassword(m_password, m_id);
	}
	
	public void insertAsk(String bName, String bTitle, String bContent, int m_number ) throws Exception{
		mypageMapper.insertAsk(bName, bTitle, bContent, m_number);
	}
	
	public void updateAskAS(String bTitle, String bContent, String bId ) throws Exception{
		mypageMapper.updateAskAS(bTitle, bContent, bId);
	}
	
	public void deleteAskAS(String bId) throws Exception{
		mypageMapper.deleteAskAS(bId);
	}

	public void insertAS(String bName, String bTitle, String bContent, int m_number) throws Exception {
		mypageMapper.insertAS(bName, bTitle, bContent, m_number);	
	}
	
	public void withdrawMember(String m_id) throws Exception {
		mypageMapper.withdrawMember(m_id);	
	}
	
	/*======================Product 관련 SQL문============================================*/
	public String getPimage(int p_number) throws Exception {
		return mypageMapper.getPimage(p_number);	
	}
	
	public String getPname(int p_number) throws Exception {
		return mypageMapper.getPname(p_number);	
	}
	
	public int getPprice(int p_number) throws Exception {
		return mypageMapper.getPprice(p_number);	
	}
	
	/*======================Buy 관련 SQL문============================================*/
	public List<Integer> getBnumbers(int m_number) throws Exception {
		return mypageMapper.getBnumbers(m_number);	
	}
	
	public List<Integer> getOrderedBnumbers(int m_number) throws Exception {
		return mypageMapper.getOrderedBnumbers(m_number);	
	}
	
	public int getBamount(int p_number) throws Exception {
		return mypageMapper.getBamount(p_number);	
	}
	
	public Date getBdate(int p_number) throws Exception {
		return mypageMapper.getBdate(p_number);	
	}
	/*======================Product_Buy 관련 SQL문============================================*/
	public List<Product_BuyVO> getP_BVO(int m_number) throws Exception {
		return mypageMapper.getP_BVO(m_number);	
	}
	
	
	public List<BuyVO> getOrderedP_BVO(int m_number) throws Exception {
		return mypageMapper.getOrderedP_BVO(m_number);	
	}
	/*======================Board 관련 SQL문============================================*/
	public List<BoardVO> getAllAskRequest(int m_number) throws Exception {
		return mypageMapper.getAllAskRequest(m_number);	
	}
	
	public List<BoardVO> getAllASRequest(int m_number) throws Exception {
		return mypageMapper.getAllASRequest(m_number);	
	}
	
	public BoardVO getAllAskRequestAnswer(String bid) throws Exception {
		return mypageMapper.getAllAskRequestAnswer(bid);	
	}
	
	public BoardVO getAllASRequestAnswer(String bid) throws Exception {
		return mypageMapper.getAllASRequestAnswer(bid);	
	}
	
	public int selectCountBoard() throws Exception {
		return mypageMapper.selectCountBoard();	
	}
	
	public String selectFbTitle(String bid) throws Exception {
		return mypageMapper.selectFbTitle(bid);	
	}
	
	public String selectFanswerbTitle(String bid) throws Exception {
		return mypageMapper.selectFanswerbTitle(bid);	
	}
	
	public String selectFbContent(String bid) throws Exception {
		return mypageMapper.selectFbContent(bid);	
	}
	
	public String selectFanswerbContent(String bid) throws Exception {
		return mypageMapper.selectFanswerbContent(bid);	
	}
	
	public int selectAskCountBoard(int m_number) throws Exception {
		return mypageMapper.selectAskCountBoard(m_number);	
	}
	
	public int selectASCountBoard(int m_number) throws Exception {
		return mypageMapper.selectASCountBoard(m_number);	
	}
	
	public List<BoardVO> selectBoardListPage(int m_number, Criteria criteria) throws Exception {
		return mypageMapper.selectBoardListPage(m_number, criteria);	
	}
	
	public List<BoardVO> selectAskBoardListPage(int m_number, int startNum, int endNum) throws Exception {
		return mypageMapper.selectAskBoardListPage(m_number, startNum, endNum);	
	}
	
	public List<BoardVO> selectASBoardListPage(int m_number, int startNum, int endNum) throws Exception {
		return mypageMapper.selectASBoardListPage(m_number, startNum, endNum);	
	}
}
