package edu.bit.ssmall.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.MemberVO;

public interface LoginMapper {

	@Select("select * from member where m_naver = #{m_naver}")
	public MemberVO naverLogin(@Param("m_naver")String m_naver);

	@Select("select * from member where m_kakao = #{m_kakao}")
	public MemberVO kakaoLogin(String m_kakao);
	
	@Select("select count(*) from member where m_naver = #{memberVO.m_naver}")	
	public int naverCheck(@Param("memberVO")MemberVO memberVO);
	
	@Select("select count(*) from member where m_kakao = #{memberVO.m_kakao}")	
	public int kakaoCheck(@Param("memberVO")MemberVO memberVO);
}
