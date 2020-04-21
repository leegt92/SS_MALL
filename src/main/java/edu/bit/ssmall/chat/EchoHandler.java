package edu.bit.ssmall.chat;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

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
   // Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
    
    //다대다 채팅
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

 
   
    //클라이언트 연결 이후에 실행되는 메소드
    @Override
    public void afterConnectionEstablished(WebSocketSession session)throws Exception {
        System.out.println("afterConnectionEstablished" + session);
     /*
        String senderName = getName(session); //세션아이디
        sessions.put(senderName, session); //로그인한 회원 이름
       
        Iterator<String> sessionIds = sessions.keySet().iterator();
        String sessionId="";
        while(sessionIds.hasNext()){
             sessionId = sessionIds.next();
             System.out.println(sessionId); 
			sessions.get(sessionId).sendMessage(new TextMessage("<p style='text-align : center;'>"+senderName + " 님이 입장하셨습니다.</p>" + "<br>"));
        }    
     */
        //List쓸때
        sessionList.add(session);
        for(WebSocketSession sess : sessionList){ 
	        String senderName = getName(session);
	        sess.sendMessage(new TextMessage("<p style='text-align : center;'>"+senderName + " 님이 입장하셨습니다.</p>" + "<br>"));
        }
      
    }
    
    
    // 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드    
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	
    	System.out.println("handleTextMessage:"+session + " : " + message);
    	/*
    	String senderName = getName(session);
    	String time = getTime();
    	
    	
    	Iterator<String> sessionIds = sessions.keySet().iterator();
        String sessionId="";
        while(sessionIds.hasNext()){
             sessionId = sessionIds.next();
             
             System.out.println(senderName); //작성자
             System.out.println(sessionId); //맵에 담겨진거 돌면서    
           
             if (senderName.equals(sessionId)) { //자신이 작성한건 오른쪽에
            	 //sessions.get(sessionId).sendMessage(new TextMessage("<li class='right clearfix'><span class='chat-img pull-right'><img src='http://placehold.it/50/FA6F57/fff&text=ME' alt='User Avatar' class='img-circle' /></span>" + "<div class='chat-body clearfix'><div class='header'><small class='text-muted'><span class='glyphicon glyphicon-time'></span>" + time + "</small>" + "<strong class='pull-right primary-font'>" + senderName + "</strong></div>" + "<p>" + message.getPayload() + "</p></div></li>"));
			} else {//남이 작성한건 왼쪽에
				 sessions.get(sessionId).sendMessage(new TextMessage("<li class='left clearfix'>" + "<span class='chat-img pull-left'>" + "<img src='http://placehold.it/50/55C1E7/fff&text=U' alt='User Avatar' class='img-circle'/></span>" + "<div class='chat-body clearfix'>" + "<div class='header'>" + "<strong class='primary-font'>" + senderName + "</strong>" + "<small class='pull-right text-muted'>" + "<span class='glyphicon glyphicon-time'></span>"+ time + "</small></div>" + "<p>" + message.getPayload() + "</p></div></li>" ));
			}
 
        }    
    	 */    
    	String senderName = getName(session);
		String time = getTime();
    	for(WebSocketSession sess : sessionList){    
    		
    		if(!sess.getId().equals(session.getId())) {	
    			System.out.println("다른사람이 채팅한것");
	    		sess.sendMessage(new TextMessage("<li class='left clearfix'>" + "<span class='chat-img pull-left'>" + "<img src='http://placehold.it/50/55C1E7/fff&text=U' alt='User Avatar' class='img-circle'/></span>" + "<div class='chat-body clearfix'>" + "<div class='header'>" + "<strong class='primary-font'>" + senderName + "</strong>" + "<small class='pull-right text-muted'>" + "<span class='glyphicon glyphicon-time'></span>"+ time + "</small></div>" + "<p>" + message.getPayload() + "</p></div></li>" )); 		
    		}else {
    			sess.sendMessage(new TextMessage("<li class='right clearfix'><span class='chat-img pull-right'><img src='http://placehold.it/50/FA6F57/fff&text=ME' alt='User Avatar' class='img-circle' /></span>" + "<div class='chat-body clearfix'><div class='header'><small class='text-muted'><span class='glyphicon glyphicon-time'></span>" + time + "</small>" + "<strong class='pull-right primary-font'>" + senderName + "</strong></div>" + "<p>" + message.getPayload() + "</p></div></li>"));
    		}
    	}


 
    }
   
   

	//클라이언트가 연결을 끊었을 때 실행되는 메소드  
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	System.out.println("afterConnectionClosed:"+ session +" : "+status);
    	
        //sessions.remove(session.getId());
    	 sessionList.remove(session);
    }
    
    private String getTime() {
    	
    	Calendar cal = Calendar.getInstance();
    	String hour = Integer.toString(cal.get(Calendar.HOUR_OF_DAY));
    	String min = Integer.toString(cal.get(Calendar.MINUTE));  
    	String sec = Integer.toString(cal.get(Calendar.SECOND));
        
    	if (min.length()==1) {
    		min = "0" + min;
    	}
    	if(sec.length()==1) {
    		sec = "0" + sec;
    	}
    	
        String today = hour + ":" + min + ":" + sec;
        return today;
    }
    
    private String getName(WebSocketSession session) {
		
		MemberVO memberVO = chatService.getMemberInfo(session.getPrincipal().getName());
		if(memberVO.getM_authority().equals("관리자")) {
			memberVO.setM_name("상승몰 관리자");
		}
		return memberVO.getM_name();
	}

}

