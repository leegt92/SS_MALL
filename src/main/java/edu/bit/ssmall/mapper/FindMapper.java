package edu.bit.ssmall.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ssmall.vo.MemberVO;

public interface FindMapper {
	
	@Select("Select count(*) from member where m_email = #{email}")
	public int emailCheck(@Param("email")String email);

	@Select("Select m_id from member where m_email = #{email}")
	public String getId(String m_email);
	
	@Select("Select count(*) from member where m_id = #{id} and m_name = #{name} and m_email = #{email}")
	public int IdCheck(@Param("id")String id, @Param("name")String name, @Param("email")String email);

	@Update("Update member set m_password = #{memberVO.m_password} where m_id = #{memberVO.m_id}")
	public void pwUpdate(@Param("memberVO")MemberVO memberVO);

}
