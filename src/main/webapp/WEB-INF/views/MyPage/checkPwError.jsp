<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="/ssmall/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/ssmall/css/dashboard.css" rel="stylesheet"> 
    
    <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/ssmall/images/icons/productlogo.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/ssmall/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/ssmall/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/ssmall/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/ssmall/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/ssmall/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/ssmall/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/ssmall/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/ssmall/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/ssmall/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/ssmall/css/util.css">
	<link rel="stylesheet" type="text/css" href="/ssmall/css/main.css">
<!--===============================================================================================-->
<style>
.bg-light {
	background-color: rgba(149, 204, 210, 0.2)!important;
}
</style>
  </head>

  <body>
  
     <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
      <a href="/ssmall/" class="logo"><img src="/ssmall/images/icons/mainlogo.png" alt="IMG-LOGO" style="
    width: 200px;
    height: 60px;
 	"></a>
      <a href="/ssmall/" style="color:white">홈</a>
      <a href="/ssmall/productView" style="color:white">상품</a>
      <a href="/ssmall/cart/cartview" style="color:white">장바구니</a>
      <a href="/ssmall/boardnoticeView" style="color:white">공지사항</a>
      <a href="/ssmall/companyView" style="color:white">회사소개</a>
      <a href="/ssmall/asView" style="color:white">AS</a>
     
      <ul class="navbar-nav px-3 d-none d-sm-block">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="#">Sign out</a>
        </li>
      </ul>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-md-block bg-light sidebar m-t-37" style = "width:320px;top: 23px;">
          <div class="sidebar-sticky">
          	<h3><a href="/ssmall/mypage/myPage" style="color:black">MyPage</a></h3>
            <ul class="nav flex-column">
              
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/mypage/myPage_reviseInformation">
                  <span data-feather="file"></span>
                  <b>▶회원 정보 수정</b>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/mypage/myPage_orderedList">
                  <span data-feather="shopping-cart"></span>
                  <b>나의 주문 내역</b>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/mypage/myPage_shoppingList">
                  <span data-feather="shopping-cart"></span>
                  <b>나의 구매 내역</b>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/mypage/myPage_askRequest">
                  <span data-feather="users"></span>
                  <b>1:1 문의</b>
                </a>
              </li>
             
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/mypage/myPage_askAS">
                  <span data-feather="layers"></span>
                  <b>A/S 서비스 신청</b>
                </a>
              </li>
            </ul>
          </div>
        </nav>
		
		<div class="limiter" style="position:fixed; left: 500px; width: 1000px; top: 250px;">
		<div class="container-login100" style="background-color: #bebebe;height: 400px; border:3px solid black;">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form id="login" action="/ssmall/mypage/myPage_reviseInformation" class="login100-form validate-form" method="GET">
					

					<div class="wrap-input100 validate-input" data-validate="비밀번호를 입력하세요" style="position:fixed;left: 915px;top: 400px;">
						<span class="label-input100" style="position:fixed;bottom: 670px;left: 850px;top: 330px;"><font size="5em"><b>비밀번호를 다시 입력해 주세요.</b></font></span>
						<input id= "m_password" class="input100" type="password" name="m_password" placeholder="" maxlength="20" style="
    position:fiexd;
    height: 30px;
    border:1px solid black;
    margin-top: 30px;
    " />
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<br>
					<div class="flex-c-m" style="position:fixed;top: 550px;left: 975px;">
						<input id="submit" class="btn btn-secondary" type="submit" value="로그인"><pre> </pre>
						
											
					</div>
					

				
					
					
				</form>
			</div>
		</div>
	</div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="/ssmall/js/jquery-slim.min.js"><\/script>')</script>
    <script src="/ssmall/js/popper.min.js"></script>
    <script src="/ssmall/js/bootstrap.min.js"></script>
    <script src="/ssmall/js/sweetalert2.js"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
    <script>
    Swal.fire({
		icon: 'error',
		position: 'center',
		title: '비밀번호 불일치',
		text: '비밀번호를 다시 입력해 주세요.',	
		}).then(function() {
			window.location = "/ssmall/mypage/myPage_reviseInformation";
		});
	</script>

    
  </body>
</html>
