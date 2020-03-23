package edu.bit.ssmall.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductVO;
import edu.bit.ssmall.vo.RefundVO;

public interface AdminMapper {

	
/*=====================페이징 처리를 위한 카운트 ======================================================================*/
	@Select("Select count(*) from product")
	public int countProduct();
	
	@Select("Select count(*) from member")
	public int countMember();
	
	@Select("Select count(*) from buy where m_number = #{m_number} and b_status = '결제완료'")
	public int countBuy(String m_number);
	
	@Select("Select count(*) from refund where m_number = #{m_number}")
	public int countRefund(String m_number);

/*=====================페이징 처리한 select문 쿼리======================================================================*/
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM product ORDER BY p_name desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public ArrayList<ProductVO> productList(@Param("startNum")int startNum, @Param("endNum")int endNum);
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM member where m_authority != '관리자' ORDER BY m_number desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public ArrayList<MemberVO> memberList(@Param("startNum")int startNum, @Param("endNum")int endNum);
	
	@Select("SELECT * FROM (SELECT A.b_number, A.m_number, A.p_number, A.b_total, A.b_amount, A.b_date, A.b_status, ROWNUM AS RNUM "
			+ "FROM(SELECT b.b_number, b.m_number, b.p_number, b.b_total, b.b_amount, b.b_date, b.b_status "
			+ "FROM buy b, member m, product p "
			+ "where b.m_number = m.m_number and b.p_number = p.p_number and b.m_number = #{m_number} ORDER BY b.b_date desc) A) B, product P "
			+ "where B.P_NUMBER = P.P_NUMBER and RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public ArrayList<BuyVO> buyInfo(@Param("m_number")String m_number, @Param("startNum")int startNum, @Param("endNum")int endNum);
	
	@Select("SELECT * FROM (SELECT A.r_number, A.m_number, A.p_number, A.r_price, A.r_amount, A.r_date, A.r_status,ROWNUM AS RNUM "
			+ "FROM(SELECT r.r_number, r.m_number, p.p_number, r.r_price, r.r_amount, r.r_date, r.r_status "
			+ "FROM refund r, member m, product p "
			+ "where r.m_number = m.m_number and r.p_number = p.p_number and r.m_number = #{m_number} ORDER BY r.r_date desc) A) B,product P "
			+ "where B.P_NUMBER = P.P_NUMBER and RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public ArrayList<RefundVO> refundInfo(@Param("m_number")String m_number, @Param("startNum")int startNum, @Param("endNum")int endNum);
	
/*===================================회원관리======================================================================*/	
	@Select("Select * from member where m_number = #{m_number}")
	public MemberVO memberInfo(@Param("m_number")String m_number);
	
	@Select("Select * from buy b, product p where b.p_number = p.p_number and b.m_number = #{m_number}")
	public ArrayList<BuyVO> buyList(@Param("m_number")String m_number);

	@Select("Select * from refund r, product p where r.p_number = p.p_number and r.m_number = #{m_number}")
	public ArrayList<RefundVO> refundList(String m_number);
	
	@Select("Select * from board where m_number = #{m_number} and btype='문의/건의' order by bdate desc")
	public ArrayList<BoardVO> requestList(String m_number);
	
	@Select("Select * from board where m_number = #{m_number} and btype='AS요청' order by bdate desc")
	public ArrayList<BoardVO> asList(String m_number);
	
	@Select("Select * from member where m_authority='관리자' order by m_name")
	public ArrayList<MemberVO> adminList();
	
	@Update("Update member set m_authority = #{m_authority} where m_number = #{m_number}")
	public void updateAuthority(@Param("m_number")String m_number, @Param("m_authority")String m_authority);
	
/*===================================검색했을때 처리======================================================================*/
	@Select("Select * from member where m_authority != '관리자' and m_name like '%'||#{search}||'%' or m_id like '%'||#{search}||'%' order by m_number desc")
	public ArrayList<MemberVO> memberSearch(@Param("search")String search);
	
	@Select("Select * from product where p_brand like '%'||#{search}||'%' or  p_name like '%'||#{search}||'%' order by p_price desc")
	public ArrayList<ProductVO> productSearch(@Param("search")String search);
	
	

}
