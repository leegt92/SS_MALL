package edu.bit.ssmall.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductVO;
import edu.bit.ssmall.vo.Product_BuyVO;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.page.Criteria;
import edu.bit.ssmall.vo.BoardVO;

public interface MypageMapper {
	/*===================================MEMBER 관련 SQL문들============================================================*/

	@Select("select m_number from member where m_id = #{m_id}")
	public int getMnum(@Param("m_id")String m_id);
	
	@Select("select m_password from member where m_id = #{m_id}")
	public String getMpw(@Param("m_id")String m_id);
	
	@Select("select m_id from member where m_id = #{m_id}")
	public String getMid(@Param("m_id")String m_id);
	
	@Select("select m_name from member where m_id = #{m_id}")
	public String getMname(@Param("m_id")String m_id);
	
	@Select("select m_age from member where m_id = #{m_id}")
	public int getMage(@Param("m_id")String m_id);
	
	@Select("select m_adress from member where m_id = #{m_id}")
	public String getMadress(@Param("m_id")String m_id);
	
	@Select("select m_phonenum from member where m_id = #{m_id}")
	public String getMphonenum(@Param("m_id")String m_id);
	
	@Select("select m_email from member where m_id = #{m_id}")
	public String getMemail(@Param("m_id")String m_id);
	
	@Select("select m_point from member where m_id = #{m_id}")
	public int getMpoint(@Param("m_id")String m_id);
	
	@Select("select m_naver from member where m_id = #{m_id}")
	public String getMnaver(@Param("m_id")String m_id);
	
	@Select("select m_kakao from member where m_id = #{m_id}")
	public String getMkakao(@Param("m_id")String m_id);
	
	@Update("update member set m_name = #{m_name} where m_id = #{m_id}")
	public void updateMname(@Param("m_name")String m_name, @Param("m_id")String m_id);
	
	@Update("update member set m_age = #{m_age} where m_id = #{m_id}")
	public void updateMage(@Param("m_age")int m_age, @Param("m_id")String m_id);
	
	@Update("update member set m_adress = #{m_adress} where m_id = #{m_id}")
	public void updateMadress(@Param("m_adress")String m_adress, @Param("m_id")String m_id);
	
	@Update("update member set m_phonenum = #{m_phonenum} where m_id = #{m_id}")
	public void updateMphonenum(@Param("m_phonenum")String m_phonenum, @Param("m_id")String m_id);

	@Update("update member set m_receive_email = '수신' where m_id = #{m_id}")
	public void updateMreceiveToYes(@Param("m_id")String m_id);
	
	@Update("update member set m_receive_email = '비수신' where m_id = #{m_id}")
	public void updateMreceiveToNo(@Param("m_id")String m_id);

	@Update("update member set m_password = #{m_password} where m_id = #{m_id}")
	public void updateMpassword(@Param("m_password")String m_password, @Param("m_id")String m_id);
	
	@Insert("insert into board (bid,bname,btitle,bcontent,m_number,btype,bdate,banswered) values (board_seq.nextval,#{bName},#{bTitle},#{bContent},#{m_number},'문의/건의',sysdate,'답변미완료')")
	public void insertAsk(@Param("bName")String bName, @Param("bTitle")String bTitle, @Param("bContent")String bContent, @Param("m_number") int m_number);
	
	@Update("update board set btitle = #{bTitle}, bcontent = #{bContent} where bid = #{bId}")
	public void updateAskAS(@Param("bTitle")String bTitle, @Param("bContent")String bContent, @Param("bId") String bId);
	
	@Delete("delete from board where bid = #{bId}")
	public void deleteAskAS(@Param("bId") String bId);

	@Insert("insert into board (bid,bname,btitle,bcontent,m_number,btype,bdate,banswered) values (board_seq.nextval,#{bName},#{bTitle},#{bContent},#{m_number},'AS요청',sysdate,'답변미완료')")
	public void insertAS(@Param("bName")String bName, @Param("bTitle")String bTitle, @Param("bContent")String bContent, @Param("m_number") int m_number);
	
