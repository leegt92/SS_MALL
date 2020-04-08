package edu.bit.ssmall.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board b join member m using(m_number) where btype='문의/건의' ORDER BY bid desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<Board_MemberVO> selectAskBoardListPage(@Param("startNum") int startNum, @Param("endNum") int endNum);
	
	@Select("select * from board b, member m where b.m_number = m.m_number and btype='AS요청' ORDER BY bid desc")
	public List<Board_MemberVO> getAllASRequest ();
	
	@Select("select count(*) from board b, member m where b.m_number = m.m_number and btype='AS요청'")
	public int selectASCountBoard();
	
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board b join member m using(m_number) where btype='AS요청' ORDER BY bid desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<Board_MemberVO> selectASBoardListPage(@Param("startNum") int startNum, @Param("endNum") int endNum);

}
