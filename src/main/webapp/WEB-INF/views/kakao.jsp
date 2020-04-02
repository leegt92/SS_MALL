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

<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>



</head>
<body>
	<div id="kakao-add-channel-button"></div>
	<script type="text/javascript">

	  // input your appkey
	  Kakao.init('5ef19e54d3f212b5ec81e3fbbd80fdc7');
	  
	  Kakao.Channel.createAddChannelButton({
	  	container: '#kakao-add-channel-button',
	  	channelPublicId: '_LVxlXxb' // 채널 홈 URL에 명시된 id로 설정합니다.
	  });
	</script>
	
	
</body>
</html>