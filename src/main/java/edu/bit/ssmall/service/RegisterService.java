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
	
	
	
	public int register(MemberVO memberVO) throws Exception {
       
        int id = registerMapper.idChk(memberVO);
        int email = registerMapper.emailChk(memberVO);
        
        if(id==1) {          
        	System.out.println("아이디존재");
        	return 1;
        } else if (email == 1){     
        	System.out.println("이메일존재");
        	return 2;
        }
        registerMapper.register(memberVO);
        
      
        return 0;
    }

}
