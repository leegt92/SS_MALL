package edu.bit.ssmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ssmall.page.Criteria;
import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductImageVO;
import edu.bit.ssmall.vo.ProductReplyVO;
import edu.bit.ssmall.vo.ProductVO;


public interface ProductMapper {
	
	//濡쒓렇�씤�릺�뼱�엳�굹 蹂닿퀬, 濡쒓렇�씤 �릺�뼱�엳�떎硫� 洹� �븘�씠�뵒瑜� 媛��졇�삤�뒗 遺�遺�
	@Select("select m_number from member where m_id = #{m_id}")
	public int getMnum(@Param("m_id")String m_id);

	@Select("select * from product p , image i where p.p_number = i.p_number and i.i_type = '1' and p.p_enabled = '1' order by p_name desc")
	public List<ProductImageVO> selectProductList();
	
	@Select("select * from boardVO")
	public List<BoardVO> boardVO();
	
	@Select("select * from product p , image i where p.p_number = i.p_number and i.i_type = '1' and p.p_enabled = '1' order by p_amount desc")
	public List<ProductImageVO> selectProductListAmount();
	
	//productDetail에서 메인상품사진과 이름, 가격 등이 나오는 코드.
	@Select("select * from product p, image i where p.p_number = #{p_number} and i.p_number = p.p_number and p.p_enabled = '1'and i_type < 4 order by i_type asc")
	public List<ProductImageVO> selectProductOne(String p_number);
	
	@Select("Select * from product where p_number = #{p_number} and p_enabled = '1'")
	public ProductVO productOne(String p_number);
	//product의 modal1 부분에서 p_number로 상품의 모든 정보와 i_name을 가져오기 위해.
	@Select("Select * from product p, image i where p.p_number = #{p_number} and p.p_number = i.p_number and p.p_enabled = '1'")
	public List<ProductImageVO> productOneAndIname(String p_number);
	
	@Select("select * from board where bid = #{bid}")
	public BoardVO boardOne(String bid);
	
	@Select("update board set btitle = #{btitle}, bcontent = #{bcontent} where bid = #{bid}")
	public void updateBoard(@Param("btitle")String btitle, @Param("bcontent")String bcontent,@Param("bid")String bid);

	@Select("select * from board b, member m where m.m_number = b.m_number and b.p_number = #{p_number} order by bdate desc")	  		
	public List<ProductReplyVO> productReply(@Param("p_number")String p_number);


	@Insert("insert into board(bid, btitle, bname, bdate, bhit, bcontent, bstep, bindent, bgroup, btype, btotalrepot, m_number,p_number,brepotid1,brepotid2)\r\n" + 
			"values (board_seq.nextval, #{btitle},1, sysdate, 0, #{bcontent}, 0, 0, board_seq.currval, 1, 0, #{m_number},#{p_number},0,0)")
	public void productReplyWrite(ProductReplyVO productReplyVO);
	//占쏙옙訪占쏙옙占�. 회占쏙옙占쏙옙 占쏙옙占쏙옙 占싸븝옙占쏙옙 占쏙옙占쏙옙 占싱쇽옙占쏙옙

	@Select("update board set bdate = #{boardVO.bdate}, btitle = #{boardVO.btitle}, bContent = #{boardVO.bcontent} where bId = #{boardVO.bid}")
	public void updateReply(@Param("boardVO")BoardVO boardVO);
	
	@Delete("delete from board where bid = #{bid}")
	public void replyDelete(BoardVO boardVO);
	
	//principal�뿉�꽌 諛쏆� m_id濡� DB�뿉�꽌 m_number瑜� 媛��졇�삤�뒗 留듯띁.
	@Select("select m_number from member where m_id = #{m_id}")
	public int principalGetMid(String m_id);
	
	@Select("select m_number from board where bid = #{bid}")
	public int checkMid(String bid);
	
	//대댓글 구현 1. bstep 대상외 전부 +1해서 자리 만들기
	@Update("update board set bstep = bstep + 1 where bgroup = #{bgroup} and bstep > #{bstep}")
	public void updateShape(ProductReplyVO productReplyVO);
	/*
	 * @Update("update mvc_board set bStep = bStep + 1 where bGroup = #{bGroup} and bStep > #{bStep}"
	 * ) public void updateShape(BoardVO boardVO);
	 */
			
