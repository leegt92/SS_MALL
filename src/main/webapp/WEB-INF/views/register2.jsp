<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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



				<form action="register.do" class="login100-form validate-form"
					method="post" id="register">
					<span class="login100-form-title p-b-49"> 회원가입 </span>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="아이디 입력해주세요">
						<span class="label-input100">아이디</span> <input class="input100"
							id="m_id" type="text" name="m_id" placeholder="아이디 입력해주세요"
							maxlength="10"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
						<div id="id_check"> </div>
					</div>



					<div class="wrap-input100 validate-input m-b-23"
						data-validate="비밀번호 입력해주세요">
						<span class="label-input100">비밀번호</span> 
						<input class="input100" id="m_password"
							type="password" name="m_password" placeholder="비밀번호 입력해주세요"
							maxlength="20"> <span class="focus-input100"
							data-symbol="&#xf190;"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="비밀번호 한번더 입력해주세요">
						<span class="label-input100">비밀번호 확인</span> 
						<input class="input100" id="m_checkpassword"
							type="password" name="m_checkpassword"
							placeholder="비밀번호 확인해주세요" maxlength="20"> <span
							class="focus-input100" data-symbol="&#xf190;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="이름 입력해주세요">
						<span class="label-input100">이름</span> <input class="input100"
							type="text" name="m_name" placeholder="이름 입력해주세요" maxlength="5">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
						
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="나이 입력해주세요">
						<span class="label-input100">나이</span> <input class="input100"
							type="text" name="m_age" placeholder="나이 입력해주세요" maxlength="2">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="이메일 입력해주세요">
						<span class="label-input100">이메일</span> <input class="input100"
							type="text" name="m_email" placeholder="이메일 입력해주세요"> <span
							class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="배송지 입력해주세요">
						<span class="label-input100">주소</span> <input class="input100"
							type="text" name="m_adress" placeholder="주소 입력해주세요"> <span
							class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="핸드폰번호 입력해주세요">
						<span class="label-input100">핸드폰번호</span> <input class="input100"
							type="text" name="m_phonenum" placeholder="핸드폰번호 입력해주세요"
							maxlength="11"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23">
						이메일 수신여부<span class="label-input100"></span> <input type="radio"
							name="m_receive_email" value="1">수신 <input type="radio"
							name="m_receive_email" value="0">비수신
					</div>

					<div class="flex-c-m">
						<button id="reg_submit" type="submit" class="btn btn-secondary" disabled="disabled">완료</button>
					</div>

				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

	<script>
	$("#reg_submit").click(function(){
		
		$('#register').submit();
	})
	
	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#m_id").blur(function() {
		// id = "id_reg" / name = "userId"
		var m_id = $('#m_id').val();
		$.ajax({
			url : './idChk?m_id=' + m_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("사용중인 아이디입니다");
					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				}else{
					// 1 : 아이디가 중복 안되는 문구
					$("#id_check").text("사용가능한 아이디입니다");
					$("#id_check").css("color", "blue");
					$("#reg_submit").attr("disabled",false );
				}
	
						
					
				}, error : function() {
						console.log("실패");
				}
			});
		});
</script>
	
</body>
</html>