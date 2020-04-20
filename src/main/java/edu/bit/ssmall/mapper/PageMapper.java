package edu.bit.ssmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.Product_BuyVO;
import edu.bit.ssmall.vo.RefundVO;

public interface PageMapper {
	
	@Select("Select count(*) from refund where m_number = #{m_number}")
	public int countRefundList(@Param("m_number")int m_number);
	
	@Select("Select * from member where m_id = #{m_id}")
	public MemberVO memberInfo(@Param("m_id")String m_id);
	
	@Select("SELECT * FROM (SELECT A.r_number, A.m_number, A.p_number, A.r_price, A.r_amount, A.r_date, A.r_status,ROWNUM AS RNUM "
			+ "FROM(SELECT r.r_number, r.m_number, p.p_number, r.r_price, r.r_amount, r.r_date, r.r_status "
			+ "FROM refund r, member m, product p "
			+ "where r.m_number = m.m_number and r.p_number = p.p_number and r.m_number = #{m_number} ORDER BY r.r_date desc) A) B,product P "
			+ "where B.P_NUMBER = P.P_NUMBER and RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<RefundVO> refundListPage(@Param("m_number")int m_number, @Param("startNum")int startNum, @Param("endNum")int endNum);
	
	@Select("Select count(*) from product p, buy b where p.p_number = b.p_number and m_number = #{m_number} and b_status = '배송완료'")
	public int countOrderedList(@Param("m_number")int m_number);
	
	@Select("Select count(*) from product p, buy b where p.p_number = b.p_number and m_number = #{m_number} and b_status = '결제완료'")
	public int countShoppingList(@Param("m_number")int m_number);
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM product p join buy b on b.p_number = p.p_number where m_number = #{m_number} and b_status != '배송완료' order by b_number desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<Product_BuyVO> orderedListPage(@Param("m_number")int m_number, @Param("startNum")int startNum, @Param("endNum")int endNum);
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM product p join buy b on b.p_number = p.p_number where m_number = #{m_number} order by b_number desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<Product_BuyVO> shoppingListPage(@Param("m_number")int m_number, @Param("startNum")int startNum, @Param("endNum")int endNum);

	
	
	
}
