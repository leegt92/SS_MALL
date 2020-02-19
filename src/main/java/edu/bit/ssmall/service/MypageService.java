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

	


	

}
