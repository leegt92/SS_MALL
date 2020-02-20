package edu.bit.ssmall.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ssmall.vo.MemberVO;

public interface MypageMapper {

	@Select("select m_number from member where m_id = #{m_id}")
	public int getMnum(@Param("m_id")String m_id);
	
	@Select("select m_password from member where m_id = #{m_id}")
	public String getMpw(@Param("m_id")String m_id);
	
	@Select("select m_id from member where m_id = #{m_id}")
	public String getMid(@Param("m_id")String m_id);
	
	@Select("select m_email from member where m_id = #{m_id}")
	public String getMemail(@Param("m_id")String m_id);
	
	@Update("update member set m_name = #{m_name} where m_id = #{m_id}")
	public void updateMname(@Param("m_name")String m_name, @Param("m_id")String m_id);
	
	@Update("update member set m_age = #{m_age} where m_id = #{m_id}")
	public void updateMage(@Param("m_age")int m_age, @Param("m_id")String m_id);
	
	@Update("update member set m_adress = #{m_adress} where m_id = #{m_id}")
	public void updateMadress(@Param("m_adress")String m_adress, @Param("m_id")String m_id);
	
	@Update("update member set m_phonenum = #{m_phonenum} where m_id = #{m_id}")
	public void updateMphonenum(@Param("m_phonenum")String m_phonenum, @Param("m_id")String m_id);

}
