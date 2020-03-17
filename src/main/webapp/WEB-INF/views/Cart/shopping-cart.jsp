<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>상승몰</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/ssmall/images/icons/favicon.png"/>
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
	<link rel="stylesheet" type="text/css" href="/ssmall/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/ssmall/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/ssmall/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/ssmall/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/ssmall/css/util.css">
	<link rel="stylesheet" type="text/css" href="/ssmall/css/main.css">
<!--===============================================================================================-->

</head>
<body class="animsition">
	
	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">						
						SSMALL with luxury watches and wallets
					</div>

					<div class="right-top-bar flex-w h-full">
						<a href="/ssmall/homeview" class="flex-c-m trans-04 p-lr-25">
							Home
						</a>
						
						<a href="/ssmall/myPage" class="flex-c-m trans-04 p-lr-25">
							My
						</a>
						
						<a href="/ssmall/boardnoticeView" class="flex-c-m trans-04 p-lr-25">
							notice
						</a>

						<a href="/ssmall/companyView" class="flex-c-m trans-04 p-lr-25">
							About Us
						</a>
					
					</div>
				</div>
			</div>

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="/ssmall/homeview" class="logo">
						<img src="/ssmall/images/icons/productlogo.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">						
							<li>
								<a href="/ssmall/homeview">홈</a>
							</li>

							<li>
								<a href="/ssmall/productView">상품</a>
							</li>
													
							<li>
								<a href="/ssmall/boardnoticeView">공지사항</a>
							</li>
							
							<li>
								<a href="/ssmall/companyView">회사소개</a>
							</li>
							
							<li>
								<a href="/ssmall/asView">AS</a>
							</li>						
						</ul>
					</div>	

					
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="/ssmall/homeview"><img src="/ssmall/images/icons/productlogo.png" alt="IMG-LOGO"></a>
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
				<li>
					<a href="homeview">홈</a>
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>
				<li>
					<a href="/ssmall/productView">상품</a>
				</li>

				<li>
					<a href="/ssmall/boardnoticeView">공지사항</a>
				</li>

				<li>
					<a href="/ssmall/companyView">회사소개</a>
				</li>
				
				<li>
					<a href="/ssmall/asView">AS</a>
				</li>
			</ul>
		</div>
		
	</header>



	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="/ssmall/homeview" class="stext-109 cl8 hov-cl1 trans-04">
				홈
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="/ssmall/cart/cartView" class="stext-109 cl4">
				장바구니
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

	
		</div>
	</div>


	<div class="bor10 m-t-50 p-t-43 p-b-40">
		<!-- Tab01 -->
		<div class="tab01">
			<!-- Tab panes -->
			<div class="tab-content p-t-43">
				<!-- - -->
				<div class="tab-pane fade show active" id="description"
					role="tabpanel">
					<div class="how-pos2 p-lr-15-md">
					<h4>장바구니</h4>
					<br>
						<c:choose>							
				
							<c:when test="${cartList[0] == NULL}">
								<table class="table table-list-search">																					
								
									<h3>장바구니에 담긴 상품이 없습니다.</h3>
								
								</table>
									
							</c:when>
							<c:otherwise>
							<form:form role="form" action="/ssmall/cart/cartBuy" method="post" >
							
							<table class="table table-list-search">	
								<tr>
									<th></th>
									<th>상품명</th>
									<th>구매수량</th>
									<th>구매가격</th>
									<th></th>
									<th></th>
								</tr>
								<c:set var="totalprice" value="0"></c:set>
									
								<c:forEach items="${cartList}" var="cart">
								<tr>
									<td>
										<a href="/ssmall/productDetail?p_number=${cart.p_number}">
										<img src="/ssmall/productimage/${cart.i_name}" alt="IMG" width="100px" height="100px" >
										</a>
									</td>								
									<td>${cart.p_description}</td>						
									<td>${cart.c_amount}</td>
									<td><fmt:formatNumber value="${cart.c_grandtotal}" pattern="###,###,###" />원</td>									
									<c:set var="totalprice" value="${totalprice + cart.c_grandtotal}"></c:set>
									<td><a href="/ssmall/cart/cartDelete?c_id=${cart.c_id}">삭제</a></td>
									<td><input type="checkbox" name="check" value="${cart.c_id}"></td>
								</tr>
								</c:forEach>						
								<tr>
									<td colspan="6" align="right">
									<h4>Total <fmt:formatNumber value="${totalprice}" pattern="###,###,###" />원</h4></td>					
								</tr>								
								<tr>										
									<td colspan="6" align="right">								
									<button type="submit" class="btn icon-btn btn-success">구매하기</button></td>
								</tr>
								</table>
							</form:form>
							</c:otherwise>
						</c:choose>	
					</div>
				</div>
			</div>
			<hr>
			</div>
		</div>


	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-500 cl0 p-b-30">
						Category
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="productView" class="stext-130 cl7 hov-cl1 trans-04">
								Watch
							</a>
						</li>

						<li class="p-b-10">
							<a href="productView" class="stext-130 cl7 hov-cl1 trans-04">
								Wallet
							</a>
						</li>

					
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-500 cl0 p-b-30">
						Help
					</h4>

					
						<!-- <li class="p-b-10">
							 <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Track Order
							</a> 
						</li> -->


						<p class="stext-130 cl7 size-201">
							● 대표 전화번호: 02-1234-5678
						</p>
						<p class="stext-130 cl7 size-201">
							● 고객센터 : 1234-5678
						</p>
						<p class="stext-130 cl7 size-201">
							● 이메일문의 : abcdefg@abcdefg.com
						</p>
						<p class="stext-130 cl7 size-201">
							● FAQ
						</p>
					
					
				</div> 

				<div class="col-sm-3 col-lg-50 p-b-40" >
					<h4 class="stext-500 cl0 p-b-30">
						Directions
				 </h4>
				 	<button id="map" type="button"class="btn btn-link stext-130 cl7 hov-cl1 trans-04">오시는 길</button> 
								
				
				  <!--  <ul>
					<li class="p-b-10">
							 <a href="mapview" class="stext-107 cl7 hov-cl1 trans-04">
								오시는길
						     </a> 
				     </li>
				   </ul>  -->

					 <!-- <p class="stext-130 cl7 size-201">
						서울시 서대문구 비트동 비트빌딩 201동 201호
					</p>  -->
					
					
					<div class="p-t-27">
						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-instagram"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-pinterest-p"></i>
						</a>
					</div>
				</div>
				
				  <div class="col-sm-6 col-lg-3 p-b-50">
				  	<img src="/ssmall/images/icons/mainlogo.png" width="500">
					<!-- <h4 class="stext-301 cl0 p-b-30">
						Newsletter
					</h4>

					<form>
						<div class="wrap-input1 w-full p-b-4">
							<input class="input1 bg-none plh1 stext-107 cl7" type="text" name="email" placeholder="email@example.com">
							<div class="focus-input1 trans-04"></div>
						</div>

						<div class="p-t-18">
							<button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
								Subscribe
							</button>
						</div>
					</form> -->
				</div>  
			</div>

			<div class="p-t-40">
				<div class="flex-c-m flex-w p-b-18">
					<a href="#" class="m-all-1">
						<img src="/ssmall/images/icons/icon-pay-01.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="/ssmall/images/icons/icon-pay-02.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="/ssmall/images/icons/icon-pay-03.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="/ssmall/images/icons/icon-pay-04.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="/ssmall/images/icons/icon-pay-05.png" alt="ICON-PAY">
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
	
	<c:choose>
		<c:when test="${checkNull eq 'checkNull'}"> 
			<script>
				alert("선택한 상품이 없습니다.");
			</script>
			<% session.removeAttribute("checkNull"); %>
		</c:when>
	</c:choose>
	
<!--===============================================================================================-->	
	<script src="/ssmall/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/ssmall/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/ssmall/vendor/bootstrap/js/popper.js"></script>
	<script src="/ssmall/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->	
	<script src="/ssmall/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/ssmall/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/ssmall/vendor/bootstrap/js/popper.js"></script>
	<script src="/ssmall/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/ssmall/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="/ssmall/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	
	<script src="/ssmall/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
<script src="/ssmall/js/main.js"></script>
	
	 	
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
<!--===============================================================================================-->
</body>
</html>