package edu.bit.ssmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.exception.AlreadyExistingEmailException;
import edu.bit.ssmall.exception.AlreadyExistingIdException;
import edu.bit.ssmall.mapper.RegisterMapper;
import edu.bit.ssmall.vo.MemberVO;

@Service
public class RegisterService {
	
	@Autowired
	RegisterMapper registerMapper;
	
	
	
	public void register(MemberVO memberVO) throws Exception {
       
        int id = registerMapper.idChk(memberVO);
        int email = registerMapper.emailChk(memberVO);
        
        if(id==1) {
            throw new AlreadyExistingIdException(memberVO.getM_id()+" is alreay exist");
        } else if (email == 1){
        	throw new AlreadyExistingEmailException(memberVO.getM_email()+" is alreay exist");
        }
        
        registerMapper.register(memberVO);
    }

	
}
