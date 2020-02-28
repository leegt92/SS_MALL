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
     
      <ul class="navbar-nav px-3">
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
                  <b>회원 정보 수정</b>
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
                  <b>▶A/S 서비스 신청</b>
                </a>
              </li>
            </ul>
          </div>
        </nav>
		
	<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116" style="
	    margin-left: 0px;
	    margin-top: 100px;
	    padding-top: 0px;
	    padding-left: 0px;
	    position: fixed;
	    left: 400px;
	    ">
		<div class="container" >
			<div class="flex-w flex-tr">
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md" 
				width:1142px; height:527px; style="
				 width: 1142px;
   				 height: 527px;
				">
					<form id="submitASRequest" action="myPage_askAS2">
					<input type="hidden" name="bId" value="${bId}">
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							수정할 A/S신청할 제품의 이름과 제품의 하자사항을 입력하세요
						</h4>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input id="bTitle" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="bTitle" placeholder="수정할 제품명을 입력하세요"
							style="padding-left: 30px;">
						</div>

						<div class="bor8 m-b-30">
							<textarea id="bContent" class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="bContent" placeholder="제품의 하자사항과 세부 요청 수정 사항을 입력하세요"></textarea>
						</div>

						<button type="submit" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
							수정
						</button>
					</form>
				</div>

				<div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md" style="
					padding-left: 0px;
					padding-right: 0px;
					height: 162px;
					width: 1142px;
					">
					<div class="flex-w w-full p-b-42" style="
					    padding-bottom: 10px;
					    width: 300px;">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-map-marker"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								주소
							</span>

							<p class="stext-115 cl6 size-213 p-t-18">
								Coza Store Center 8th floor, 379 Hudson St, New York, NY 10018 US
							</p>
						</div>
					</div>

					<div class="flex-w w-full p-b-42" style="
						    width: 300px;
						    padding-left: 100px;">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-phone-handset"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								전화번호
							</span>

							<p class="stext-115 cl1 size-213 p-t-18">
								+1 800 1236879
							</p>
						</div>
					</div>

					<div class="flex-w w-full" style="
						    padding-bottom: 50px;
						    padding-left: 100px;
						">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-envelope"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								이메일주소
							</span>

							<p class="stext-115 cl1 size-213 p-t-18">
								contact@example.com
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
       
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
    	
  	$("#submitASRequest").submit(function(event) {
		var a1 = document.getElementById("bTitle").value;
		var a2 = document.getElementById("bContent").value;
		if(a1 == "" || a2 == "") {
			event.preventDefault();
			Swal.fire({
				icon: 'error',
				position: 'center',
				title: '제품명 및 세부요청 사항 미입력',
				text: '제품명과 세부요청 사항을 모두 입력해 주십시오.',	
			})
		}
		else {
			event.preventDefault();
			Swal.fire({
				icon: 'success',
				position: 'center',
				title: 'AS신청 수정 완료',
				text: 'AS신청 수정이 완료되었습니다.',	
				}).then(function() {
					var elem = document.getElementById('submitASRequest');
					elem.submit();
				});
		}
		
});
    		
			
    		
	</script>

   
  </body>
</html>
