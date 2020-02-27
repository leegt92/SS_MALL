package edu.bit.ssmall.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.MemberVO;

public interface BuyMapper {
	
	@Select("Select * from product p, image i where p.p_number = #{p_number} and i.p_number = p.p_number and i.i_type=1")
	public BuyVO productinfo(@Param("p_number")String p_number);

	@Select("Select * from member where m_id = #{m_id}")
	public MemberVO memberInfo(@Param("m_id")String m_id);

	@Select("Select p_name from product where p_number = #{p_number}")
	public String productName(@Param("p_number")String p_number);

	@Select("Select p_number from product where p_name = #{p_name}")
	public String productNum(@Param("p_name")String p_name);
	
	@Select("Select m_number from member where m_email = #{e_mail}")
	public String memberNum(@Param("e_mail")String e_mail);
	
	public void buy(@Param("p_number")String p_number, @Param("m_number")String m_number, @Param("b_amount")String b_amount, @Param("b_totalprice")String b_totalprice );

}
