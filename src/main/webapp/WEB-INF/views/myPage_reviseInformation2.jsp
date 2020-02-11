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
  </head>

  <body>
  
    <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
      <a href="#" class="logo"><img src="images/icons/logo-02.png" alt="IMG-LOGO"></a>
      <a href="home" style="color:white">Home</a>
      <a href="productView" style="color:white">Shop</a>
      <a href="shoping-cart.html" style="color:white">Features</a>
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
        <nav class="col-md-2 d-none d-md-block bg-light sidebar m-t-37" style = "width:320px">
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
                <a class="nav-link" href="#">
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
			style="background-image: url('login/images/bg-02.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				



				<form action="register.do" class="login100-form validate-form"
					method="post" id="register">
					<span class="login100-form-title p-b-49" style="position:fixed;top: 120px;"	><font size="5em"><b>회원정보 수정</b></font></span>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="아이디 입력해주세요">
						<span class="label-input100"><font size="4em" color="blue">아이디</font></span> <input class="input100"
							id="m_id" type="text" name="m_id" placeholder="아이디는 수정이 불가능합니다"
							maxlength="10" style="width: 220px;"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
						<div id="id_check"> </div>
					</div>



					<div class="wrap-input100 validate-input m-b-23"
						data-validate="비밀번호 입력해주세요">
						<span class="label-input100"><font size="4em" color="blue">비밀번호</font></span> 
						<input class="input100" id="m_password"
							type="password" name="m_password" placeholder="수정할 비밀번호를 입력해주세요"
							maxlength="20" style="width: 220px;"> <span class="focus-input100"
							data-symbol="&#xf190;"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="비밀번호 한번더 입력해주세요">
						<span class="label-input100"><font size="4em" color="blue">비밀번호 확인</font></span> 
						<input class="input100" id="m_checkpassword"
							type="password" name="m_checkpassword"
							placeholder="수정할 비밀번호를 확인해주세요" maxlength="20" style="width: 220px;"> <span
							class="focus-input100" data-symbol="&#xf190;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="이름 입력해주세요">
						<span class="label-input100"><font size="4em" color="blue">이름</font></span> <input class="input100"
							type="text" name="m_name" placeholder="수정할 이름을 입력해주세요" maxlength="5" style="width: 220px;">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
						
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="나이 입력해주세요">
						<span class="label-input100"><font size="4em" color="blue">나이</font></span> <input class="input100"
							type="text" name="m_age" placeholder="수정할 나이를 입력해주세요" maxlength="2" style="width: 220px;">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="이메일 입력해주세요">
						<span class="label-input100"><font size="4em" color="blue">이메일</font></span> <input class="input100"
							type="text" name="m_email" placeholder="수정할 이메일을 입력해주세요" style="width: 220px;"> <span
							class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="배송지 입력해주세요">
						<span class="label-input100"><font size="4em" color="blue">주소</font></span> <input class="input100"
							type="text" name="m_adress" placeholder="수정할 주소를 입력해주세요" style="width: 220px;"> <span
							class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="핸드폰번호 입력해주세요">
						<span class="label-input100"><font size="4em" color="blue">핸드폰번호</font></span> <input class="input100"
							type="text" name="m_phonenum" placeholder="수정할 핸드폰번호를 입력해주세요"
							maxlength="11" style="width: 220px;"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23">
						<font size="4em" color="blue">이메일 수신여부</font><span class="label-input100"></span> <input type="radio"
							name="m_receive_email" value="1">광고성 이메일을 수신하겠습니다. <input type="radio"
							name="m_receive_email" value="0">광고성 이메일을 수신하지 않겠습니다.
					</div>

					<div class="flex-c-m">
						<button id="reg_submit" type="submit" class="btn btn-secondary" disabled="disabled">수정완료</button>
						<button id="reg_submit" type="submit" class="btn btn-secondary" disabled="disabled" style="
    						margin-left: 10px;">회원탈퇴</button>
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
    <script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"><\/script>')</script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

    <!-- Graphs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script>
      var ctx = document.getElementById("myChart");
      var myChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
          datasets: [{
            data: [15339, 21345, 18483, 24003, 23489, 24092, 12034],
            lineTension: 0,
            backgroundColor: 'transparent',
            borderColor: '#007bff',
            borderWidth: 4,
            pointBackgroundColor: '#007bff'
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: false
              }
            }]
          },
          legend: {
            display: false,
          }
        }
      });
    </script>
  </body>
</html>
