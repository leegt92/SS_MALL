package edu.bit.ssmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.FindMapper;
import edu.bit.ssmall.vo.MemberVO;

@Service
public class FindService {

	@Autowired
	FindMapper findMapper;
	
	public int emailCheck(String email) {
			
		return findMapper.emailCheck(email);
	}

	public String getId(String m_email) {
		
		return findMapper.getId(m_email);
	}

	public int IdCheck(String id, String name, String email) {
		
		return findMapper.IdCheck(id,name,email);
	}

	public void pwUpdate(MemberVO memberVO) {
		findMapper.pwUpdate(memberVO);		
	}

}
