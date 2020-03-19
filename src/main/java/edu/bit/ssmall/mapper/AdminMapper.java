package edu.bit.ssmall.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductVO;
import edu.bit.ssmall.vo.RefundVO;

public interface AdminMapper {

	
	//=====================페이징 처리를 위한 전체숫자 쿼리 ===================================================
	@Select("Select count(*) from product")
	public int countProduct();
	
	@Select("Select count(*) from member")
	public int countMember();
	
	@Select("Select count(*) from buy where m_number = #{m_number} and b_status = '결제완료'")
	public int countBuy(String m_number);
		

	//=====================페이징 처리한 select문 쿼리 ===================================================
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM product ORDER BY p_name desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public ArrayList<ProductVO> productList(@Param("startNum")int startNum, @Param("endNum")int endNum);
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM member where m_authority = '일반회원' ORDER BY m_number desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public ArrayList<MemberVO> memberList(@Param("startNum")int startNum, @Param("endNum")int endNum);
	
	@Select("SELECT * FROM (SELECT A.b_number, A.m_number, A.p_number, A.b_total, A.b_amount, A.b_date, A.b_status, ROWNUM AS RNUM "
			+ "FROM(SELECT b.b_number, b.m_number, b.p_number, b.b_total, b.b_amount, b.b_date, b.b_status "
			+ "FROM buy b, member m, product p "
			+ "where b.m_number = m.m_number and b.p_number = p.p_number and b.m_number = #{m_number} ORDER BY b.b_date desc) A) B, product P "
			+ "where B.P_NUMBER = P.P_NUMBER and RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public ArrayList<BuyVO> buyInfo(@Param("m_number")String m_number, @Param("startNum")int startNum, @Param("endNum")int endNum);
	

	
	//=====================페이징 없는 회원정보 쿼리 ===================================================
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
	
	@Select("Select * from member where m_authority = '일반회원' and m_name like '%'||#{search}||'%' or m_id like '%'||#{search}||'%' order by m_number desc")
	public ArrayList<MemberVO> memberSearch(String search);
	
	@Select("Select * from product where p_name like '%'||#{search}||'%' or  p_brand like '%'||#{search}||'%' order by p_price desc")
	public ArrayList<ProductVO> productSearch(@Param("search")String search);

	

}
