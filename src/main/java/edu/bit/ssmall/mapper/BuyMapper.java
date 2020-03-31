package edu.bit.ssmall.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductImageVO;

public interface BuyMapper {
	
	@Select("Select * from product p, image i where p.p_number = #{p_number} and i.p_number = p.p_number and i.i_type=1")
	public ProductImageVO productinfo(@Param("p_number")String p_number);

	@Select("Select * from member where m_id = #{m_id}")
	public MemberVO memberInfo(@Param("m_id")String m_id);

	@Update("Update product set p_stock = p_stock - #{amount}, p_amount = p_amount + #{amount} where p_number = #{p_number}")
	public void updateProduct(@Param("p_number")String p_number , @Param("amount")String amount);

	public void buy(@Param("m_number")String m_number, @Param("p_number")String p_number, @Param("amount")String amount, 
			@Param("totalprice")String totalprice, @Param("b_kakao_tid")String b_kakao_tid, @Param("b_memo")String b_memo,
			@Param("b_name")String b_name, @Param("b_phonenum")String b_phonenum, @Param("b_addr")String b_addr);
	
	@Update("Update member set m_point = m_point + #{point} where m_number = #{m_number}")
	public void plusPoint(@Param("m_number")String m_number, @Param("point")int point);
	
	@Update("Update member set m_point = m_point - #{usePoint} where m_number = #{m_number}")
	public void minusPoint(@Param("m_number")int m_number, @Param("usePoint")int usePoint);


}
