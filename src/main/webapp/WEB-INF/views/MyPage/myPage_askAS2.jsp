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
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/css/dashboard.css" rel="stylesheet"> 
    
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
 ul li {
		border-bottom: 1px solid #bebebe;
    }
</style>
  </head>

  <body>
  
     <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
      <a href="/ssmall/" class="logo"><img src="/ssmall/images/icons/mainlogo.png" alt="IMG-LOGO" style="
    width: 200px;
    height: 60px;
 	"></a>
      <a href="/ssmall" style="color:white">홈</a>
      <a href="/ssmall/productView" style="color:white">상품</a>
      <a href="/ssmall/cart/cartView" style="color:white">장바구니</a>
      <a href="/ssmall/boardnoticeView" style="color:white">공지사항</a>
      <a href="/ssmall/companyView" style="color:white">회사소개</a>
     
      <ul class="navbar-nav px-3 d-none d-sm-block">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="#" onclick="document.getElementById('logout').submit();">
          	<form id="logout" action="/ssmall/logout" method="POST">
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
          	<h3><a href="/ssmall/mypage/myPage_orderedList" style="color:black">MyPage</a></h3>
            <ul class="nav flex-column">
              <!-- <li class="nav-item">
                <a class="nav-link active" href="#">
                  <span data-feather="home"></span>
                  Dashboard <span class="sr-only">(current)</span>
                </a> 
              </li>-->
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/mypage/myPage_reviseInformation">
                  <span data-feather="file"></span>
                  <b>회원 정보 수정</b>
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
                <a class="nav-link" href="/ssmall/mypage/myPage_refundList">
                  <span data-feather="shopping-cart"></span>
                  <b>나의 환불 내역</b>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/mypage/myPage_askRequestView">
                  <span data-feather="users"></span>
                  <b>1:1 문의</b>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/mypage/myPage_aSRequestView">
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
	    margin-top: 50px;
	    padding-top: 0px;
	    padding-left: 0px;
	    position: fixed;
	    left: 400px;
	    ">
		<div class="container" >
			<div class="flex-w flex-tr">
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md" 
				 style="
				 width: 1142px;
				 height: 707px;
				 padding-top: 35px;
				">



					<form id="submitASRequest" action="/ssmall/mypage/myPage_askAS2_back">

					<input type="hidden" name="bId" value="${bId}">
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							수정할 A/S신청할 제품의 이름과 제품의 하자사항을 입력하세요
						</h4>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input id="bTitle" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="bTitle" value="${FbTitle}"
							style="padding-left: 30px;">
						</div>

						<div class="bor8 m-b-30">
							<textarea id="bContent" class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="bContent">${FbContent}</textarea>
						</div>

						<button id = "ASRequest2Button" type="button" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
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

						<div class="size-212 p-t-2" style="margin-bottom: 31px;">
							<span class="mtext-110 cl2">
								주소
							</span>

							<p class="stext-115 cl6 size-213 p-t-18">
								서울 마포구 백범로 23 구프라자 3층
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
								02-707-1480
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
								ssmall@naver.com
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
    <script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/sweetalert2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>


    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
  	 <script>	
  	$("#ASRequest2Button").click(function(event) {
		var a1 = document.getElementById("bTitle").value;
		
		var ckeditor = CKEDITOR.instances['bContent']; 
		if (ckeditor.getData()==""){
			event.preventDefault();
			Swal.fire({
				icon: 'error',
				position: 'center',
				title: '세부 내용 미입력',
				text: "세부 내용을 입력해 주십시오.",	
			})
			ckeditor.focus();
			return;
		}	
		
		if(a1 == "") {
			event.preventDefault();
			Swal.fire({
				icon: 'error',
				position: 'center',
				title: '제품명 미입력',
				text: '제품명을 입력해 주십시오.',	
			})
			return;
		}
		
		event.preventDefault();
		Swal.fire({
			icon: 'success',
			position: 'center',
			title: 'A/S 신청 수정 완료',
			text: 'A/S 신청 수정이 완료되었습니다.',	
			}).then(function() {
				var elem = document.getElementById('submitASRequest');
				elem.submit();
			});
		
		
});
	
  	</script> 
	
	<script type="text/javascript">
		$(function(){
			CKEDITOR.replace('bContent',{extraPlugins : 'confighelper',
				height:'320px',
				filebrowserUploadUrl: '${pageContext.request.contextPath}/mypage/mine/imageUpload.do?${_csrf.parameterName}=${_csrf.token}'
			});
		});
	</script> 
   
  </body>
</html>