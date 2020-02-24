package edu.bit.ssmall.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductVO;
import edu.bit.ssmall.vo.BuyVO;

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
	
	@Insert("insert into board (bid,btitle,bcontent,m_number,btype) values (board_seq.nextval,#{bTitle},#{bContent},#{m_number},'문의/건의')")
	public void insertAsk(@Param("bTitle")String bTitle, @Param("bContent")String bContent, @Param("m_number") int m_number);

	@Insert("insert into board (bid,btitle,bcontent,m_number,btype) values (board_seq.nextval,#{bTitle},#{bContent},#{m_number},'AS요청')")
	public void insertAS(@Param("bTitle")String bTitle, @Param("bContent")String bContent, @Param("m_number") int m_number);

	/*===================================PRODUCT 관련 SQL문들============================================================*/
	@Select("select p_image from product where p_number = #{p_number}")
	public String getPimage (@Param("p_number") int p_number);
	
	@Select("select p_name from product where p_number = #{p_number}")
	public String getPname (@Param("p_number") int p_number);
	
	@Select("select p_price from product where p_number = #{p_number}")
	public int getPprice (@Param("p_number") int p_number);
	
	/*===================================BUY 관련 SQL문들============================================================*/
	@Select("select p_number from buy where m_number = #{m_number}")
	public List<Integer> getPnumbers (@Param("m_number") int m_number);
	
	@Select("select p_number from buy where m_number = #{m_number} and b_done = '1'")
	public List<Integer> getOrderedPnumbers (@Param("m_number") int m_number);
	
	@Select("select b_amount from buy where p_number = #{p_number}")
	public int getBamount (@Param("p_number") int p_number);
	
	@Select("select b_date from buy where p_number = #{p_number}")
	public Date getBdate (@Param("p_number") int p_number);
}
