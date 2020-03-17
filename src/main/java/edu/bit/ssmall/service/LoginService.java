package edu.bit.ssmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.LoginMapper;
import edu.bit.ssmall.vo.MemberVO;

@Service
public class LoginService {

	@Autowired
	LoginMapper loginMapper;
	
	
	public MemberVO naverLogin(String m_naver) throws Exception{
		
		return loginMapper.naverLogin(m_naver);
	}
	
	public MemberVO kakaoLogin(String m_kakao) throws Exception{
		
		return loginMapper.kakaoLogin(m_kakao);
	}


	public int naverCheck(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return loginMapper.naverCheck(memberVO);
	}

	public int kakaoCheck(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return loginMapper.kakaoCheck(memberVO);
	}

	


	

}
