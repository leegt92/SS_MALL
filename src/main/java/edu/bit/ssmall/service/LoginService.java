package edu.bit.ssmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.LoginMapper;
import edu.bit.ssmall.vo.MemberVO;

@Service
public class LoginService {

	@Autowired
	LoginMapper loginMapper;
	
	
	public MemberVO login(String m_id, String m_password) {
		
		return loginMapper.login(m_id, m_password);
	}


	

}
