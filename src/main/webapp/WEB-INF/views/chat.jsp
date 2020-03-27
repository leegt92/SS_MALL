<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale =1">

<link rel="stylesheet" href="/ssmall/css/bootstrap.css">
<title>상승몰 채팅</title>

<script type="text/javascript" src="/ssmall/js/jquery-3.2.1.js"/></script>
<script type="text/javascript" src="/ssmall/js/sockjs-0.3.4.js"/></script>

<script type="text/javascript">
 
    $(document).ready(function(){
    	 $('#btnSend').on('click', function(evt) {
    		  evt.preventDefault();
    	  if (socket.readyState !== 1) return;
    	    	  let msg = $('input#msg').val();
    	    	  socket.send(msg);
    	    	  document.getElementById("msg").value = null;
    	    });
    	 connect();
    });
</script>

<script>
var socket = null;
	function connect(){
	    var ws = new WebSocket("ws://localhost:8282/ssmall/echo");
	    socket = ws;
	    
	    ws.onopen = function () {
	        console.log('Info: connection opened.');
	        
	 	
	    };
	    
	    ws.onmessage = function (event) {
	        console.log(event.data+'\n');
	        var data = event.data;
	        
	        $("#data").append(data+"<br/>");
	    };
	    
	
	    ws.onclose = function (event) { 
	    	console.log('Info: connection closed.');
	    	//setTimeout( function(){ connect(); }, 1000); // retry connection!!
	   		//클로즈되면 1초에 한번씩 연결 다시한다.
	    };
	    
	    ws.onerror = function (err) { 
	    	console.log('Error :', err); 
	    };
	    
	}  

</script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<div class="chatbody">
					<div class="panel panel-primary">
						<div class="panel-heading top-bar">
							<div class="col-md-8 col-xs-8">
								<h3 class="panel-title">
									<span class="glyphicon glyphicon-comment"></span>상승몰 채팅
								</h3>
							</div>
						</div>
						<div class="panel-body msg_container_base">
							<div class="row msg_container base_sent">
								<div class="col-md-10 col-xs-10">
									<div class="messages msg_sent" id="data">										
									</div>
								</div>
								
							</div>

							<div class="panel-footer">
								<div class="input-group">
									<input id="msg" type="text" class="form-control input-sm chat_input" placeholder="Write your message here..." value="" /> 
									<span class="input-group-btn">
										<button type="button" class="btn btn-primary btn-sm" id="btnSend">
											<i class="fa fa-send fa-1x" aria-hidden="true"></i>
										</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
 
</body>
</html>