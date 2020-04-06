<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>상승몰</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/css/util.css">
	<link rel="stylesheet" type="text/css" href="login/css/main.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<!--===============================================================================================-->
	<script src="login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="login/vendor/bootstrap/js/popper.js"></script>
	<script src="login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="login/vendor/daterangepicker/moment.min.js"></script>
	<script src="login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="login/js/main.js"></script>
</head>

<body>
	
	<div class="limiter" >
		<div class="container-login100" style="background-image: url('login/images/bg-02.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">		
				<form:form id="login" action="login" class="login100-form validate-form" method="post">				
					<c:if test="${param.error != null }">
						<script>alert("로그인에 실패하셨습니다. 아이디와 비밀번호를 확인해주세요");</script>
					</c:if>
					<span class="login100-form-title p-b-49">
						로그인
					</span>													
					<div class="wrap-input100 validate-input m-b-23" data-validate = "아이디를 입력하세요">
						<span class="label-input100">아이디</span>														
						<input id= "m_id" class="input100" type="text" name="m_id" placeholder="아이디를 입력하세요">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="비밀번호를 입력하세요">
						<span class="label-input100">비밀번호</span>
						<input id= "m_password" class="input100" type="password" name="m_password" placeholder="비밀번호를 입력하세요">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>					
					
					<Br>
					
					<div style="float: right;">									
						<i class="fas fa-key"></i><span><a href="findId" style="font-weight: bold; display: inline;"> 아이디찾기</a></span>						
						<span><a href="findPw" style="font-weight: bold;">비밀번호찾기</a></span>									
					</div>
					
					<br>
					<br>
	
					<div class="flex-c-m" >
						<button id="submit" class="btn btn-secondary" type="submit">로그인</button><pre> </pre>				
						<a href="register1"><button type="button" class="btn btn-secondary">회원가입</button></a>				
					</div>
					
					<div class="txt1 text-center p-t-54 p-b-20">
						<strong style="color: black; ">
							소셜로그인
						</strong>
					</div>

					<div class="flex-c-m">
						<!-- 네이버 로그인 창으로 이동 -->
						<a href="${naver_url}" ><img width="300" src="login/images/NaverLogin.png" alt="NaverLogin"/></a>							
					</div>
					<br/>
					<div class="flex-c-m">
						<!-- 카카오 로그인 창으로 이동 -->
						<a href="${kakao_url}"><img width="300" src="login/images/KakaoLogin.png" alt="KakaoLogin"/></a>		
					</div>		
				</form:form>
				
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>

</body>
</html>