package edu.bit.ssmall.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.RefundVO;

public interface RefundMapper {

	
	@Select("Select p_number from product where p_name = #{p_name}")
	public String getP_number(@Param("p_name")String p_name);
	
	@Select("Select m_number from member where m_id = #{m_id}")
	public String getM_number(@Param("m_id")String m_id);
	
	@Select("Select * from buy where imp_uid = #{imp_uid}")
	public ArrayList<BuyVO> getBuyInfo(@Param("imp_uid")String imp_uid);
	
	@Select("Select * from member m, refund r, product p where r.m_number = m.m_number and r.p_number = p.p_number and r.m_number = #{m_number} order by r_date desc")
	public ArrayList<RefundVO> refundInfo(@Param("m_number")String m_number);
	
	@Select("Select p_image from product where p_number = #{p_number}")
	public String getP_image(@Param("p_number")int p_number);
	
	@Delete("Delete from buy where m_number = #{m_number} and b_number = #{b_number}")
	public void removeBuy(@Param("m_number")int m_number, @Param("b_number")int b_number);
	
	@Update("Update product set p_stock = p_stock + #{b_amount} , p_amount = p_amount - #{b_amount} where p_number = #{p_number}")
	public void productRefund(@Param("p_number")int p_number, @Param("b_amount")int b_amount);
	
	public void addRefund(@Param("m_number")int m_number, @Param("p_number")int p_number, @Param("b_amount")int b_amount, @Param("b_total")int b_total);
	
	@Update("Update member set m_point = m_point - #{point} where m_number = #{m_number}")
	public void minusPoint(@Param("m_number")int m_number, @Param("point")int point);

}
