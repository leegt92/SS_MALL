<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>상승몰</title>
    
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet"> 
    
    <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/productlogo.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<style>
.bg-light {
	background-color: rgba(149, 204, 210, 0.2)!important;
}
 ul li {
		border-bottom: 1px solid #bebebe;
    }
</style>
  </head>

  <body>
  
     <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
      <a href="/ssmall" class="logo"><img src="images/icons/mainlogo.png" alt="IMG-LOGO" style="
    width: 200px;
    height: 60px;
 	"></a>
      <a href="/ssmall" style="color:white">홈</a>
      <a href="/ssmall/productView" style="color:white">상품</a>
      <a href="/ssmall/cartview" style="color:white">장바구니</a>
      <a href="blog.html" style="color:white">Blog</a>
      <a href="about.html" style="color:white">About</a>
      <a href="contact.html" style="color:white">Contact</a>
     
      <ul class="navbar-nav px-3 d-none d-sm-block">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="#" onclick="document.getElementById('logout').submit();">
          	<form id="logout" action="logout" method="POST">
          							Sign out
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />			
			</form>
		</a>
        </li>
      </ul>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-md-block bg-light sidebar m-t-37" style = "width:320px;top: 23px;">
          <div class="sidebar-sticky">
          	<h3><a href="/ssmall/myPage" style="color:black">MyPage</a></h3>
            <ul class="nav flex-column">
              <!-- <li class="nav-item">
                <a class="nav-link active" href="#">
                  <span data-feather="home"></span>
                  Dashboard <span class="sr-only">(current)</span>
                </a> -->
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/myPage_reviseInformation">
                  <span data-feather="file"></span>
                  <b>▶회원 정보 수정</b>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/myPage_orderedList">
                  <span data-feather="shopping-cart"></span>
                  <b>나의 주문 내역</b>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/myPage_shoppingList">
                  <span data-feather="shopping-cart"></span>
                  <b>나의 구매 내역</b>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/myPage_askRequestView">
                  <span data-feather="users"></span>
                  <b>1:1 문의</b>
                </a>
              </li>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/myPage_aSRequestView">
                  <span data-feather="layers"></span>
                  <b>A/S 서비스 신청</b>
                </a>
              </li>
            </ul>
          </div>
        </nav>
		
		<div class="limiter" style="position:fixed;left: 770px;width: 330px;top: 100px;">
		<div class="container-login100"
			style="background-color: #bebebe;border:3px solid black;width: 660px;height: 806px;">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				



				<form:form action="myPage_reviseInformation2" class="container-login100"
					method="post" id="reviseInformation">
					<span class="login100-form-title p-b-49" style="position:absolute;left: 245px;bottom: 700px;width: 300px;right: 0px;"	><font size="5em"><b>회원정보 수정</b></font></span>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="아이디 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">아이디</font></span> <div><c:out value="${m_id}"/> (아이디는 수정이 불가능합니다.)</div> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
						<div id="id_check"> </div>
					</div>



					<div class="wrap-input100 validate-input m-b-23"
						data-validate="비밀번호 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">비밀번호 (8자리 이상 12자리 이하)</font></span> 
						<input class="input100" id="m_password"
							type="password" name="m_password" placeholder="수정할 비밀번호를 입력해주세요"
							maxlength="20" style="width: 545px;"> <span class="focus-input100"
							data-symbol="&#xf190;"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="비밀번호 한번더 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">비밀번호 확인</font></span> 
						<input id="m_checkpassword" class="input100" id="m_checkpassword"
							type="password" name="m_checkpassword"
							placeholder="수정할 비밀번호를 확인해주세요" maxlength="20" style="width: 545px;"> <span
							class="focus-input100" data-symbol="&#xf190;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="이름 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">이름 (완전한 한글만 입력가능)</font></span> <input id = "m_name" class="input100"
							type="text" name="m_name" placeholder= "<c:out value="${m_name2}"/>(클릭하여 수정할 값을 입력하세요)" maxlength="5" style="width: 545px;">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
						
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="나이 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">나이 (숫자만 입력가능)</font></span> <input id="m_age" class="input100"
							type="text" name="m_age" placeholder="<c:out value="${m_age3}"/>(클릭하여 수정할 값을 입력하세요)" maxlength="2" style="width: 545px;">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="이메일 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">이메일</font></span> <div><c:out value="${m_email}"/> (이메일은 수정이 불가능합니다.)</div> <span
							class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="배송지 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">주소 (클릭 후 팝업창 이용, 세부주소는 이어서 직접 입력)</font></span> <input id="m_adress" class="input100"
							type="text" name="m_adress" placeholder="<c:out value="${m_adress2}"/>(클릭하여 수정할 값을 입력하세요)" style="width: 545px;"> <span
							class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="핸드폰번호 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">핸드폰번호 ('-'없이 11자리만 입력가능)</font></span> <input id = "m_phonenum" class="input100"
							type="text" name="m_phonenum" placeholder="<c:out value="${m_phonenum2}"/>(클릭하여 수정할 값을 입력하세요)"
							maxlength="11" style="width: 545px;"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23">
						<span class="label-input100"><font size="4em" color="black">이메일 수신여부</font></span> <input type="radio"
							name="m_receive_email" value="1"><font size="2em" color="black" style="position:absolute;left: 75px;bottom: 99px;width: 300px;right: 0px;">광고성 이메일을 수신하겠습니다.</font> 
							<input type="radio"
							name="m_receive_email" value="0" style="position:fixed;top: 790px;"><font size="2em" color="black" style="position:absolute;left: 75px;bottom: 119px;width: 300px;right: 0px;">광고성 이메일을 수신하지 않겠습니다.</font>
					</div>

					<div class="flex-c-m">
						<button id="revise_submit" class="btn btn-secondary" style="position:fixed;top: 830px;left: 1010px;">수정완료</button>
						<button id="withdraw_submit" class="btn btn-secondary" style="
    						position:fixed;
    						margin-left: 10px;
    						padding-left: 0px;
    						padding-bottom: 0px;
    						padding-top: 0px;
    						padding-right: 0px;
    						top: 830px;
    						left: 1090px;
    						height: 35px;
    						">
    						
					</div>
				</form:form>
				<form:form action="myPage_reviseInformation3" class="login100-form validate-form" method="POST">
    				<input class="btn btn-secondary" type="submit" value="회원탈퇴" style="
					 margin-left: 280px;
				  	 margin-top: 23px;
					">
    			</form:form>
			</div>
		</div>
	</div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"><\/script>')</script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/sweetalert2.js"></script>
    <script src="js/sweetalert1.js"></script>
    <script src="js/alert.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
    

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

    <!-- Graphs -->
    <
    
    <script>
    	$("#m_adress").click(function execPostCode() {
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

    				$("[name=m_adress]").val("(" + data.zonecode + ") " + fullRoadAddr);

    				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
    				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
    				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
    			}
    		}).open();
    	});
    	
	    $("#reviseInformation").submit(function(event) {
	    		var replaceNotInt = /[^0-9]/gi;
	    		var replaceNotFullKorean = /[^가-힣]/gi;
	    		var a1 = document.getElementById("m_password").value;
	    		var a2 = document.getElementById("m_name").value;
	    		var a3 = document.getElementById("m_age").value;
	    		var a4 = document.getElementById("m_adress").value;
	    		var a5 = document.getElementById("m_phonenum").value;
	    		var a6 = document.getElementsByName("m_receive_email")[0].checked;
	    		var a7 = document.getElementsByName("m_receive_email")[1].checked;
	    		var a8 = document.getElementById("m_checkpassword").value;
	    	 	if(a1 != "" || a2 != "" || a3 != "" || a4 != "" || a5 != "" || a6 != false || a7 != false) {
	    	 		if(a1 != a8) {
	    	 			event.preventDefault();
						Swal.fire({
						icon: 'error',
						position: 'center',
						title: '비밀번호 확인 불일치',
						text: '입력하신 비밀번호와 비밀번호 확인이 일치하지 않습니다.',	
						});
	    	 		}
	    	 		else if(a1 != "" && (a1.length < 8 || a1.length > 12)) {
	    	 			event.preventDefault();
						Swal.fire({
						icon: 'error',
						position: 'center',
						title: '비밀번호를 다시 입력해주세요.',
						text: '비밀번호는 8자리 이상 12자리 이하만 가능합니다.',	
						});
	    	 		}
	    	 		else if(a2 != "" && a2.match(replaceNotFullKorean)) {
	    	 			event.preventDefault();
						Swal.fire({
						icon: 'error',
						position: 'center',
						title: '이름은 한글만 입력가능',
						text: '이름은 완전한 한글글자만 입력 가능합니다.',	
						});
	    	 		}
	    	 		else if(a3 != "" && a3.match(replaceNotInt)) {
	    	 			event.preventDefault();
						Swal.fire({
						icon: 'error',
						position: 'center',
						title: '나이는 숫자만 입력가능',
						text: '나이는 숫자만 입력 가능합니다.',	
						});
	    	 		}
	    	 		else if(a5 != "" && (a5.match(replaceNotInt) || a5.length != 11)) {
	    	 			event.preventDefault();
						Swal.fire({
						icon: 'error',
						position: 'center',
						title: '폰번호는 숫자만 입력가능',
						text: '폰번호는 \'-\' 없이 숫자 11자리만 입력 가능합니다.',	
						});
	    	 		}
	    	 		else {
				    	event.preventDefault();
						Swal.fire({
						icon: 'success',
						position: 'center',
						title: '수정완료',
						text: '수정이 완료되었습니다.',	
						}).then(function() {
							var elem = document.getElementById('reviseInformation');
							elem.submit();
						});
	    	 		}
	    	 	}
	    });
    		
			
    		
	</script>
  </body>
</html>
