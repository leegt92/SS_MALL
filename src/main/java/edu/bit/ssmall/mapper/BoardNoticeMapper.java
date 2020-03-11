package edu.bit.ssmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.BoardNoticeVO;

public interface BoardNoticeMapper {

	
	
	@Select("select bId, bTitle,bName, bDate, bHit, bContent, bStep, bIndent,bGroup,bTotalLike,bType,bTotalrepot,m_number,p_number from board order by bGroup desc, bStep asc") 
	public List<BoardNoticeVO> selectBoardList();
	
	@Select("select * from board where bId = #{bId}")
	public BoardNoticeVO selectBoardOne(String bId);
	
	@Select("select count(*) from board")
	public int selectCountBoard();
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board where btype='공지사항' ORDER BY bId desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<BoardNoticeVO> selectBoardListPage(@Param("startNum") int startNum, @Param("endNum") int endNum);
	
	
	
}
