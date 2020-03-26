package edu.bit.ssmall.chat;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import edu.bit.ssmall.vo.MemberVO;

public class EchoHandler extends TextWebSocketHandler {
	
	@Autowired
	ChatService chatService;
	
    //방법일 일대일챗팅 map사용
    
    Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
   
    //클라이언트 연결 이후에 실행되는 메소드
    @Override
    public void afterConnectionEstablished(WebSocketSession session)throws Exception {
        System.out.println("afterConnectionEstablished" + session);
     
        String senderId = getName(session); //세션아이디
        sessions.put(senderId, session); //로그인한 회원 이름
       
    }
    
    
    // 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드    
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	
    	System.out.println("handleTextMessage:"+session + " : " + message);
    	String senderName = getName(session);
       
    	Iterator<String> sessionIds = sessions.keySet().iterator();
        String sessionId="";
        while(sessionIds.hasNext()){
             sessionId = sessionIds.next();
             sessions.get(sessionId).sendMessage(new TextMessage("["+senderName +"]"+" : "+ message.getPayload()));
             
        }    
    }
    
    private String getName(WebSocketSession session) {
		
		MemberVO memberVO = chatService.getMemberInfo(session.getPrincipal().getName());
		
		return memberVO.getM_name();
	}


	//클라이언트가 연결을 끊었을 때 실행되는 메소드  
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	System.out.println("afterConnectionClosed:"+ session +" : "+status);
       
    	sessions.remove(session.getId());
       
    }
    
    
}

