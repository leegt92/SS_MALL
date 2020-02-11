<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<form id="login" action="login.do" class="login100-form validate-form" method="post">
					<span class="login100-form-title p-b-49">
						로그인
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "아이디를 입력하세요">
						<span class="label-input100">아이디</span>
						<input id= "m_id" class="input100" type="text" name="m_id" placeholder="아이디를 입력하세요" maxlength="10">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="비밀번호를 입력하세요">
						<span class="label-input100">비밀번호</span>
						<input id= "m_password" class="input100" type="password" name="m_password" placeholder="비밀번호를 입력하세요" maxlength="20">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<br>
					<div class="flex-c-m">
						<input id="submit" class="btn btn-secondary" type="button" value="로그인"><pre> </pre>
						
						<input id="register" type="button" class="btn btn-secondary" value="회원가입">						
					</div>
					<div class="txt1 text-center p-t-54 p-b-20">
						<span>
							소셜로그인
						</span>
					</div>

					<div class="flex-c-m">
						<a href="fbLogin" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="twLogin" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="gooLogin" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
					</div>

				
					
					
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	

	
	<script type="text/javascript">
	$(document).ready(function(e){
		$('#submit').click(function(){

			// 입력 값 체크
			if($.trim($('#m_Id').val()) == ''){
				alert("아이디를 입력해 주세요.");
				$('#m_Id').focus();
				return;
			}else if($.trim($('#m_password').val()) == ''){
				alert("패스워드를 입력해 주세요.");
				$('#m_password').focus();
				return;
			}
			
			//전송
			$('#login').submit();
		});
		
		//회원가입 버튼
		$('#register').click(function() {
			location.href="register1";
		});
		
	});
</script>
</body>
</html>