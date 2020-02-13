package edu.bit.ssmall.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.MemberVO;

public interface LoginMapper {

	@Select("select m_id, m_password from member where m_id = #{memberVO.m_id}")
	public MemberVO login(@Param("memberVO")MemberVO memberVO);
	
	
}
