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

	
	
	
	 @Select("select bId, bTitle,bName, bDate, bHit, bContent, bStep, bIndent,bGroup,bTotalLike,bType,bTotalrepot,m_number,p_number from board order by bGroup desc, bStep asc") 
	 public List<BoardNoticeVO> selectBoardList();
	 
	
	/*
	 * @Select("update board set bHit=bHit+1 where bId=?") public
	 * List<BoardNoticeVO> selectBoardList();
	 */
	 
	 @Select("select m_number from member where m_id = #{m_id}")
		public int getMnum(@Param("m_id")String m_id);
	 
	 @Select("select count(*) from board where m_number = #{m_number} and btype='공지사항'")
		public int selectAskCountBoard(@Param("m_number") int m_number);
	 
	 @Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board where m_number = #{m_number} and btype='공지사항' ORDER BY bId desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
		public List<BoardVO> selectAskBoardListPage(@Param("m_number") int m_number, @Param("startNum") int startNum, @Param("endNum") int endNum);
	
	 @Select("select * from board where banswerno = #{bid} and btype='공지사항'")
		public BoardVO getAllAskRequestAnswer(@Param("bid") String bid);
	 
	 @Select("select m_name from member where m_id = #{m_id}")
		public String getMname(@Param("m_id")String m_id);
	 
	 @Insert("insert into board (bid,bname,btitle,bcontent,m_number,btype,bdate) values (board_seq.nextval,#{bName},#{bTitle},#{bContent},#{m_number},'공지사항',sysdate)")
		public void insertAsk(@Param("bName")String bName, @Param("bTitle")String bTitle, @Param("bContent")String bContent, @Param("m_number") int m_number);
	 
	 @Update("update board set btitle = #{bTitle}, bcontent = #{bContent} where bid = #{bId}")
		public void updateAskAS(@Param("bTitle")String bTitle, @Param("bContent")String bContent, @Param("bId") String bId);
		
	 @Delete("delete from board where bid = #{bId}")
		public void deleteAskAS(@Param("bId") String bId);
	 
	@Select("select * from board where bId = #{bId}")
	public BoardNoticeVO selectBoardOne(String bId);
	
	@Select("select count(*) from board")
	public int selectCountBoard();
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board where btype='공지사항' ORDER BY bId desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<BoardNoticeVO> selectBoardListPage(@Param("startNum") int startNum, @Param("endNum") int endNum);

	@Update("update board set bHit=bHit+1 where bId=#{bId}")
	public void upHit(String bId);
	
    public List<BoardNoticeVO> selectBoardList(BoardNoticeVO boardVO) throws Exception;
    
    
    public void insertBoard(BoardNoticeVO boardVO) throws Exception;
	
    @Insert("insert into board (bid,bname,btitle,bcontent,m_number,btype,bdate) values (board_seq.nextval,#{bName},#{bTitle},#{bContent},#{m_number},'공지사항',sysdate)")
	public void insertnotice(@Param("bName")String bName, @Param("bTitle")String bTitle, @Param("bContent")String bContent, @Param("m_number") int m_number);
 
    @Delete("delete from board where bid = #{bId}")
	public void deletenotice(@Param("bId") String bId);
    
}




