	@Delete("delete from member where m_id = #{m_id}")
	public void withdrawMember(@Param("m_id")String m_id);

	/*===================================PRODUCT 관련 SQL문들============================================================*/
	@Select("select p_image from product p join buy b on b.p_number = p.p_number where b_number = #{b_number}")
	public String getPimage (@Param("b_number") int b_number);
	
	@Select("select p_name from product p join buy b on b.p_number = p.p_number where b_number = #{b_number}")
	public String getPname (@Param("b_number") int b_number);
	
	@Select("select p_price from product p join buy b on b.p_number = p.p_number where b_number = #{b_number}")
	public int getPprice (@Param("b_number") int b_number);
	
	/*===================================BUY 관련 SQL문들============================================================*/
	@Select("select b_number from buy where m_number = #{m_number} order by b_number desc")
	public List<Integer> getBnumbers (@Param("m_number") int m_number);
	
	@Select("select b_number from buy where m_number = #{m_number} and b_status = '배송완료'")
	public List<Integer> getOrderedBnumbers (@Param("m_number") int m_number);
	
	@Select("select b_amount from buy where b_number = #{b_number}")
	public int getBamount (@Param("b_number") int b_number);
	
	@Select("select b_date from buy where b_number = #{b_number}")
	public Date getBdate (@Param("b_number") int b_number);
	
	/*===================================PRODUCT_BUY 관련 SQL문들============================================================*/
	@Select("select * from product p join buy b on b.p_number = p.p_number where m_number = #{m_number} and b_status = '배송완료' order by b_number desc")
	public List<Product_BuyVO> getP_BVO (@Param("m_number") int m_number);
	
	@Select("select * from product p join buy b on b.p_number = p.p_number where m_number = #{m_number} and b_status = '결제완료' order by b_number desc")
	public List<Product_BuyVO> getOrderedP_BVO (@Param("m_number") int m_number);
	
	/*===================================BOARD 관련 SQL문들============================================================*/
	//한 회원이 작성한 모든 1:1문의글들을 가져오는 SQL문
	@Select("select * from board where m_number = #{m_number} and btype='문의/건의' ORDER BY bid desc")
	public List<BoardVO> getAllAskRequest (@Param("m_number") int m_number);
	//특정 BID에 답변한 게시판 글을 가져오는 SQL문
	
	@Select("select * from board where m_number = #{m_number} and btype='AS요청' ORDER BY bid desc")
	public List<BoardVO> getAllASRequest (@Param("m_number") int m_number);
	
	@Select("select * from board where banswerno = #{bid} and btype='문의/건의_답변'")
	public BoardVO getAllAskRequestAnswer(@Param("bid") String bid);
	
	@Select("select * from board where banswerno = #{bid} and btype='AS요청_답변'")
	public BoardVO getAllASRequestAnswer(@Param("bid") String bid);
	
	@Select("select count(*) from board")
	public int selectCountBoard();
	
	@Select("select bTitle from board where bid = #{bid}")
	public String selectFbTitle(@Param("bid") String bid);
	
	@Select("select bContent from board where bid = #{bid}")
	public String selectFbContent(@Param("bid") String bid);
	
	@Select("select count(*) from board where m_number = #{m_number} and btype='문의/건의'")
	public int selectAskCountBoard(@Param("m_number") int m_number);
	
	@Select("select count(*) from board where m_number = #{m_number} and btype='AS요청'")
	public int selectASCountBoard(@Param("m_number") int m_number);
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board where m_number = #{m_number} ORDER BY bGroup desc, bStep asc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<BoardVO> selectBoardListPage(@Param("m_number") int m_number, @Param("criteria") Criteria criteria);
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board where m_number = #{m_number} and btype='문의/건의' ORDER BY bId desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<BoardVO> selectAskBoardListPage(@Param("m_number") int m_number, @Param("startNum") int startNum, @Param("endNum") int endNum);
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board where m_number = #{m_number} and btype='AS요청' ORDER BY bId desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<BoardVO> selectASBoardListPage(@Param("m_number") int m_number, @Param("startNum") int startNum, @Param("endNum") int endNum);
	
}
