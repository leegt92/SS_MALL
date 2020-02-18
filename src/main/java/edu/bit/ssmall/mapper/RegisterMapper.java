package edu.bit.ssmall.mapper;


import org.apache.ibatis.annotations.Param;

import edu.bit.ssmall.vo.MemberVO;

public interface RegisterMapper {

	
	public void register(@Param("memberVO")MemberVO memberVO);
	
	public int idChk(@Param("memberVO")MemberVO memberVO);

	public int emailChk(@Param("memberVO")MemberVO memberVO); 
	
	public void naverRegister(@Param("memberVO")MemberVO memberVO);

	public void kakaoRegister(@Param("memberVO")MemberVO memberVO);
}
