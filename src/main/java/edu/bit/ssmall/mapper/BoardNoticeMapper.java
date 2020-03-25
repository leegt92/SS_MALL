package edu.bit.ssmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ssmall.vo.BoardNoticeVO;

public interface BoardNoticeMapper {

	
	
	
	/*
	 * @Select("select bId, bTitle,bName, bDate, bHit, bContent, bStep, bIndent,bGroup,bType,bTotalrepot,m_number,p_number,bAnswered,bAnswerno from board order by bGroup desc, bStep asc"
	 * ) public List<BoardNoticeVO> selectBoardList();
	 */
	 
	@Select("select * from board where bId = #{bId}")
	public BoardNoticeVO selectBoardOne(String bId);
	
	//공지사항의 글 갯수
	@Select("select count(*) from board where bType='공지사항'")
	public int selectCountBoard();
	
	//혜택의 글 갯수
	@Select("select count(*) from board where bType='혜택'")
	public int selectCountGradeBoard();

	
	/* WHERE(AND) column LIKE CONCAT('%',#{search_value},'%') */


	//공지사항 타입 리스트 불러오기
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board where bType='공지사항' ORDER BY bId desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<BoardNoticeVO> selectBoardListPage(@Param("startNum") int startNum, @Param("endNum") int endNum);
	
	//혜택 타입 리스트 불러오기
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board where bType='혜택' ORDER BY bId desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}") 
	public List<BoardNoticeVO> selectGradeBoardListPage(@Param("startNum") int startNum, @Param("endNum") int endNum);
	
	//조회수
	@Update("update board set bHit=bHit+1 where bId=#{bId}")
	public void upHit(String bId);
	
	
	
}
