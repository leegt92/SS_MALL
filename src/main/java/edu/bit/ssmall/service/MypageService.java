package edu.bit.ssmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.LoginMapper;
import edu.bit.ssmall.mapper.MypageMapper;
import edu.bit.ssmall.vo.MemberVO;

@Service
public class MypageService {

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

	public String getMemail(String m_id) throws Exception{
	
		return mypageMapper.getMemail(m_id);
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

	public void updateMreceiveToYes(String m_id) {
		mypageMapper.updateMreceiveToYes(m_id);
	}
	
	public void updateMreceiveToNo(String m_id) {
		mypageMapper.updateMreceiveToNo(m_id);
	}
}
