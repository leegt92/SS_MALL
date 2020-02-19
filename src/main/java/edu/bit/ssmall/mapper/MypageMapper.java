package edu.bit.ssmall.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.MemberVO;

public interface MypageMapper {

	@Select("select m_number from member where m_id = #{m_id}")
	public int getMnum(@Param("m_id")String m_id);
	
	@Select("select m_password from member where m_id = #{m_id}")
	public String getMpw(@Param("m_id")String m_id);

}
