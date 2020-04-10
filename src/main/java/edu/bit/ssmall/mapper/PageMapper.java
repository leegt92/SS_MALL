package edu.bit.ssmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.RefundVO;

public interface PageMapper {
	
	@Select("Select count(*) from refund where m_number = #{m_number}")
	public int countRefundList(@Param("m_number")int m_number);
	
	@Select("Select * from member where m_id = #{m_id}")
	public MemberVO memberInfo(@Param("m_id")String m_id);
	
	@Select("SELECT * FROM (SELECT A.r_number, A.m_number, A.p_number, A.r_price, A.r_amount, A.r_date, A.r_status,ROWNUM AS RNUM "
			+ "FROM(SELECT r.r_number, r.m_number, p.p_number, r.r_price, r.r_amount, r.r_date, r.r_status "
			+ "FROM refund r, member m, product p "
			+ "where r.m_number = m.m_number and r.p_number = p.p_number and r.m_number = 1 ORDER BY r.r_date desc) A) B,product P "
			+ "where B.P_NUMBER = P.P_NUMBER and RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<RefundVO> refundListPage(@Param("m_number")int m_number, @Param("startNum")int startNum, @Param("endNum")int endNum);
	
	
}
