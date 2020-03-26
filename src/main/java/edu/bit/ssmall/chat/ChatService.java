package edu.bit.ssmall.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.vo.MemberVO;

@Service
public class ChatService {
	
	@Autowired
	ChatMapper chatMapper;

	public MemberVO getMemberInfo(String m_id) {
		
		return chatMapper.getMemberInfo(m_id);
	}
	
	
}
