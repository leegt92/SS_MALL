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
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('login/images/bg-02.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<div class="login100-form-title p-b-40">
					소셜로그인	
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
				</div>
				
				
				
				<form action="register.do" class="login100-form validate-form" method="post">
					<span class="login100-form-title p-b-49">
						회원가입
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "이름 입력해주세요">
						<span class="label-input100">이름</span>
						<input class="input100" type="text" name="m_name" placeholder="이름 입력해주세요">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-23">

						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="optradio">남자
							</label>
						</div>
						
						<div class="form-check-inline">
							<label class="form-check-label"> 
							<input type="radio" class="form-check-input" name="optradio">여자
							</label>
						</div>
					</div>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "아이디 입력해주세요">
						<span class="label-input100">아이디</span>
						<input class="input100" type="text" name="m_id" placeholder="아이디 입력해주세요">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
	
					<div class="wrap-input100 validate-input m-b-23" data-validate="비밀번호 입력해주세요">
						<span class="label-input100">비밀번호</span>
						<input class="input100" type="password" name="m_password" placeholder="비밀번호 입력해주세요">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-23" data-validate="나이 입력해주세요">
						<span class="label-input100">나이</span>
						<input class="input100" type="text" name="m_age" placeholder="나이 입력해주세요">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-23" data-validate="배송지 입력해주세요">
						<span class="label-input100">주소</span>
						<input class="input100" type="text" name="m_adress" placeholder="배송지 입력해주세요">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-23" data-validate="핸드폰번호 입력해주세요">
						<span class="label-input100">핸드폰번호</span>
						<input class="input100" type="text" name="m_phonenum" placeholder="핸드폰번호 입력해주세요">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
			
					<div class="flex-c-m">
						<input class="btn btn-primary" type="submit" value="완료">	
					</div>
	
					
		
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
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

</body>
</html>