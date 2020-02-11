package edu.bit.ssmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.RegisterMapper;
import edu.bit.ssmall.vo.MemberVO;

@Service
public class RegisterService {
	
	@Autowired
	RegisterMapper registerMapper;
	
	public void register(MemberVO memberVO) {
		registerMapper.register(memberVO);		
	}	
	public int idChk(String m_id) {
		return registerMapper.idChk(m_id);
	}
}
