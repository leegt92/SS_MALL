package edu.bit.ssmall.chat;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.MemberVO;

public interface ChatMapper {
	
	@Select("Select * from member where m_id = #{m_id}")
	public MemberVO getMemberInfo(@Param("m_id")String m_id);

}
