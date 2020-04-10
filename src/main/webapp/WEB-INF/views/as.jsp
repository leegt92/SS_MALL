<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>SS_MALL</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=624ac9c2319aa06a302fcc79733d72fb"></script>

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
						<a href="homeview" class="flex-c-m trans-04 p-lr-25">
							Home
						</a>
						
						<a href="mypage/myPage" class="flex-c-m trans-04 p-lr-25">
							My
						</a>
						
						<a href="cart/cartView" class="flex-c-m trans-04 p-lr-25">
							Cart
						</a>

						<a href="companyView" class="flex-c-m trans-04 p-lr-25">
							About Us
						</a>
					
					</div>
				</div>
			</div>

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="homeview" class="logo">
						<img src="images/icons/productlogo.png" alt="IMG-LOGO">
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
							</li>
							
							<li class="active-menu">
								<a href="asView">AS</a>
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
				<a href="homeview"><img src="images/icons/productlogo.png" alt="IMG-LOGO"></a>
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
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide modal-search">
					<img alt="CLOSE" src="images/icons/icon-close2.png"/>
				</button>
				<form class="wrap-search-header flex-w p-1-15">
					<button class="flex c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search" placeholder="Search...">
				</form>
			</div>

		</div>
	</header> 
	
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="homeview" class="stext-109 cl8 hov-cl1 trans-04">
				홈
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				AS
			</span>
		</div>
	</div>

	<!-- <!-- Title page 
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bglogo.PNG');">
		<h2 class="ltext-105 cl0 txt-center">
			SS_MALL
		</h2>
	</section>	 -->


	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">
						
						<!-- item blog -->
						<div class="p-b-63">
							<p class="hov-img0 how-pos5-parent"><!-- hov-img0 -->
								<img src="images/icons/productlogo.png" alt="IMG-BLOG">
							</p>
						</div>
						
						<div class="p-b-63">
							<h4 style="font-weight: bold; color:black;" >장인소개 </h4>
							<br><br>						
							<p>남성 명품 전문 쇼핑몰 상승몰(SSMALL)입니다. 상승몰(SSMALL)은 고객님이 완벽하게 AS를 받으실 수 있는 시스템을 구축하였습니다.</p>
							<p>뛰어난 실력을 가진 대한민국 명장님들과 협약이 되어 고객님이 빠르고 안전하게 AS를 받으실 수 있도록 최선을 다하겠습니다.</p>
	   						<br>							
	   						<p>SSMALL is a luxury mall for men. SSMALL has built a system that allows customers to receive AS completely.</p>
							<p>We will do our best to be able to receive AS quickly and safely with the agreement with the Korean masters who have excellent skills.</p>
							
						</div>

						<div class="p-b-63">
							<h4 style="font-weight: bold; color:black;">비트시계 </h4>
							<br><br>							
							<p>안녕하세요. 대한민국 시계 명장  김 비트 입니다.</p>
							<p>1972년부터 명품시계 수리 전문점을 운영하면서 수많은 명품시계의 문제점을 해결하여 기술력을 높였고</p>
							<p>이 기술력을 바탕으로 새로운 수리법을 개발하였습니다. 또한 명품시계 수리에 필요한 공구를 개발하고 또한 공로를 인정받아</p>
							<p> 국가로부터 1997년 기능인 최고의 명예인 명장 칭호를 시계부문 최초로 부여 받았습니다. 이후 교수로 재직하여 후진양성에 노력 하였습니다.</p>
							<p>많은 후진들이 ROLEX, CARTIER를 비롯한 유수의 스위스 시계업체에서 기술자로 재직 중에 있습니다.</p>
							<p>끝없는 기술 발전과 최고의 만족을 드리겠습니다.</p>
	   						<br>							
	   						<p>Hello. Korea's watch master Kim Bit.</p>
							<p>Since 1972, we have operated a luxury watch repair shop to solve the problems of many luxury watches and to improve our technical skills and develop new repair methods based on this technology.</p>
							<p>In addition, in 1997, the company was awarded the title of the highest honored master of the world for the watch category</p>
							<p>which was recognized for its contribution to the development of the watch repair industry by developing tools for repairing luxury watches.</p>
							<p>After that, he worked as a professor at xxx University and made efforts to foster future students.</p>
							<p>Many backwards are technicians at leading Swiss watchmakers including ROLEX and CARTIER.</p>
							<p>We will be happy with the endless technological development and the best satisfaction.</p>
							<br><br>
							<p style="font-weight: bold; color:black;">비트시계 서초점</p>
							<br>
							<p>서울시 서초구 강남대로459 백암빌딩 (구관건물)</p>
							<p>대표전화 : 02-4567-1111</p>
							<p>평일 : 오전 11시 ~ 오후 8시</p>
							<p>주말 : 오후 12시 ~ 오후 6시	</p>
							<br>
							<div id="map_seocho" style="width:100%;height:350px;"></div>		
							<br>
							<p style="font-weight: bold; color:black;">비트시계 강남점</p>
							<br>
							<p>서울시 강남구 테헤란로 5길 11 YOO빌딩 2층</p>
							<p>대표전화 : 02-5555-7777</p>
							<p>평일 : 오전 10시 ~ 오후 6시</p>
							<p>주말 : 오전 10시 ~ 오후 6시</p>
							<br>	
							<div id="map_gangnam" style="width:100%;height:350px;"></div>
														
						</div>
						
						<div class="p-b-63">
							<hr>
							<h4 style="font-weight: bold; color:black;">캠프시계 </h4>
							<br><br>							
							<p>안녕하세요. 대한민국 시계 명장  이 캠프 입니다.</p>
							<p>50년 전 도제로 시계수리업계에 입문하여 시계수리 1급 기능사을 취득하였으며 국내 최초 미국 공인고급시계사 자격을 취득하였습니다.</p>
	   						<p>기능검정 출제 및 기능경기 심사의원과 전국 기능경기 심사위원장을 역임하여 이론과 실기가 완벽하게 준비 되어있습니다.</p>
	   						<p>시계를 수리하고자 하신다면 시계수리 명장으로써 고객님의 시계를 성실히 수리하여 드릴 것을 약속드립니다.</p>
	   						<br>							
	   						<p>Hello. This is Korea's watch master Lee Camp.</p>
							<p>Fifty years ago, he entered the watch repair industry as an apprentice and acquired the first-class technician in watch repair.</p>
							<p>Skilled questions and functional competition judges and chairman of national skill competition judges are perfectly prepared for theory and practical skills.</p>
							<p>If you would like to have your watch repaired, we promise to repair your watch in good faith as a watchmaker.</p>
							<br><br>
							<p style="font-weight: bold; color:black;">캠프시계 신촌점</p>
							<br>
							<p>서울시 마포구 백범로 23 구프라자 3층</p>
							<p>대표전화 : 02-123-7892</p>
							<p>평일 : 오전 10시 30분 ~ 오후 6시</p>
							<p>주말 : 오전 10시 30분 ~ 오후 5시</p>
							<br>
							<div id="map_sinchon" style="width:100%;height:350px;"></div>							
						</div>
					
						<div class="p-b-63">
							<hr>
							<h4 style="font-weight: bold; color:black;">명품수선 </h4>
							<br><br>							
							<p>안녕하세요 명품수선 입니다.</p>
							<p>1978년 창업이래 명품수선이 명품수선 서비스를 시작한지도 40년의 시간이 흘렀습니다.</p>
							<p>그동안 성원해 주시고 사랑해주신 고객 여러분께 진심으로 감사드립니다.</p>
							<p>앞으로도 축적된 노하우와 장인의 손길로 한층 더 발전하는 명품수선이 되도록 최선의 노력을다하겠습니다.</p>
	   						<br>							
	   						<p>Hello luxury repair.</p>
	   						<p>Since its establishment in 1978, 40 years have passed since the launch of luxury repair service.</p>
							<p>We will do our best to be able to receive AS quickly and safely with the agreement with the Korean masters who have excellent skills.</p>
							<p>I sincerely thank you for all your support and love for our customers.</p>
							<p>We will do our best to be a masterpiece of luxury repair that develops further with the help of artisans.</p>
							<br> <br>
							<p style="font-weight: bold; color:black;">명품수선 종로점</p>
							<br>
							<p>서울시 종로구 종로 69 YMCA빌딩 7층</p>
							<p>대표전화 : 02-4567-8912</p>
							<p>평일 : 오전 10시 30분 ~ 오후 6시</p>
							<p>주말 : 오전 10시 30분 ~ 오후 5시</p>
							<div id="map_jonglo" style="width:100%;height:350px;"></div>
						</div>									
					</div>
				</div>
			</div>			
		</div>
	</section>
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
				  	<img src="images/icons/mainlogo.png" width="500">
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

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
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
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	
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
<script src="js/main.js"></script>
	 	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5630cc013f43366cb57b2e70f3f6e69c"></script>
	<script>
		var mapContainer = document.getElementById('map_gangnam'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.499668, 127.029247), // 지도의 중심좌표

			level : 3
		// 지도의 확대 레벨

		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 

		var markerPosition = new kakao.maps.LatLng(37.499668, 127.029247);

		// 마커를 생성합니다

		var marker = new kakao.maps.Marker({

			position : markerPosition

		});

		// 마커가 지도 위에 표시되도록 설정합니다

		marker.setMap(map);

		var iwContent = '<div style="padding:5px;">비트시계 강남점 <br><a href="https://map.kakao.com/link/map/비트시계 강남점,37.499668, 127.029247" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/비트시계 강남점,37.499668, 127.029247" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

		iwPosition = new kakao.maps.LatLng(37.499668, 127.029247); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다

		var infowindow = new kakao.maps.InfoWindow({

			position : iwPosition,

			content : iwContent

		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다

		infowindow.open(map, marker);

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다

		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다

		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다

		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다

		var zoomControl = new kakao.maps.ZoomControl();

		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	</script>

	<script>
		var mapContainer = document.getElementById('map_sinchon'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.552475, 126.937825), // 지도의 중심좌표

			level : 3
		// 지도의 확대 레벨

		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 

		var markerPosition = new kakao.maps.LatLng(37.552475, 126.937825);

		// 마커를 생성합니다

		var marker = new kakao.maps.Marker({

			position : markerPosition

		});

		// 마커가 지도 위에 표시되도록 설정합니다

		marker.setMap(map);

		var iwContent = '<div style="padding:5px;">캠프시계 신촌점 <br><a href="https://map.kakao.com/link/map/캠프시계 신촌점,37.552475,126.937825" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/캠프시계 신촌점,37.552475,126.937825" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

		iwPosition = new kakao.maps.LatLng(37.552475, 126.937825); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다

		var infowindow = new kakao.maps.InfoWindow({

			position : iwPosition,

			content : iwContent

		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다

		infowindow.open(map, marker);

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다

		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다

		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다

		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다

		var zoomControl = new kakao.maps.ZoomControl();

		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	</script>

	<script>
		var mapContainer = document.getElementById('map_jonglo'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.570803, 126.985252), // 지도의 중심좌표

			level : 3
		// 지도의 확대 레벨

		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 

		var markerPosition = new kakao.maps.LatLng(37.570803, 126.985252);

		// 마커를 생성합니다

		var marker = new kakao.maps.Marker({

			position : markerPosition

		});

		// 마커가 지도 위에 표시되도록 설정합니다

		marker.setMap(map);

		var iwContent = '<div style="padding:5px;">명품수선 <br><a href="https://map.kakao.com/link/map/명품수선,37.570803, 126.985252" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/명품수선,37.570803, 126.985252" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

		iwPosition = new kakao.maps.LatLng(37.570803, 126.985252); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다

		var infowindow = new kakao.maps.InfoWindow({

			position : iwPosition,

			content : iwContent

		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다

		infowindow.open(map, marker);

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다

		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다

		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다

		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다

		var zoomControl = new kakao.maps.ZoomControl();

		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	</script>
	
	<script>
		var mapContainer = document.getElementById('map_seocho'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.502786, 127.024457), // 지도의 중심좌표

			level : 3
		// 지도의 확대 레벨

		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 

		var markerPosition = new kakao.maps.LatLng(37.502786, 127.024457);

		// 마커를 생성합니다

		var marker = new kakao.maps.Marker({

			position : markerPosition

		});

		// 마커가 지도 위에 표시되도록 설정합니다

		marker.setMap(map);

		var iwContent = '<div style="padding:5px;">비트시계 서초점 <br><a href="https://map.kakao.com/link/map/비트시계 서초점,37.502786, 127.024457" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/캠프시계 신촌점,37.502786, 127.024457" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

		iwPosition = new kakao.maps.LatLng(37.502786, 127.024457); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다

		var infowindow = new kakao.maps.InfoWindow({

			position : iwPosition,

			content : iwContent

		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다

		infowindow.open(map, marker);

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다

		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다

		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다

		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다

		var zoomControl = new kakao.maps.ZoomControl();

		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	</script>
	
	
	<script>
		$('#map').click(function(){

			 var options = {
				center: new kakao.maps.LatLng(37.552475, 126.937825),
				level: 3
			}; 
			 window.open("https://map.kakao.com/link/to/상승몰,37.552475, 126.937825");

		});
	</script> 

	<span class="bt-basic" id="map"></span>  
<!--===============================================================================================-->
</body>
</html>