	//대댓글 구현2. 대댓글 입력. 댓글에 대한 댓글이므로 가로값과 세로값에 해당하는 bstep, bindent를 각각 1씩 추가했다.
	//m_number가 안넘어와서 안되는거였음.
	@Insert("insert into board(bid, btitle, bname, bdate, bhit, bcontent, bstep, bindent, bgroup, btype, btotalrepot, m_number,p_number)\r\n" + 
			"values (board_seq.nextval, #{btitle},1, sysdate, 0, #{bcontent}, #{bstep}+1, #{bindent}+1, board_seq.currval, 1, 0, #{m_number},#{p_number})")
	public void insertReply(ProductReplyVO productReplyVO);
	//ProductReplyVO에 m_id가 있는데 sql문에는 없기 때문에 발생.
				
	//대댓글 구현을 위해 게시글번호(bid)로 그 게시물의 bstep을 빼온다.
	@Select("select bstep from board where bid = #{bid}")
	public int checkBstep(String bid);

	//대댓글 구현을 위해 게시글번호(bid)로 그 게시물의 bindent을 빼온다.
	@Select("select bindent from board where bid = #{bid}")
	public int checkBindent(String bid);
	
	//페이징시 전체상품의 갯수를 확인하기 위해.
	@Select("select count(*) from Product")
	public int selectCountProduct();
	
	//페이징처리된 상품목록을 불러오기 위한 sql문
	@Select("select * from (select a.*, rownum as rnum, count(*) over() as totcnt from (select * from product order by p_name desc) a)where rnum >= #{startNum} and rnum <= #{endNum}")
	public List<ProductVO> selectProductListPage(@Param("startNum")int startNum, @Param("endNum")int endNum);
	
	//페이징처리된 상품목록을 불러오기 위한 sql문
		/* 페이징처리된, 검색시 나오는 리스트를 위해 임시 주석화.
		@Select("select * from (select a.*, rownum as rnum, count(*) over() as totcnt from (select * from product order by p_name desc) a)where rnum >= #{startNum} and rnum <= #{endNum}")
		public List<ProductVO> selectProductListPage(@Param("startNum")int startNum, @Param("endNum")int endNum);
	
	/*
	 * @Select("select * from product p , image i where p.p_number = i.p_number and i.i_type = '1' order by p_name desc"
	 * ) public List<ProductImageVO> selectProductList();
	 */
	/*
	@Select("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM, COUNT(*) OVER() AS TOTCNT FROM (SELECT * FROM board where m_number = #{m_number} and btype='문의/건의' ORDER BY bId desc) A )WHERE RNUM >= #{startNum} AND RNUM <= #{endNum}")
	public List<BoardVO> selectAskBoardListPage(@Param("m_number") int m_number, @Param("startNum") int startNum, @Param("endNum") int endNum);
	*/
	//검색시 페이징에 사용되는 검색어에 대응하는 전체상품의 갯수를 확인하기 위해.
	@Select("select count(*) from Product where p_name like '%'||#{keyword}||'%'")
	public int searchCountProduct(@Param("keyword")String keyword);
	//product에서 검색하기 위한 쿼리문
	@Select("select * from (select a.*, rownum as rnum, count(*) over() as totcnt from (select * from product where p_name like '%'||#{keyword}||'%'order by p_name desc) a)where rnum >= #{startNum} and rnum <= #{endNum}")
	public List<ProductVO> searchProductListPage(@Param("startNum")int startNum, @Param("endNum")int endNum ,@Param("keyword")String keyword);
	
	
	//검색시 페이징에 사용되는 검색어에 대응하는 전체상품의 갯수를 확인하기 위해.
	//product 왼쪽상단 시계, 지갑 클릭시 카테고리에 맞는 상품만 나오면서 페이징도 되도록.
	@Select("select count(*) from Product where p_category like '%'||#{keyword}||'%' and p_enabled = '1'")
	public int searchCountProductCategory(@Param("keyword")String keyword);
	//product에서 검색하기 위한 쿼리문
	@Select("select * from (select a.*, rownum as rnum, count(*) over() as totcnt from (select * from product where p_category like '%'||#{keyword}||'%'order by p_name desc) a)where rnum >= #{startNum} and rnum <= #{endNum} and p_enabled = '1'")
	public List<ProductVO> searchProductListPageCategory(@Param("startNum")int startNum, @Param("endNum")int endNum ,@Param("keyword")String keyword);
	
