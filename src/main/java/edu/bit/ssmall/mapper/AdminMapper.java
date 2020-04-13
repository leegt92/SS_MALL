package edu.bit.ssmall.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.Board_MemberVO;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductVO;
import edu.bit.ssmall.vo.Product_BuyVO;
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
	
	@Select("Select count(*) from member where m_authority != '관리자' and m_name like '%'||#{search}||'%' or m_id like '%'||#{search}||'%' order by m_number desc")
	public int countSearchMember(String search);
	

/*=====================페이징 처리한 select문 쿼리======================================================================*/
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM product ORDER BY p_name desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum} ")
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
	
	
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (Select * from member where m_authority != '관리자' and m_name like '%'||#{search}||'%' or m_id like '%'||#{search}||'%' order by m_number desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<MemberVO> searchMemberList(@Param("startNum")int startNum, @Param("endNum")int endNum, @Param("search")String search);
	
/*===================================회원관리======================================================================*/	
	@Select("Select * from member where m_number = #{m_number}")
	public MemberVO memberInfo(@Param("m_number")String m_number);
	
	@Select("Select * from buy b, product p where b.p_number = p.p_number and b.m_number = #{m_number}")
	public ArrayList<BuyVO> buyList(@Param("m_number")String m_number);

	@Select("Select * from refund r, product p where r.p_number = p.p_number and r.m_number = #{m_number} order by r.r_date desc")
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
	
	@Select("Select * from product where p_brand like '%'||#{search}||'%' or  p_name like '%'||#{search}||'%'  order by p_price desc")
	public ArrayList<ProductVO> productSearch(@Param("search")String search);

	
/*===================================상품 수정 처리======================================================================*/	
	
	@Select("Select * from product where p_number = #{p_number}")
	public ProductVO productOne(@Param("p_number")String p_number);

	@Update("Update product set p_name = #{p_name} , p_brand = #{p_brand}, p_price = #{p_price}, p_stock = #{p_stock}, p_image = #{originFileName}, p_enabled = #{p_enabled} where p_number = #{p_number}")
	public void updateProduct(@Param("p_number")String p_number, @Param("p_name")String p_name, @Param("p_brand")String p_brand, @Param("p_price")String p_price, @Param("p_stock")String p_stock,
			@Param("originFileName")String originFileName, @Param("p_enabled")int p_enabled);

	@Update("Update image set i_name = #{originFileName} where p_number = #{p_number} and i_type = #{i_type} ")
	public void updateImage(@Param("p_number")String p_number, @Param("originFileName")String originFileName, @Param("i_type")int i_type);
	
	@Update("Update product set p_name = #{p_name} , p_brand = #{p_brand}, p_price = #{p_price}, p_stock = #{p_stock}, p_enabled = #{p_enabled} where p_number = #{p_number}")
	public void updateOnlyProduct(@Param("p_number")String p_number, @Param("p_name")String p_name, @Param("p_brand")String p_brand, @Param("p_price")String p_price, @Param("p_stock")String p_stock,
			@Param("p_enabled")int p_enabled);


	/*===================================AS 1:1문의 처리======================================================================*/	
	
	@Select("select * from board b, member m where b.m_number = m.m_number and btype='문의/건의' ORDER BY bid desc")
	public List<Board_MemberVO> getAllAskRequest ();
	
	@Select("select count(*) from board b, member m where b.m_number = m.m_number and btype='문의/건의'")
	public int selectAskCountBoard();
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board b join member m using(m_number) where btype='문의/건의' and banswered='답변미완료' ORDER BY bid desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<Board_MemberVO> selectUnAnsweredAskBoardListPage(@Param("startNum") int startNum, @Param("endNum") int endNum);
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board b join member m using(m_number) where btype='문의/건의' and banswered='답변완료' ORDER BY bid desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<Board_MemberVO> selectAnsweredAskBoardListPage(@Param("startNum") int startNum, @Param("endNum") int endNum);
	
	@Select("select * from board b, member m where b.m_number = m.m_number and btype='AS요청' ORDER BY bid desc")
	public List<Board_MemberVO> getAllASRequest ();
	
	@Select("select count(*) from board b, member m where b.m_number = m.m_number and btype='AS요청'")
	public int selectASCountBoard();
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board b join member m using(m_number) where btype='AS요청' and banswered='답변미완료' ORDER BY bid desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<Board_MemberVO> selectUnAnsweredASBoardListPage(@Param("startNum") int startNum, @Param("endNum") int endNum);
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board b join member m using(m_number) where btype='AS요청' and banswered='답변완료' ORDER BY bid desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<Board_MemberVO> selectAnsweredASBoardListPage(@Param("startNum") int startNum, @Param("endNum") int endNum);
	
	//특정 bid의 글 타입검색(as요청인지 1:1문의인지...)
	@Select("select btype from board where bid = #{bId}")
	public String selectBtype(@Param("bId")String bId);
	
	//답변 인서트 하기
	@Insert("insert into board (bid,bname,btitle,bcontent,m_number,btype,bdate,banswered,banswerno) values (board_seq.nextval,#{bName},#{bTitle},#{bContent},#{m_number},'답변',sysdate,'답변미완료',#{bId})")
	public void insertAnswer(@Param("bName")String bName, @Param("bTitle")String bTitle, @Param("bContent")String bContent, @Param("m_number") int m_number, @Param("bId")String bId);
	
	//인서트된 답변 수정하기
	@Update("update board set btitle = #{bTitle}, bcontent = #{bContent} where banswerno = #{bId}")
	public void updateAnswer(@Param("bTitle")String bTitle, @Param("bContent")String bContent, @Param("bId") String bId);
	
	//답변미완료 글 답변완료로 수정하기
	@Update("update board set banswered ='답변완료' where bid = #{bId}")
	public void updateBanswered(@Param("bId") String bId);
	
	/*===============================================기간별 판매량 통계 ====================================================*/

	@Select("Select sum(b_total) from buy where b_date between TO_DATE(SYSDATE-7) AND TO_DATE(SYSDATE)+0.99999")
	public int getWeeklySales();
	
	@Select("Select sum(b_total) from buy where b_date between TO_DATE(SYSDATE-31) AND TO_DATE(SYSDATE)+0.99999")
	public int getMonthlySales();
	
	@Select("Select sum(b_total) from buy where b_date between TO_DATE(SYSDATE-366) AND TO_DATE(SYSDATE)+0.99999")
	public int getYearlySales();
	
	@Select("Select sum(b_total) from buy ")
	public int getTotalSales();
	
	/*===============================================기간별 판매량 통계 ====================================================*/
	
	@Select("select count(*) from product p , buy b where p.p_number = b.p_number and p.p_brand = #{p_brand} and b.b_date between TO_DATE(SYSDATE-31) AND TO_DATE(SYSDATE)+0.99999")
	public int getBrandMonthSales(@Param("p_brand")String p_brand);
	
	
	@Select("Select DISTINCT p_brand from product order by p_brand asc")
	public String[] getBrand();

}
