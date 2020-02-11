package edu.bit.ssmall.mapper;


import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.MemberVO;

public interface LoginMapper {

	@Select("select * from member where m_id = #{m_id} and m_password = #{m_password}")
	public MemberVO login(@Param("m_id")String m_id, @Param("m_password")String m_password);
	
	
}
