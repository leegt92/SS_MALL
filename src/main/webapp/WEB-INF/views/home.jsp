<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
 
    String name = "";
    if(principal != null) {
        name = auth.getName();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>상승몰</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"/>
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
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<script type="text/javascript">

	function numberFormat(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
	$(function(){
		
		$.ajax({
			url : 'miniCart',
			dataType : 'json',
			success : function(data){
				console.log(data);
				var totalprice = 0;			
				var itemcount = 0;
				
				$.each(data, function(key, value){
					totalprice = totalprice + value.c_grandtotal;
					itemcount += 1;
					var tag = "";
					tag = tag + "<ul class='header-cart-wrapitem w-full'>";
					tag = tag + "<li class='header-cart-item flex-w flex-t m-b-12'>";
					tag = tag + "<div class='header-cart-item-img'>";
					tag = tag + "<img src='/ssmall/productimage/" + value.i_name +"' alt='IMG'>";
					tag = tag + "</div>";
					tag = tag + "<div class='header-cart-item-txt p-t-8'>";
					tag = tag + "<a href='/ssmall/productDetail?p_number=" + value.p_number + "' class='header-cart-item-name m-b-18 hov-cl1 trans-04'>";
					tag = tag + value.p_description + " x " + value.c_amount;
					tag = tag + "</a>";
					tag = tag + "<span class='header-cart-item-info'>";
					tag = tag + numberFormat(value.c_grandtotal)+"원";
					tag = tag + "</span></div></li>";
					
					
				
					$("#miniCart").append(tag);
					
				})
				
				var tag2 = "";
				tag2 = tag2 + "<div class='header-cart-total w-full p-tb-40'>"
				tag2 = tag2 + "Total: "+numberFormat(totalprice) + "원";
				tag2 = tag2 + "</div>"
				tag2 = tag2 + "<div class='header-cart-buttons flex-w w-full'>";
				tag2 = tag2 + "<a href='/ssmall/cart/cartView' class='flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10'>";
				tag2 = tag2 + "View Cart </a></div>";
				
				$("#total").append(tag2);
				
				$(document).ready(function () {

					$('#count').attr('data-notify', itemcount);

			    });
			
				
			},
			error : function(request, status, error) {           
             	console.log("로그인x");
            
             	var itemcount = 0;
             	$(document).ready(function () {

					$('#count').attr('data-notify', itemcount);

			 	});
        	 }	    		 	   
		})
	})
</script>

<c:choose>
	<c:when test="${error eq 'error'}">
		<script>
			alert('${msg}');
		</script>
		<% 
			session.removeAttribute("error");
			session.removeAttribute("msg");
		%>
	</c:when>
	
	<c:when test="${success eq 'success'}">
		<script>
			alert('결제가 완료되었습니다.');
		</script>
		<% session.removeAttribute("success"); %>
	</c:when>
	
	<c:when test="${cancel eq 'cancel'}">
		<script>
			alert('결제가 취소되었습니다.');
		</script>
		<% session.removeAttribute("cancel"); %>
	</c:when>
	
	<c:when test="${fail eq 'fail'}" >
		<script>
			alert('결제를 실패하였습니다..');
		</script>
		<% session.removeAttribute("fail"); %>
	</c:when>

</c:choose>
</head>
<body class="animsition">
	<!-- Header -->
	<header class="header-v3">
		<!-- Header desktop -->
		<div class="container-menu-desktop trans-03">
			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop p-l-45">
					
					<!-- Logo desktop -->		
					<a href="homeview" class="logo">
						<img src="images/icons/mainlogo.png" alt="IMG-LOGO"  >
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li>
								<a href="homeview">홈</a>
							</li>
							<li>
								<a href="productView">상품</a>
							</li>
							
							<li>
								<a href="boardnoticeView">공지사항</a>
							</li>
							
							<li>
								<a href="companyView">회사소개</a>						
							
							<li>
								<a href="asView">AS</a>
							</li>
							
							<li>
								<a href="#" onclick="chat();">채팅</a>
							</li>
							
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m h-full">							
						<div class="flex-c-m h-full p-r-25 bor6">
							<div id="count" class="icon-header-item cl0 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart" >

								<i class="zmdi zmdi-shopping-cart"></i>
							</div>
						</div>
							
						<div class="flex-c-m h-full p-lr-19">
							<div class="icon-header-item cl0 hov-cl1 trans-04 p-lr-11 js-show-sidebar">
								<i class="zmdi zmdi-menu"></i>
							</div>
						</div>
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="homeview"><img src="images/icons/productlogo.png" alt="IMG-LOGO" ></a>
			</div>

			

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="main-menu-m">
				<sec:authorize access="isAnonymous()">
					<li>
						<a href="login">로그인</a>
					</li>	
				</sec:authorize>
				<sec:authorize access="hasRole('ADMIN')">
					<li>
						<p><%=name%>님</p>
					</li>
						
					<li>
						<a href="#" class="stext-102 cl2 hov-cl1 trans-04" onclick="document.getElementById('logout').submit();">
							로그아웃</a>
						<form id="logout" action="logout" method="POST">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />			
						</form>
					</li>
			
					<li>
						<a href="/ssmall/admin/adminpage">관리자페이지 </a>
					</li>
				</sec:authorize>
					
				<sec:authorize access="hasRole('USER')">
					<li>
						<p><%=name%>님</p>
					</li>
					<li>
						<a href="#"  onclick="document.getElementById('logout').submit();">
						로그아웃</a>
						<form id="logout" action="logout" method="POST">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />			
						</form>
					</li>
						
					<li>
						<a href="/ssmall/mypage/myPage_orderedList">마이페이지</a>
					</li>
						
					<li>
						<a href="/ssmall/cart/cartView">장바구니 </a>
					</li>
					</sec:authorize>
				
				<li>
					<a href="homeview">홈</a>					
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>

				<li>
					<a href="productView">상품</a>
				</li>
				
				<li>
					<a href="boardnoticeView">공지사항</a>
				</li>
				
				<li>
					<a href="companyView">회사소개</a>
				</li>
				
				<li>
					<a href="asView">AS</a>
				</li>

			</ul>
		</div>

		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<button class="flex-c-m btn-hide-modal-search trans-04">
				<i class="zmdi zmdi-close"></i>
			</button>

			<form class="container-search-header">
				<div class="wrap-search-header">
					<input class="plh0" type="text" name="search" placeholder="Search...">

					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
				</div>
			</form>
		</div>
	</header>


	<!-- Sidebar -->
	<aside class="wrap-sidebar js-sidebar">
		<div class="s-full js-hide-sidebar"></div>

		<div class="sidebar flex-col-l p-t-22 p-b-25">
			<div class="flex-r w-full p-b-30 p-r-27">
				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-sidebar">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="sidebar-content flex-w w-full p-lr-65 js-pscroll">
				<div class="sidebar-gallery w-full p-tb-30">
				<ul class="sidebar-link w-full">
					
					<sec:authorize access="isAnonymous()">
						<li class="p-b-13">
							<a href="login" class="stext-102 cl2 hov-cl1 trans-04">
								<p style="font-weight: bold; font-size: 1.5em;">로그인</p>
							</a>
						</li>	
					</sec:authorize>
					
					<sec:authorize access="hasRole('ADMIN')">
						<li class="p-b-13">
							<p class="text-success" style="font-weight:bold; font-size: 1.5em;"><%=name%>님</p>
						</li>
						
						<li class="p-b-13">
							<a href="#" class="stext-102 cl2 hov-cl1 trans-04" onclick="document.getElementById('logout').submit();">
							<p style="font-weight: bold; font-size: 1.5em;">로그아웃</p></a>
							<form id="logout" action="logout" method="POST">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />			
							</form>
						</li>
			
						<li class="p-b-13">
							<a href="/ssmall/admin/adminpage" class="stext-102 cl2 hov-cl1 trans-04">
								<p style="font-weight: bold; font-size: 1.5em;">관리자페이지 </p>
							</a>
						</li>
					</sec:authorize>
					
					<sec:authorize access="hasRole('USER')">
						<li class="p-b-13">
							<p class="text-success" style="font-weight:bold; font-size: 1.5em;"><%=name%>님</p>
						</li>
						<li class="p-b-13">
							<a href="#" class="stext-102 cl2 hov-cl1 trans-04" onclick="document.getElementById('logout').submit();">
							<p style="font-weight: bold; font-size: 1.5em;">로그아웃</p></a>
							<form id="logout" action="logout" method="POST">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />			
							</form>
						</li>
						
						<li class="p-b-13">
						<a href="/ssmall/mypage/myPage_orderedList" class="stext-102 cl2 hov-cl1 trans-04">
							<p style="font-weight: bold; font-size: 1.5em;">마이페이지 </p>
						</a>
						</li>
						
						<li class="p-b-13">
						<a href="/ssmall/cart/cartView" class="stext-102 cl2 hov-cl1 trans-04">
							<p style="font-weight: bold; font-size: 1.5em;">장바구니 </p>
						</a>
						</li>
						
					
					</sec:authorize>

					<li class="p-b-13">
						<a href="productView" class="stext-102 cl2 hov-cl1 trans-04">
							<p style="font-weight: bold; font-size: 1.5em;">상품 </p>
						</a>
					</li>

					<li class="p-b-13">
						<a href="boardnoticeView" class="stext-102 cl2 hov-cl1 trans-04"> 
							<p style="font-weight: bold; font-size: 1.5em;">공지사항</p>
						</a>
					</li>

					<li class="p-b-13">
						<a href="companyView" class="stext-102 cl2 hov-cl1 trans-04">
							<p style="font-weight: bold; font-size: 1.5em;">회사소개</p>
						</a>
					</li>
					
					<li class="p-b-13">
						<a href="asView" class="stext-102 cl2 hov-cl1 trans-04">
							<p style="font-weight: bold; font-size: 1.5em;">AS</p>
						</a>
					</li>
					
				</ul>
				</div>

				<div class="sidebar-gallery w-full p-tb-30">
					<span class="mtext-101 cl5"> SS_MALL </span>

					<div class="flex-w flex-sb p-t-36 gallery-lb">

						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="images/model1.PNG"
								data-lightbox="model"
								style="background-image: url('images/model1.PNG');"></a>
						</div>


						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="images/model2.PNG"
								data-lightbox="model"
								style="background-image: url('images/model2.PNG');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="images/model3.PNG"
								data-lightbox="model"
								style="background-image: url('images/model3.PNG');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="images/model4.PNG"
								data-lightbox="model"
								style="background-image: url('images/model4.PNG');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="images/model5.PNG"
								data-lightbox="model"
								style="background-image: url('images/model5.PNG');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="images/model6.PNG"
								data-lightbox="model"
								style="background-image: url('images/model6.PNG');"></a>
						</div>


						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="images/model7.PNG"
								data-lightbox="model"
								style="background-image: url('images/model7.PNG');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="images/model8.PNG"
								data-lightbox="model"
								style="background-image: url('images/model8.PNG');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="images/model9.PNG"
								data-lightbox="model"
								style="background-image: url('images/model9.PNG');"></a>
						</div>



						<!-- <!-- item gallery sidebar
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="images/gallery-09.jpg" data-lightbox="gallery" 
							style="background-image: url('images/gallery-09.jpg');"></a>
						</div> -->
					</div>
				</div>

				<div class="sidebar-gallery w-full">
					<span class="mtext-101 cl5"> 인사말 </span>

					<p class="stext-108 cl6 p-t-27">안녕하세요. 남자 명품 시계,지갑을 판매하는
						상승몰입니다. 저희 쇼핑몰은 여러가지 명품을 취급하여 고객님들께서 많은 종류의 명품과 제품을 볼 수 있도록 하였습니다.
						다른 쇼핑몰보다 체계화된 AS도 받을 수 있으니 즐거운 쇼핑 되시길 바랍니다.</p>
				</div>	
			</div>
		</div>
	</aside>


	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			
			<div class="header-cart-content flex-w js-pscroll">
				<ul id="miniCart" class='header-cart-wrapitem w-full'>
				
				</ul>
				<div id="total" class="w-full">
					
				</div>
				
			</div>
		</div>
	</div>



	<!-- Slider -->
	<section  class="section-slide ">
		<div class="wrap-slick1 rs2-slick1" >
			<div class="slick1">
				<div class="item-slick1 bg-overlay1" style="background-image: url(images/main01.PNG);"  data-thumb="images/main01.PNG" data-caption="Watch">
					<div class="container h-full">
						<div class="flex-col-c-m h-full p-t-100 p-b-60 respon5">
							
							<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
								<span class="ltext-202 txt-center cl0 respon2 " >
									Watch
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
								<h2 class="ltext-104 txt-center cl0 p-t-22 p-b-40 respon1">
									Best Watch
								</h2>
							</div>

								<!-- <button id="watch" type="button"class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn2 p-lr-15 trans-04">Shop Now</button> -->
						
							<div  class="layer-slick1 animated visible-false " data-appear="zoomIn" data-delay="1600"  data-filter=".시계">
								<a id="watch2" href="productViewWatch" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn2 p-lr-15 trans-04" >
									Shop Now
								</a><!-- href="productView" id=abc&pw=1234 -->
							</div>
						</div>
					</div>
				</div>
				 <div class="item-slick1 bg-overlay1" style="background-image: url(images/main02.PNG);" data-thumb="images/main02.PNG" data-caption="Wallet">
					<div class="container h-full">
						<div class="flex-col-c-m h-full p-t-100 p-b-60 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="rollIn" data-delay="0">
								<span class="ltext-202 txt-center cl0 respon2">
									Wallet
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="lightSpeedIn" data-delay="800">
								<h2 class="ltext-104 txt-center cl0 p-t-22 p-b-40 respon1">
									Best Wallet
								</h2>
							</div>
						
							<div id="wallet2" class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1600">
								<a href="productViewWallet" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn2 p-lr-15 trans-04" >
									Shop Now
								</a>
							</div>
						</div>
					</div>
				</div>	
			</div>
			 <div class="wrap-slick1-dots p-lr-10"></div> 
		</div>
	</section>


	<!-- Banner -->
	<div class="sec-banner bg0 p-t-95 p-b-55">
		<div class="container">
			<div class="row">
				<div class="col-md-6 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="images/banner1.PNG" alt="IMG-BANNER">

						<a href="productViewWatch" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3" data-filter=".시계">
						<div class="block1-txt-child1 flex-col-l">
							<span class="block1-name ltext-102 trans-04 p-b-8">
								Watch
							</span>								
						</div>						
							
				
						<div class="block1-txt-child2 p-b-4 trans-05">
							<div class="block1-link stext-101 cl0 trans-09">
									Shop Now
							</div>
						</div>
						
					</a>
				</div>
			</div>

				<div class="col-md-6 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="images/banner2.PNG" alt="IMG-BANNER">

						<a href="productViewWallet" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3" data-filter=".지갑">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									Wallet
								</span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05" >
								<div class="block1-link stext-101 cl0 trans-09">
									Shop Now
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>	
		</div>
	</div>


	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-2 p-b-50">
					<h4 class="stext-500 cl0 p-b-30">
						Category
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="productViewWatch" class="stext-130 cl7 hov-cl1 trans-04">
								Watch
							</a>
						</li>

						<li class="p-b-10">
							<a href="productViewWallet" class="stext-130 cl7 hov-cl1 trans-04">
								Wallet
							</a>
						</li>

					
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-500 cl0 p-b-30">
						Help
					</h4>


						<p class="stext-130 cl7 size-201">
							● 대표 전화번호: 02-1234-5678
						</p>
						<p class="stext-130 cl7 size-201">
							● 고객센터 : 1234-5678
						</p>
						<p class="stext-130 cl7 size-201">● 이메일문의 :<a href="mailto:abcdefg@abcdefg.com" title="이메일 문의"class="stext-130 cl7 size-201">
						 	abcdefg@abcdefg.com
						</a></p>
						<p class="stext-130 cl7 size-201">
							● FAQ
						</p>
					
					
				</div> 

				<div class="col-sm-2 col-lg-50 p-b-40" >
					<h4 class="stext-500 cl0 p-b-30">
						Directions
				 </h4>
				 	<button id="map1" type="button"class="btn btn-link stext-130 cl7 hov-cl1 trans-04">오시는 길</button> 
						
					
			</div>
				
				<div class="col-sm-2 col-lg-40 p-b-40" >
					<h4 class="stext-500 cl0 p-b-30">
						SNS Page
				 	</h4>
				 		
					<div class="p-t-10">			
						<div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-width="" data-layout="standard" data-action="like" data-size="small" data-share="true">			
									<a href="https://www.facebook.com/ssmall1111111" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
										<i class="fa fa-facebook"></i>
									</a>
					
						
							<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
								<i class="fa fa-instagram"></i>
							</a>
					
					
							<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
								<i class="fa fa-twitter"></i>
							</a>
						</div>
					</div>
				</div>
				
				  <div class="col-sm-6 col-lg-3 p-b-50">
				  	<img src="images/icons/mainlogo.png" width="500">
				</div>  
			</div>
			

			<div class="p-t-40">
				<div class="flex-c-m flex-w p-b-18">
					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-01.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-02.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-03.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-04.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-05.png" alt="ICON-PAY">
					</a>
				</div>

				<p class="stext-107 cl6 txt-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

				</p>
			</div>
		</div>
	</footer>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
<!-- 
	<!--  Modal1  -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-dots"></div>
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

								<div class="slick3 gallery-lb">
									<div class="item-slick3" data-thumb="images/product-detail-01.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-01.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-01.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3" data-thumb="images/product-detail-02.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-02.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-02.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3" data-thumb="images/product-detail-03.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-03.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-03.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">
								Lightweight Jacket
							</h4>

							<span class="mtext-106 cl2">
								$58.79
							</span>

							<p class="stext-102 cl3 p-t-23">
								Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.
							</p>
							
							
							<div class="p-t-33">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">
										Size
									</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Size S</option>
												<option>Size M</option>
												<option>Size L</option>
												<option>Size XL</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">
										Color
									</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Red</option>
												<option>Blue</option>
												<option>White</option>
												<option>Grey</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-204 flex-w flex-m respon6-next">
										<div class="wrap-num-product flex-w m-r-20 m-tb-10">
											<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1">

											<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>

										<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
											Add to cart
										</button>
									</div>
								</div>	
							</div>

							
							<div class="flex-w flex-m p-l-100 p-t-40 respon7">
								<div class="flex-m bor9 p-r-10 m-r-11">
									<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
										<i class="zmdi zmdi-favorite"></i>
									</a>
								</div>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
									<i class="fa fa-facebook"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
									<i class="fa fa-twitter"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
									<i class="fa fa-google-plus"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	 </div>  
	
	<div id="popup" class="container main_pop">
		<div class="row">

			<div class="col-sm-8">
				<div class="chatbody">
					<div class="panel panel-primary">
						<div class="panel-heading top-bar">
							<div class="col-md-8 col-xs-8">
								<h3 class="panel-title">
									<span class="glyphicon glyphicon-comment"></span> 상승몰 채팅방
								</h3>
							</div>
						</div>
						<div id = data class="panel-body msg_container_base">						
							
						</div>
						
						<div class="panel-footer">
							<div class="input-group">
								<input id="msg" type="text" class="form-control input-sm chat_input" placeholder="Write your message here..." /> 
								<span class="input-group-btn">
									<button class="btn btn-primary btn-sm" id="btnSend">
										<i class="fa fa-send fa-1x" aria-hidden="true"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="close" style="width:50px; margin:auto;">
				<button type="button">닫기</button> 
			</div>
		</div>
	</div>
	
	
	
	
	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	</script>
<!--===============================================================================================-->
  
		
<!--===============================================================================================-->
 <script src="js/main.js"></script>
	 	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5630cc013f43366cb57b2e70f3f6e69c"></script>
	<script>
		$('#map').click(function(){
			var container = document.getElementById('map');
			 var options = {
				center: new kakao.maps.LatLng(37.552475, 126.937825),
				level: 3
			}; 
			 window.open("https://map.kakao.com/link/to/비트캠프 신촌센터,37.552475, 126.937825");

		});
	</script> 
	<span class="bt-basic" id="map"></span>  
<!--===============================================================================================  -->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->

	<script>
		function chat(){
			window.open("/ssmall/chat", "PopupWin", "width=500,height=600", "location=no, directories=no, resizable=no, status=no, toolbar=no, menubar=no");
		}
		
   </script>


	
</body>
 
</html>