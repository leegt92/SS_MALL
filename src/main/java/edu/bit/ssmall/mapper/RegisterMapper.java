package edu.bit.ssmall.mapper;


import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.MemberVO;

public interface RegisterMapper {

	
	public void register(@Param("memberVO")MemberVO memberVO);
	
	public int idChk(@Param("m_id")String m_id); 
}
