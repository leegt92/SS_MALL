package edu.bit.ssmall.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.CartVO;
import edu.bit.ssmall.vo.CartViewVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductImageVO;

public interface CartMapper {
	
	@Insert("Insert into cart(c_id, m_number, p_number, c_grandtotal, c_amount)values(cart_seq.nextval, #{m_number}, #{p_number}, #{totalprice}, #{b_amount})")
	public void addCart(@Param("p_number")String p_number, @Param("m_number")int m_number, @Param("b_amount")String b_amount, @Param("totalprice")int totalprice);

	@Select("Select * from member where m_id = #{m_id}")
	public MemberVO memberInfo(@Param("m_id")String m_id);
	
	@Select("Select * from product p , image i where p.p_number = #{p_number} and i.p_number = p.p_number and i_type=1")
	public ProductImageVO productInfo(String p_number);
		
	@Select("Select * from cart c ,product p,image i, member m where m.m_number = #{m_number}  and p.p_number = c.p_number and p.p_number = i.p_number")
	public ArrayList<CartViewVO> cartInfo(@Param("m_number")int m_number);
	
	@Select("Select * from cart c ,product p,image i, member m where m.m_number = c.m_number and p.p_number = c.p_number and p.p_number = i.p_number and c_id = #{c_id}")
	public CartViewVO cartByCid(@Param("c_id")String c_id);
	
	@Select("Select * from cart c ,product p,image i, member m where m.m_number = c.m_number and p.p_number = c.p_number and p.p_number = i.p_number and m.m_id = #{m_id}")
	public ArrayList<CartViewVO> smallCartInfo(String m_id);
	
	@Delete("Delete from cart where c_id = #{c_id}")
	public void cartDelete(@Param("c_id")String c_id);
	
	
	public void cartBuy(@Param("p_number")int p_number, @Param("m_number")int m_number, @Param("b_amount")int b_amount, @Param("b_totalprice")int b_totalprice);
	
	
	
	
}
