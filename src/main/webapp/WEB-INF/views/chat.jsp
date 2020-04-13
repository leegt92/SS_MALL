<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale =1">

<title>상승몰 채팅</title>
<link rel="icon" type="image/png" href="images/icons/productlogo.png"/>
<script type="text/javascript" src="/ssmall/js/jquery-3.2.1.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/ssmall/css/chat.css">
<script src="js/notification.js"></script>
<script type="text/javascript">
 
    $(document).ready(function(){
    	$('#msg').on('keyup', function(evt) {
    		if (window.event.keyCode == 13) {  			 
    			evt.preventDefault();
        	  	if (socket.readyState !== 1) return;
        	    	let msg = $('input#msg').val();
        	    	socket.send(msg);
        	    	document.getElementById("msg").value = null;
           }
		
    	});
    		
    	$('#btnSend').on('click', function(evt) {
    		evt.preventDefault();
    	  	if (socket.readyState !== 1) return;
    	    	let msg = $('input#msg').val(); 	
    	    	socket.send(msg);
    	    	document.getElementById("msg").value = null;
    	    	$('#msg').focus();
    	});
    	
    	connect();
    	 
    });
</script>

<script>
var socket = null;

	function connect(){
	    var ws = new WebSocket("ws://192.168.6.17:8282/ssmall/echo");
	    socket = ws;
	    
	    ws.onopen = function () {
	        console.log('Info: connection opened.');
	       
	    };
	    
	    ws.onmessage = function (event) {
	        console.log('onmessage');
	        
	        var data = event.data;   
	        
    
	        if(data.indexOf('입장') == -1){
	        	if(data.indexOf('left clearfix') != -1) {	 
		        	console.log("noti()");
		        	noti("메시지가 도착했습니다."); //윈도우 알림 notification 사용       
		        }	
		    }         		
    
	        $("#data").append(data);
	        //자동으로 스크롤 내려감
	        var objDiv = document.getElementById("autoScroll");
	  		objDiv.scrollTop = objDiv.scrollHeight;
	  		
					
	    }; 
	   
	    ws.onclose = function (event) { 
	    	console.log('Info: connection closed.');
	    	
	    	//setTimeout( function(){ connect(); }, 1000); // retry connection!!
	   		//클로즈되면 1초에 한번씩 연결 다시한다.
	    };
	    
	    ws.onerror = function (err) { 
	    	console.log('Error :', err); 
	    };
	    
	};

</script>


</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<div class="panel panel-primary" style="margin-top : 10px">
					<div class="panel-heading">
						<span class="glyphicon glyphicon-comment"></span> Chat				
					</div>
					<div id="autoScroll" class="panel-body">
						<ul id="data" class="chat">
												
						</ul>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input id="msg" type="text" class="form-control input-sm" placeholder="Type your message here..."/> 
							<span class="input-group-btn">
								<button class="btn btn-warning btn-sm" id="btnSend" >
									Send
								</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>