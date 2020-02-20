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

    <title>Dashboard Template for Bootstrap</title>
    
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet"> 
    
    <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
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
     
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="#">Sign out</a>
        </li>
      </ul>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar m-t-37" style = "width:320px;top: 23px;">
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
                <a class="nav-link" href="/ssmall/myPage_askRequest">
                  <span data-feather="users"></span>
                  <b>1:1 문의</b>
                </a>
              </li>
              <!-- <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="bar-chart-2"></span>
                  Reports
                </a> -->
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/myPage_askAS">
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
						<span class="label-input100"><font size="4em" color="black">비밀번호</font></span> 
						<input class="input100" id="m_password"
							type="password" name="m_password" placeholder="수정할 비밀번호를 입력해주세요"
							maxlength="20" style="width: 545px;"> <span class="focus-input100"
							data-symbol="&#xf190;"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="비밀번호 한번더 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">비밀번호 확인</font></span> 
						<input class="input100" id="m_checkpassword"
							type="password" name="m_checkpassword"
							placeholder="수정할 비밀번호를 확인해주세요" maxlength="20" style="width: 545px;"> <span
							class="focus-input100" data-symbol="&#xf190;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="이름 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">이름</font></span> <input id = "m_name" class="input100"
							type="text" name="m_name" placeholder="수정할 이름을 입력해주세요" maxlength="5" style="width: 545px;">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
						
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="나이 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">나이</font></span> <input id="m_age" class="input100"
							type="text" name="m_age" placeholder="수정할 나이를 입력해주세요" maxlength="2" style="width: 545px;">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="이메일 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">이메일</font></span> <div><c:out value="${m_email}"/> (이메일은 수정이 불가능합니다.)</div> <span
							class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="배송지 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">주소</font></span> <input id="m_adress" class="input100"
							type="text" name="m_adress" placeholder="수정할 주소를 입력해주세요" style="width: 545px;"> <span
							class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="핸드폰번호 입력해주세요">
						<span class="label-input100"><font size="4em" color="black">핸드폰번호</font></span> <input id = "m_phonenum" class="input100"
							type="text" name="m_phonenum" placeholder="수정할 핸드폰번호를 입력해주세요"
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

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
    <script>
    Swal.fire({
		icon: 'error',
		position: 'center',
		title: '수정사항 미입력',
		text: '수정할 사항을 입력해 주세요.',	
		}).then(function() {
			window.location = "/ssmall/myPage_reviseInformation";
		});
	</script>

    
  </body>
</html>
