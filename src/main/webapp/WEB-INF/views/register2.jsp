<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>상승몰</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="login/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/vendor/daterangepicker/daterangepicker.css">
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

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('login/images/bg-02.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<div class="login100-form-title p-b-40">
					소셜로그인
					<div class="flex-c-m">
						<a href="fbLogin" class="login100-social-item bg1"> <i
							class="fa fa-facebook"></i>
						</a> <a href="twLogin" class="login100-social-item bg2"> <i
							class="fa fa-twitter"></i>
						</a> <a href="gooLogin" class="login100-social-item bg3"> <i
							class="fa fa-google"></i>
						</a>
					</div>
				</div>



				<form:form role="form" commandName="registerRequest" action="register.do" method="post" class="login100-form validate-form"> 				
					<span class="login100-form-title p-b-49"> 회원가입 </span>
					
					<div class="wrap-input100 validate-input m-b-23">
						<span class="label-input100">아이디</span>
						<form:input class="input100" type="text" placeholder="아이디 입력해주세요" path="m_id"/>
						<form:errors path="m_id" cssStyle="color:red;"/> 
						<span class="focus-input100" data-symbol="&#xf206;"></span>					
					</div>

					<div class="wrap-input100 validate-input m-b-23">
						<span class="label-input100">비밀번호</span> 
						<form:input class="input100" type="password" placeholder="패스워드 입력해주세요" path="m_password"/>
						<form:errors path="m_password" cssStyle="color:red;"/> 
						<span class="focus-input100" data-symbol="&#xf206;"></span>				
					</div>
					
					<div class="wrap-input100 validate-input m-b-23">
						<span class="label-input100">비밀번호</span> 
						<form:input class="input100" type="password" placeholder="패스워드 확인해주세요"  path="m_checkpassword"/>
						<form:errors path="m_checkpassword" cssStyle="color:red;"/> 
						<span class="focus-input100" data-symbol="&#xf206;"></span>				
					</div>
					
					<div class="wrap-input100 validate-input m-b-23">
						<span class="label-input100">이름</span> 
						<form:input class="input100" type="text" placeholder="이름 입력해주세요" path="m_name"/>
						<form:errors path="m_name" cssStyle="color:red;"/> 
						<span class="focus-input100" data-symbol="&#xf206;"></span>				
					</div>
					
					<div class="wrap-input100 validate-input m-b-23">
						<span class="label-input100">나이</span> 
						<form:input class="input100" type="text" placeholder="나이 입력해주세요" path="m_age"/>
						<form:errors path="m_age" cssStyle="color:red;"/> 
						<span class="focus-input100" data-symbol="&#xf206;"></span>				
					</div>
					
					<div class="wrap-input100 validate-input m-b-23">
						<span class="label-input100">이메일</span> 
						<form:input class="input100" type="email" placeholder="이메일 입력해주세요"  path="m_email"/>
						<form:errors path="m_email" cssStyle="color:red;"/> 
						<span class="focus-input100" data-symbol="&#xf206;"></span>				
					</div>

					<div class="wrap-input100 validate-input m-b-23">
						<span class="label-input100">주소</span> 
						<form:input class="input100" type="text" placeholder="주소 입력해주세요"  path="m_adress"/>
						<form:errors path="m_adress" cssStyle="color:red;"/> 
						<span class="focus-input100" data-symbol="&#xf206;"></span>				
					</div>
					
					<div class="wrap-input100 validate-input m-b-23">
						<span class="label-input100">핸드폰번호</span> 
						<form:input class="input100" type="text" placeholder="핸드폰번호 입력해주세요"  path="m_phonenum"/>
						<form:errors path="m_phonenum" cssStyle="color:red;"/> 
						<span class="focus-input100" data-symbol="&#xf206;"></span>				
					</div>

					<div class="flex-c-m">
		       			<button type="submit" class="btn btn-secondary">가입하기</button><pre> </pre>
		                <button type="reset" class="btn btn-secondary">취소하기</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>

</body>
</html>