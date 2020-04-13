package edu.bit.ssmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ssmall.vo.BoardNoticeVO;
import edu.bit.ssmall.vo.BoardVO;

public interface BoardNoticeMapper {

	/*
	 * @Select("select bId, bTitle,bName, bDate, bHit, bContent, bStep, bIndent,bGroup,bType,bTotalrepot,m_number,p_number,bAnswered,bAnswerno from board order by bGroup desc, bStep asc"
	 * ) public List<BoardNoticeVO> selectBoardList();
	 */

	@Select("select * from board where bId = #{bId}")
	public BoardNoticeVO selectBoardOne(String bId);

	// 공지사항의 글 갯수
	@Select("select count(*) from board where bType='공지사항'")
	public int selectCountBoard();

	// 혜택의 글 갯수
	@Select("select count(*) from board where bType='혜택'")
	public int selectCountGradeBoard();

	/* WHERE(AND) column LIKE CONCAT('%',#{search_value},'%') */

	// 공지사항 타입 리스트 불러오기
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board where bType='공지사항' ORDER BY bId desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<BoardNoticeVO> selectBoardListPage(@Param("startNum") int startNum, @Param("endNum") int endNum);

	// 혜택 타입 리스트 불러오기
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board where bType='혜택' ORDER BY bId desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<BoardNoticeVO> selectGradeBoardListPage(@Param("startNum") int startNum, @Param("endNum") int endNum);

	// 조회수
	@Update("update board set bHit=bHit+1 where bId=#{bId}")
	public void upHit(String bId);

	// 공지사항 서치
	@Select("select count(*) from board where bTitle and bType='공지사항' like '%'||#{keyword}||'%'")
	public int BoardSearchCount(String keyword);

	@Select("select * from (select a.*, rownum as rnum, count(*) over() as totcnt from (select * from board where bTitle and bType='공지사항'like '%'||#{keyword}||'%'order by bTitle and bType='공지사항' desc) a)where rnum >= #{startNum} and rnum <= #{endNum}")
	public List<BoardNoticeVO> BoardSearchListPage(@Param("startNum") int startNum, @Param("endNum") int endNum,
			@Param("keyword") String keyword);

	@Select("select count(*) from board where bTitle and bType='혜택' like '%'||#{keyword}||'%'")
	public int BoardGradeSearchCount(String keyword);

	@Select("select * from (select a.*, rownum as rnum, count(*) over() as totcnt from (select * from board where bTitle and bType='혜택'like '%'||#{keyword}||'%'order by bTitle and bType='혜택' desc) a)where rnum >= #{startNum} and rnum <= #{endNum}")
	public List<BoardNoticeVO> BoardGradeSearchListPage(@Param("startNum") int startNum, @Param("endNum") int endNum,
			@Param("keyword") String keyword);

	@Select("select bId, bTitle,bName, bDate, bHit, bContent, bStep, bIndent,bGroup,bTotalLike,bType,bTotalrepot,m_number,p_number from board order by bGroup desc, bStep asc")
	public List<BoardNoticeVO> selectBoardList();

	/*
	 * @Select("update board set bHit=bHit+1 where bId=?") public
	 * List<BoardNoticeVO> selectBoardList();
	 */

	@Select("select m_number from member where m_id = #{m_id}")
	public int getMnum(@Param("m_id") String m_id);

	@Select("select count(*) from board where m_number = #{m_number} and btype='공지사항'")
	public int selectAskCountBoard(@Param("m_number") int m_number);

	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board where m_number = #{m_number} and btype='공지사항' ORDER BY bId desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<BoardVO> selectAskBoardListPage(@Param("m_number") int m_number, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	@Select("select * from board where banswerno = #{bid} and btype='공지사항'")
	public BoardVO getAllAskRequestAnswer(@Param("bid") String bid);

	@Select("select m_name from member where m_id = #{m_id}")
	public String getMname(@Param("m_id") String m_id);

	@Insert("insert into board (bid,bname,btitle,bcontent,m_number,btype,bdate) values (board_seq.nextval,#{bName},#{bTitle},#{bContent},#{m_number},'공지사항',sysdate)")
	public void insertAsk(@Param("bName") String bName, @Param("bTitle") String bTitle,
			@Param("bContent") String bContent, @Param("m_number") int m_number);

	@Update("update board set btitle = #{bTitle}, bcontent = #{bContent} where bid = #{bId}")
	public void updateAskAS(@Param("bTitle") String bTitle, @Param("bContent") String bContent,
			@Param("bId") String bId);

	@Delete("delete from board where bid = #{bId}")
	public void deleteAskAS(@Param("bId") String bId);

	@Insert("insert into board (bid,bname,btitle,bcontent,m_number,btype,bdate) values (board_seq.nextval,#{bName},#{bTitle},#{bContent},#{m_number},'공지사항',sysdate)")
	public void insertnotice(@Param("bName") String bName, @Param("bTitle") String bTitle,
			@Param("bContent") String bContent, @Param("m_number") int m_number);

	@Delete("delete from board where bid = #{bId}")
	public void deletenotice(@Param("bId") String bId);

}
