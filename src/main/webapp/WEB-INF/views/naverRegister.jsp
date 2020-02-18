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
<link rel="icon" type="image/png" href="/ssmall/login/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ssmall/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ssmall/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ssmall/login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ssmall/login/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ssmall/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ssmall/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ssmall/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ssmall/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/ssmall/login/css/util.css">
<link rel="stylesheet" type="text/css" href="/ssmall/login/css/main.css">
<!--===============================================================================================-->
<script src="/ssmall/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="/ssmall/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="/ssmall/login/vendor/bootstrap/js/popper.js"></script>
<script src="/ssmall/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="/ssmall/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="/ssmall/login/vendor/daterangepicker/moment.min.js"></script>
<script src="/ssmall/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="/ssmall/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="/ssmall/login/js/main.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>


	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=addr1]").val(data.zonecode);
				$("[name=addr2]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
	}
</script>

</head>
<body>

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('/ssmall/login/images/bg-02.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">	
				<form:form role="form" commandName="memberVO"  action="/ssmall/naverRegister" method="post" class="login100-form validate-form"> 				
					<input class="input100" type="hidden" value="${memberVO.m_email}" name="m_id" >
					<input class="input100" type="hidden" value="${memberVO.m_naver}" name="m_password" >
					<input class="input100" type="hidden" value="${memberVO.m_name}" name="m_name" >
					<input class="input100" type="hidden" value="${memberVO.m_naver}" name="m_naver" >
					<input class="input100" type="hidden" value="${memberVO.m_email}" name="m_email" >			
					
					<div class="wrap-input100 validate-input m-b-23">
						<span class="label-input100">나이</span> 
						<form:input id="age" class="input100" type="text" placeholder="나이 입력해주세요" path="m_age"/>
						<form:errors path="m_age" cssStyle="color:red;"/> 
						<span class="focus-input100" data-symbol="&#xf206;"></span>				
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-23">
						<span class="label-input100">주소</span><br>
						<input class="form-control" style="width: 40%; display: inline;"
							placeholder="우편번호" name="addr1" id="addr1" type="text"
							readonly="readonly">
						<button type="button" class="btn btn-default"
							onclick="execPostCode();">
							<i class="fa fa-search"></i> 우편번호 찾기
						</button>
					</div>
					<div class="form-group">
						<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
							name="addr2" id="addr2" type="text" readonly="readonly" />
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="상세주소" name="addr3"
							id="addr3" type="text" />
					</div>
			
					<div class="wrap-input100 validate-input m-b-23">
						<span class="label-input100">핸드폰번호</span> 
						<form:input class="input100" type="text" placeholder="핸드폰번호 입력해주세요 (-)미포함"  path="m_phonenum"/>
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