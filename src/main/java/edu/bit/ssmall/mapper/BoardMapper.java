package edu.bit.ssmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.BoardVO;

public interface BoardMapper {

	@Select("select bId, bTitle,bName, bDate, bHit, bContent, bStep, bIndent,bGroup,bTotalLike,bType,bTotalrepot,m_number,p_number from board order by bGroup desc, bStep asc")
	public List<BoardVO> selectBoardList();
	
	@Select("select * from board where bId = #{bId}")
	public BoardVO selectBoardOne(String bId);
	
	
	
}
