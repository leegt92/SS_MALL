package edu.bit.ssmall.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.Board_MemberVO;
import edu.bit.ssmall.vo.ProductVO;

public interface AdminMapper {

	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM product ORDER BY p_name desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public ArrayList<ProductVO> productList(@Param("startNum")int startNum, @Param("endNum")int endNum);
	
	@Select("Select count(*) from product")
	public int countProduct();
	
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
}