	//필터 브랜드버전========================================================
	//검색시 페이징에 사용되는 검색어에 대응하는 전체상품의 갯수를 확인하기 위해.
	//product 왼쪽상단 시계, 지갑 클릭시 카테고리에 맞는 상품만 나오면서 페이징도 되도록.
	@Select("select count(*) from Product where p_brand like '%'||#{keyword}||'%' and p_enabled = '1'")
	public int searchCountProductBrand(@Param("keyword")String keyword);
	//product에서 검색하기 위한 쿼리문
	@Select("select * from (select a.*, rownum as rnum, count(*) over() as totcnt from (select * from product where p_brand like '%'||#{keyword}||'%'order by p_name desc) a)where rnum >= #{startNum} and rnum <= #{endNum} and p_enabled = '1'")
	public List<ProductVO> searchProductListPageBrand(@Param("startNum")int startNum, @Param("endNum")int endNum ,@Param("keyword")String keyword);
	
	//순위로 상품 정렬순서를 결정한 상품목록을 가져오는 sql문. order by 부분에 keyword를 직접 넣을 수 있나 확인 
	//페이징처리된 상품목록을 불러오기 위한 sql문
	@Select("select * from (select a.*, rownum as rnum, count(*) over() as totcnt from (select * from product order by ${keyword}) a)where rnum >= #{startNum} and rnum <= #{endNum} and p_enabled = '1'")
	public List<ProductVO> selectProductListPageRank(@Param("startNum")int startNum, @Param("endNum")int endNum, @Param("keyword")String keyword);
	
	//신고하기 버튼 눌렀을때 대상 글 내부 btotalrepot이 1 증가하도록.일단 m_number는 사용 안함. 이미 신고한 사람이 중복신고하는걸 막기위해 넣을예정
	//첫 신고했을때 btotalrepot 1 증가, 그리고 첫신고자 id 저장
	@Update("Update board set BTOTALREPOT = BTOTALREPOT+1, brepotid1 = ${m_number} where bid = ${bid}")
	public void boardReport(@Param("m_number")int m_number, @Param("bid")String bid);
	//두번째 신고시 btotalrepot 1 올리고 두번째 신고자 id 저장
	@Update("Update board set BTOTALREPOT = BTOTALREPOT+1, brepotid2 = ${m_number} where bid = ${bid}")
	public void boardReport2(@Param("m_number")int m_number, @Param("bid")String bid);
	
	//해당 글의 btotalReport을 확인
	@Select("Select BTOTALREPOT from board where bid = ${value}")
	public int checkBoardBtotalRepot(@Param("value")String bid);
	
	//신고수가 3 초과했을 경우 해당 글의 내용 강제변경
	@Select("update board set BCONTENT = '부적절한 내용을 포함하여 삭제된 댓글입니다.' where bid = #{value}")
	public void boardReportWriteUpdate(@Param("value")String bid);
	
	//글에서 첫번째 신고자의 id를 가져옴(brepotid1)
	@Select("select brepotid1 from board where bid = ${value}")
	public int checkBrepotid1(@Param("value")String bid);
	
	//글에서 두번째 신고자의 id를 가져옴(brepotid2)
	@Select("select brepotid2 from board where bid = ${value}")
	public int checkBrepotid2(@Param("value")String bid);
	
	//상품댓글등록시 현재 로그인한 회원이 해당 상품을 구매했는가 확인
	@Select("select count(*) from buy where p_number = ${p_number} and m_number = ${m_number}")
	public int checkBuyList(@Param("p_number")String p_number, @Param("m_number")int m_number);

	

}
