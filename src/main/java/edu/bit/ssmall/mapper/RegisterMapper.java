package edu.bit.ssmall.mapper;


import org.apache.ibatis.annotations.Param;


import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.RegisterRequest;

public interface RegisterMapper {

	
	public void register(@Param("regReq")RegisterRequest regReq);
	
	public MemberVO idChk(@Param("regReq")RegisterRequest regReq); 
}
