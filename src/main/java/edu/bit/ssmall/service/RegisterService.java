package edu.bit.ssmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.exception.AlreadyExistingIdException;
import edu.bit.ssmall.mapper.RegisterMapper;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.RegisterRequest;

@Service
public class RegisterService {
	
	@Autowired
	RegisterMapper registerMapper;
	
	
	
	public void register(RegisterRequest regReq) throws Exception {
       
        MemberVO id = registerMapper.idChk(regReq);
        
        if(id!=null) {
            throw new AlreadyExistingIdException(regReq.getM_id()+" is alreay exist");
        }
        
        registerMapper.register(regReq);
    }

	
}
