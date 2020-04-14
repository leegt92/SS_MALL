<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 가지치기 하기위해 백업 + 글목록불러오기를 ajax로 하기로 했다.-->
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Product</title>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script><!-- alert버튼대체제 -->
<!--===============================================================================================-->

<!-- 일단 멈춤 구매부분부터 -->
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->


<!-- <style type="text/css">

	/* .pagination>li>a, .pagination>li>span { 
		border-radius: 50% !important;
		margin: 0 5px;
		background-color:gray;
		color:white;
		}
	 .pagination>li>a, .pagination>li>span:hover {
	    border-radius: 50% !important;
		margin: 0 5px;
		background-color:white;
		color:gray;
		} */

 	#custom-search-input{
	    padding: 3px;
	    border: solid 1px #E4E4E4;
	    border-radius: 6px;
	    background-color: #fff;
	}
	
	#custom-search-input input{
	    border: 0;
	    box-shadow: none;
	}
	 
	/* #SearchButtonImage{
	    background-color: gray;
	    border-color: gray;

	} */
 	/* .page-item{
		background-color: gray;
		color:gray;
	} */
	
 	/* #SearchButtonImage{
	    margin: 2px 0 0 0;
	    background-color: gray;
	    box-shadow: none;
	    border: 0;
	    color: #555555;
	    padding: 0 8px 0 10px;
	    border-left: solid 1px #ccc;
	} */
 	
	#custom-search-input button:hover{
	    border: 0;
	    box-shadow: none;
	    border-left: solid 1px #ccc;
	}
	
	#custom-search-input .glyphicon-search{
	    font-size: 23px;
<<<<<<< HEAD
	}
</style> -->

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
						
						<a href="/ssmall/mypage/myPage_orderedList" class="flex-c-m trans-04 p-lr-25">
							My
						</a>
						
						<a href="/ssmall/cart/cartView" class="flex-c-m trans-04 p-lr-25">

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
								<a href="noticeView">공지사항</a>
							</li>
							<li>
								<a href="companyView">회사소개</a>
							</li>
							<li>
								<a href="asView">AS</a>
							</li>	
						</ul>
					</div>	

					<!-- Icon header -->
					<!-- <div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>

						<a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
							<i class="zmdi zmdi-favorite-outline"></i>
						</a>
					</div> -->
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="index.html"><img src="images/icons/productlogo.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>

				<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
					<i class="zmdi zmdi-favorite-outline"></i>
				</a>
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
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">


						SSMALL with luxury watches and wallets
					 Free shipping for standard order over $100


					</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="homeview" class="flex-c-m p-lr-10 trans-04">
							Home
						</a>

						<a href="mypage/myPage_orderedList" class="flex-c-m p-lr-10 trans-04">
							My
						</a>

						<a href="cart/cartView" class="flex-c-m p-lr-10 trans-04">
							cart
						</a>
						
						<a href="companyView" class="flex-c-m p-lr-10 trans-04">
							About Us
						</a>
					
					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li>
					<a href="homeview">홈</a>
					<!-- <ul class="sub-menu-m">
						<li><a href="index.html">Homepage 1</a></li>
						<li><a href="home-02.html">Homepage 2</a></li>
						<li><a href="home-03.html">Homepage 3</a></li>
					</ul> -->
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
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
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

			<a href="productView" class="stext-109 cl8 hov-cl1 trans-04">
				상품
			</a>
		</div>
	</div>

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

	
	<!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
				
					<a href="productView" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">
						All Product
					</a>
					
					<a href="productViewSearchCategory?p_category=시계" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">
						Watch
					</a>

					<a href="productViewSearchCategory?p_category=지갑" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">
						Wallet
					</a>
				
					<a href="productViewSearch${pageMaker.makeQuery(idx)}&keyword=${keyword}">${idx}</a>
		 		
					<!-- <button id="watch1" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 " data-filter=".시계">
						Watch1
					</button>
					<button id="wallet1" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 " data-filter=".지갑">
						wallet
					</button> -->
				
				
				</div>

				<div class="flex-w flex-c-m m-tb-10">
					<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						 Filter
					</div>

					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>				
				<!-- Search product -->
					<!-- <div class="container">
						<div class="row">
					        <div class="col-md-6">
					    		<h2>Custom search field</h2>
					            <div id="custom-search-input">
					            <form action="productViewSearch" method="get">
					                <div class="input-group col-md-12">
					                   	 <input type="text" id="keyword" name="keyword" class="form-control input-lg" placeholder="Search" />
					                   	 	<span class="input-group-btn">
					                        	<button class="btn btn-info btn-lg" type="submit">
					                           	 	<i class="glyphicon glyphicon-search"></i>
					                        	</button>
					                    	</span>
					                	</div>
					                </form>
					            </div>
					        </div>
						</div>
					</div> -->
				<!-- 원본-------------------------------------------------------------------------->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<!-- <div class="bor8 dis-flex p-l-15"> -->
						<!-- <button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button> -->
						<!-- <p>373번째줄 search 구분</p> -->
						<!-- <input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" value="keyword" name="search_product" placeholder="Search">
						<input type="submit" value="검색" width = "300"/> -->
						<form action="productViewSearch" method="get">
							<!-- <input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요1" />
							<input type="submit" value="검색1" />
								<input class="mtext-107 cl2 size-114 plh2 p-r-15" id="keyword" type="text" value="" name="keyword" placeholder="Search2">				
								<button type="submit">검색2</button>
							<input type="submit" value="검색1" width = "300"/> -->
								<div class="input-group col-md-12">
			                   	 <input type="text" id="keyword" name="keyword" class="form-control input-lg" placeholder="Search2" />
			                   	 	<span class="input-group-btn">
			                        	<button id="SearchButtonImage" class="btn btn-secondary btn-lg" type="submit">
			                           	 	<i class="glyphicon glyphicon-search"></i>
			                        	</button>
			                    	</span>
			                	</div>
						</form>
						<!-- <input class="form-control" type="text" id="keyword" name="keyword" 
								value="keyword" placeholder="검색어를 입력하세요"/>
						<button id="searchBtn" class="btn btn-primary">Search</button>	 -->					
					<!-- </div> -->	
				</div>
				<!-- 원본끝-------------------------------------------------------------------------- -->
				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<div class="filter-col1 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Wallet By Brand
							</div>

							<ul>
							
								<li class="p-b-6">
									<a href="productViewSearchCategory?p_category=지갑" class="filter-link stext-106 trans-04">
										All Wallet
									</a>
								</li>							
								
								<li class="p-b-6">
									<a href="productViewSearchBrand?p_brand=고야드" class="filter-link stext-106 trans-04">
										고야드
									</a>
								</li>

								<li class="p-b-6">
									<a href="productViewSearchBrand?p_brand=구찌" class="filter-link stext-106 trans-04">
										구찌
									</a>
								</li>

								<li class="p-b-6">
									<a href="productViewSearchBrand?p_brand=루이비통" class="filter-link stext-106 trans-04">
										루이비통
									</a>
								</li>

								<li class="p-b-6">
									<a href="productViewSearchBrand?p_brand=에르메스" class="filter-link stext-106 trans-04">
										에르메스<!-- filter-link-active -->
									</a>
								</li>

								<li class="p-b-6">
									<a href="productViewSearchBrand?p_brand=프라다" class="filter-link stext-106 trans-04">
										프라다
									</a>
								</li>

								
							</ul>
						</div>

						<div class="filter-col2 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Watch By Brand
							</div>

							<ul>
							
								<li class="p-b-6">
									<a href="productViewSearchCategory?p_category=시계" class="filter-link stext-106 trans-04">
										All Watch
									</a>
								</li>
							
								<li class="p-b-6">
									<a href="productViewSearchBrand?p_brand=iwc" class="filter-link stext-106 trans-04">
										iwc
									</a>
								</li>

								<li class="p-b-6">
									<a href="productViewSearchBrand?p_brand=롤렉스" class="filter-link stext-106 trans-04">
										롤렉스
									</a>
								</li>

								<li class="p-b-6">
									<a href="productViewSearchBrand?p_brand=오메가" class="filter-link stext-106 trans-04">
										오메가
									</a>
								</li>

								<li class="p-b-6">
									<a href="productViewSearchBrand?p_brand=태그호이어" class="filter-link stext-106 trans-04">
										태그호이어
									</a>
								</li>

								<li class="p-b-6">
									<a href="productViewSearchBrand?p_brand=파텍필립" class="filter-link stext-106 trans-04">
										파텍필립
									</a>
								</li>

							</ul>
						</div>

						<div class="filter-col3 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								순위
							</div>

							<ul>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #222;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="productViewRank?keyword=p_amount desc" class="filter-link stext-106 trans-04">
										인기순
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #4272d7;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="productViewRank?keyword=p_released_date desc" class="filter-link stext-106 trans-04">
										최신순
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #b3b3b3;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="productViewRank?keyword=p_price desc" class="filter-link stext-106 trans-04">
										가격 높은순
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #00ad5f;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="productViewRank?keyword=p_price asc" class="filter-link stext-106 trans-04">
										가격 낮은순
									</a>
								</li>

								<!-- <li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #fa4251;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Red
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #aaa;">
										<i class="zmdi zmdi-circle-o"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										White
									</a>
								</li> -->
							</ul>
						</div>

						<!-- <div class="filter-col4 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Tags
							</div>

							<div class="flex-w p-t-4 m-r--5">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Fashion
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Lifestyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Denim
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts
								</a>
							</div>
						</div> -->
					</div>
				</div>
			</div>

			<div class="row isotope-grid">
				<c:forEach items="${product}" var="product" varStatus="status">
				<div  class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${product.p_category}" >
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="productimage/${product.p_image}" alt="IMG-PRODUCT" width="300" height="300">
							
							<%-- <a href="productViewQuick?p_number=${product.p_number}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
								Quick View
							</a> --%>
							
							<%-- <button type="button" id="QuickViewBtn" name="QuickViewBtn" value="${product.p_number}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
									Quick View123
							</button> --%>
							
							<button type="button" id="QuickViewBtn" name="QuickViewBtn" value="${product.p_number}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
									Quick View
							</button>
							
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
							<%-- <div style="display:none">"${product.p_number}"</div> --%>
								<%-- <a href="productDetail?p_number=${product.p_number}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">			
									${product.p_name}
								</a> --%>
								
								<a href="productDetail?p_number=${product.p_number}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">			
									<!-- productDetail2 -->${product.p_name}
								</a>
								
								<%-- <a href="product_replyAjax2?p_number=${product.p_number}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">			
									ajax 값 잘 넘어오나 확인버튼
								</a> --%>
								
								<span class="stext-105 cl3">
									<fmt:formatNumber value="${product.p_price}" pattern="###,###,###"/>원
								</span>
							</div>

							<!-- <div class="block2-txt-child2 flex-r p-t-3">
								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04" src="images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div> -->
						</div>
					</div>
					
				</div>
				</c:forEach>
			</div>
			<!-- 페이징 글번호 -->
			
			<!-- 검색기능을 사용하여 keyword에 값이 들어가 있을때 url에 keyword를 전달하여 페이징버튼을 눌러도 검색이 남아있게함. -->
			<!-- otherwise는 검색기능을 사용하지 않은 일반 상태일때의 페이징.url에 keyword가 붙지않는다. -->
			<nav aria-label="Page navigation example">
				<ul class="pagination m-5 flex-c-m" >
				<c:choose>
					<c:when test="${keyword!=null}">
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="idx">
							<c:out value="${pageMaker.cri.page == idx?'':''}" />
							<li class="page-item"><a href="productViewSearch${pageMaker.makeQuery(idx)}&keyword=${keyword}">${idx}</a></li>
						</c:forEach>																		
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page-item"><a href="productViewSearch${pageMaker.makeQuery(pageMaker.endPage +1)}&keyword=${keyword}"> » </a></li>
						</c:if> <br>
					</c:when>
					
					<c:when test="${rankKeyword!=null}">
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="idx">
							<c:out value="${pageMaker.cri.page == idx?'':''}" />
							<li class="page-item"><a href="productViewRank${pageMaker.makeQuery(idx)}&keyword=${rankKeyword}">${idx}</a></li>
						</c:forEach>																		
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page-item"><a href="productViewRank${pageMaker.makeQuery(pageMaker.endPage +1)}&keyword=${rankKeyword}"> » </a></li>
						</c:if> <br>
					</c:when>
					
					<c:otherwise>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="idx">
							<c:out value="${pageMaker.cri.page == idx?'':''}" />
							<li class="page-item"><a href="productView${pageMaker.makeQuery(idx)}">${idx}</a></li>
						</c:forEach>																										
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page-item"><a href="productView${pageMaker.makeQuery(pageMaker.endPage +1)}"> » </a></li>
						</c:if> <br>
					</c:otherwise>
				</c:choose>
				</ul>
			</nav>
			
			
			<div class="flex-c-m flex-w w-full p-t-45">
				<a href="productView" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
					Return to List
				</a>
			</div>
			<!-- 페이징 글번호 끝 -->
			<!-- Load more -->
			<!-- <div class="flex-c-m flex-w w-full p-t-45">
				<a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
					Load More
				</a>
			</div> -->
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
		<div class="overlay-modal1 js-hide-modal1" id="hideModal"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>
				
				<%-- <c:if test="${p_number eq product?p_number=${product.p_number}"> --%>
				<%-- <c:forEach items="${quickViewList}" var="product"> --%>
				<div id="quickViewModal" class="row">
				<!-- ajax로 만든 modal 들어올 자리 -->
<%-- 					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-dots"></div>
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

								<div class="slick3 gallery-lb">
									<div class="item-slick3" data-thumb="productimage/${quickViewList.p_image}">
										<div class="wrap-pic-w pos-relative">
											<div id="img">
												
											</div>

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="productimage/${quickViewList.p_image}">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3" data-thumb="productimage/'${quickViewList.p_image}'">
										<div class="wrap-pic-w pos-relative">
											<img src="productimage/'${quickViewList.p_image}'" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="productimage/'${quickViewList.p_image}'">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3" data-thumb="productimage/'${quickViewList.p_image}'">
										<div class="wrap-pic-w pos-relative">
											<img src="productimage/'${quickViewList.p_image}'" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="productimage/'${quickViewList.p_image}'">
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
							<h4 id="QuickName" class="mtext-105 cl2 js-name-detail p-b-14">
								${quickViewList.p_name}
							</h4>

							<span id="QuickPrice" class="mtext-106 cl2">
								<fmt:formatNumber value="${quickViewList.p_price}" pattern="###,###,###"/>원
							</span>

							<div class="stext-102 cl3 p-t-23">
								<div class="size-203 flex-c-m respon6">
									<table class="DetailTable">									
									 <tr>
									   <td>적립금</td>
									   <td>
									<fmt:formatNumber
									value="3333333333" pattern="###,###,###" />원
									 </tr>
									 <tr>
									   <td>배송비</td>
									   <td>무료</td>
									 </tr>
									 <tr>
									   <td>브랜드</td>
									   <td>브랜드값들어갈자리</td>
									 </tr>
									</table>
								</div>
								
							</div>
							
							
							<div class="p-t-33">
								<!-- <div class="flex-w flex-r-m p-b-10">
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
								</div> -->

								<!-- <div class="flex-w flex-r-m p-b-10">
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
								</div> -->

								<!-- <div class="flex-w flex-r-m p-b-10">
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
								</div> -->	
								
								<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<form:form role="form" method="post" id="buyForm" >
										<div class="wrap-num-product flex-w m-r-20 m-tb-10" >					
											<input type="hidden" name="p_number" value="${quickViewList.p_number}">
											<div id="minus" class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>
											<input id="b_amount" readonly class="mtext-104 cl3 txt-center num-product" type="number" name="b_amount" value="0">
											<div id="plus" class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>
											<span class="label-input100">최종가격</span>
											<input id="finalPrice" type="text" class="form-control" style="width: 50%;" value="0" readonly>
										<div>
											<button id="cart" class="stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail" type="button" style="float: left;">
												장바구니
											</button>
											<button id="buy" class="stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail" type="button">
												구입하기
											</button>
											<!-- <button class="stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail" type="submit" style="float: left;" onclick="javascript: form.action='/ssmall/cart/addCart';" >
												장바구니
											</button>
											<button class="stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail" type="submit" onclick="javascript: form.action='/ssmall/buy/buy';">
												구입하기
											</button>	 -->									
										</div>
									</form:form>
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
					</div> --%>
				</div>
				<%-- </c:forEach> --%>
				<%-- </c:if> --%>
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
<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e){
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
<script>
 $(document).ready(function(){
	 
 
	 $('#watch2').click(function(){
			
			$('#watch1').trigger("click");	
			
		});  	
	/*  get('/productView/:id/:pw', function(req, res) {
		  location.href="http://localhost:8282/ssmall/productView?id=abc&pw=1234";
		  res.send(watch1[req.params.id]+','+watch1[req.params.id]);  */
	
}); 
 
</script>  
<!--==================================  --> 

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

<script type="text/javascript">

	function numberFormat(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
	$(function(){
		$.ajax({
			url : '/ssmall/miniCart',
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
					tag = tag + "<img src='productimage/" + value.i_name +"' alt='IMG'>";
					tag = tag + "</div>";
					tag = tag + "<div class='header-cart-item-txt p-t-8'>";
					tag = tag + "<a href='productDetail?p_number=" + value.p_number + "' class='header-cart-item-name m-b-18 hov-cl1 trans-04'>";
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
				tag2 = tag2 + "<a href='cartView' class='flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10'>";
				tag2 = tag2 + "View Cart </a></div>";
				
				$("#total").append(tag2);
				
				$(document).ready(function () {

					$('#count').attr('data-notify', itemcount);

			    });
				
				
				
			}
		})
	})
	//검색 script
/* 	function setSearchTypeSelect(){
		var keyword = $('#keyword');

		$('#searchBtn').on('click',function(){
			var keywordVal = keyword.val();

			//검색어 입력 안했으면 검색창
			if(!keywordVal){
				alert("검색어를 입력하세요!");
				$('#keyword').focus();
				return;
			}
			var url = "productView?page=1"
				+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
				+ "&keyword=" + encodeURIComponent(keywordVal);
			window.location.href = url;
		})
	}*/

</script>
<script>
	$(function(){
		$(document).on("click","#QuickViewBtn",function(){
			
			/* alert($(this).attr("value")); */
			var data = {
					  p_number : $(this).attr("value")
			  };
			$.ajax({
				method:"get",
				url:"/ssmall/productViewQuick",
				data:data,
				async:false,
				error:function(xhr,status,error){
					alert(error);
					alert("er");
				},
				success:function(data){
					function numberWithCommas(x) {
						console.log("numberWithCommas");    
						return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					};
					
					$.each(data.slice(0, 1), function(key, data){
						modalIname1 = data.i_name;
						numberWithCommas = numberWithCommas(data.p_price);
					})
					$.each(data.slice(0, 2), function(key, data){
						modalIname2 = data.i_name;
					})
					$.each(data.slice(0, 3), function(key, data){
						modalIname3 = data.i_name;
					})
					console.log(modalIname1);
					console.log(modalIname2);
					console.log(modalIname3);
					
					$.each(data.slice(0, 1), function(key, data){
						/* console.log(data.i_name); */
					
					
					/* var modal = {
							p_name : data.p_name,
							p_price : data.p_price,
							p_number : data.p_number
					}; */
					
					
					var tag = "";
					
					tag = tag + "<div class='col-md-6 col-lg-7 p-b-30'>";
					tag = tag + "<div class='p-l-25 p-r-30 p-lr-0-lg'>";
					tag = tag + "<div class='wrap-slick3 flex-sb flex-w'>";
					
					tag = tag + "<div class='wrap-slick3-dots'>";
					
					tag = tag + "<ul class='slick3-dots' role='tablist' style=''>";

					tag = tag + "<li class='slick-active' role='presentation' id='leftModalImage1'>";
					tag = tag + "<img src='productimage/"+modalIname1+"' id='2leftModalImage1'>";
					tag = tag + "<div class='slick3-dot-overlay'></div>";
					tag = tag + "</li>";
					tag = tag + "<li role='presentation' class='' id='leftModalImage2'>";
					tag = tag + "<img src=' productimage/"+modalIname2+"' id='2leftModalImage2'>";
					tag = tag + "<div class='slick3-dot-overlay'></div>";
					tag = tag + "</li>";
					tag = tag + "<li class='' role='presentation' class='' id='leftModalImage3'>";
					tag = tag + "<img src=' productimage/"+modalIname3+"' id='2leftModalImage3'>";
					tag = tag + "<div class='slick3-dot-overlay'></div>";
					tag = tag + "</li>"
					tag = tag + "</ul>";

					tag = tag + "</div>";
					
					

					tag = tag + "<div class='slick3 gallery-lb'>";
					tag = tag + "<div class='item-slick3' data-thumb='productimage/"+modalIname1+"'>";
					tag = tag + "<div class='wrap-pic-w pos-relative'>";
					tag = tag + "<img src='productimage/"+modalIname1+"' alt='IMG-PRODUCT' id='mainModalImage'>";
					tag = tag + "<a class='flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04' href='productimage/"+modalIname1+"'>";
					tag = tag + "<i class='fa fa-expand'></i>";
					tag = tag + "</a>";
					tag = tag + "</div>";
					tag = tag + "</div>";
					
					tag = tag + "</div>";
					tag = tag + "</div>";
					tag = tag + "</div>";
					tag = tag + "</div>";
					
					tag = tag + "<div class='col-md-6 col-lg-5 p-b-30'>";
					tag = tag + "<div class='p-r-50 p-t-5 p-lr-0-lg'>";
					tag = tag + "<h4 id='QuickName' class='mtext-105 cl2 js-name-detail p-b-14'>"+data.p_name+"</h4>";
								
					tag = tag + "<span id='QuickPrice' class='mtext-106 cl2'>"+numberWithCommas+"</span>원";

					tag = tag + "<div class='stext-102 cl3 p-t-23'>";
					tag = tag + "<div class='size-203 flex-c-m respon6' style='width: 250px'>";
				    
					
					tag = tag + "<table class='table table-search'>";									
					tag = tag + "<tr>";
					tag = tag + "<td>적립금</td>";
					tag = tag + "<td>";
					tag = tag + +data.p_price/10+"원";
					tag = tag + "</tr>";
					tag = tag + "<tr>";
					tag = tag + "<td>배송비</td>";
					tag = tag + "<td>무료</td>";
					tag = tag + "</tr>";
					tag = tag + "<tr>";
					tag = tag + "<td>브랜드</td>";
					tag = tag + "<td>"+data.p_brand+"</td>";
					tag = tag + "</tr>";
					tag = tag + "</table>";
					tag = tag + "</div>";
					tag = tag + "</div>";
					tag = tag + "<div class='p-t-33'>";
					tag = tag + "<div class='flex-w flex-r-m p-b-10'>";
					tag = tag + "<div class='size-204 flex-w flex-m respon6-next' style='width: 500px'>";
					tag = tag + "<form:form role='form' method='post' id='buyForm' >";
					tag = tag + "<div class='wrap-num-product flex-w m-r-20 m-tb-10' >";					
					tag = tag + "<input type='hidden' name='p_number' id='p_number' value='"+data.p_number+"'>";
					tag = tag + "<div id='minus' value='"+data.p_price+"' class='btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m'>";
					tag = tag + "<i class='fs-16 zmdi zmdi-minus'></i>";
					tag = tag + "</div>";
					tag = tag + "<input id='b_amount' readonly class='mtext-104 cl3 txt-center num-product' type='number' name='b_amount' value='0'>";
					tag = tag + "<div id='plus' value='"+data.p_price+"' class='btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m'>";
					tag = tag + "<i class='fs-16 zmdi zmdi-plus'></i>";
					tag = tag + "</div>";
					tag = tag + "</div>";
					tag = tag + "<span class='label-input100'>최종가격</span>";
					tag = tag + "<input id='finalPrice' type='text' class='form-control m-3' style='width: 50%;' value='0' readonly >";
					tag = tag + "<div>";
					tag = tag + "<button id='cart' class='stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail' value='"+data.p_number+"' type='button' style='float: left;'>장바구니</button>";
					tag = tag + "<button id='buy' class='stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail' value='"+data.p_number+"' type='button'>구입하기</button>";
					tag = tag + "</div>";
					tag = tag + "</form:form>";
					tag = tag + "</div>";
					tag = tag + "</div>";
					tag = tag + "</div>";

					tag = tag + "<div class='flex-w flex-m p-l-100 p-t-40 respon7'>";
					tag = tag + "<div class='flex-m bor9 p-r-10 m-r-11'>";

					tag = tag + "</div>";

					tag = tag + "</div>";
					tag = tag + "</div>";
					tag = tag + "</div>";
					
					
					
					$("#quickViewModal").html(tag);
					 console.log("quickViewModal탐");
					});
			}
		});

	})
})


/* $('#QuickName').html(data.p_name);
$('#QuickPrice').html('<p>'+data.p_price+'</p>');
$('#QuickDescription').html(data.p_description); */



//ajax 예시. 끝나면 지울것
/* var tag = "";
	tag = tag + "<div class='size-203 flex-c-m respon6'>";
	tag = tag + "<table class='DetailTable'>";									
	 tag = tag + "<tr>";
	   tag = tag + "<td>적립금</td>";
	   tag = tag + "<td>";
	tag = tag + "<td>"+data.p_price/10+"</td>원";
	 tag = tag + "</tr>";
	 tag = tag + "<tr>";
	   tag = tag + "<td>배송비</td>";
	   tag = tag + "<td>무료</td>";
	 tag = tag + "</tr>";
	 tag = tag + "<tr>";
	   tag = tag + "<td>브랜드</td>";
	   tag = tag + "<td>"+data.p_brand+"</td>";
	 tag = tag + "</tr>";
	tag = tag + "</table>";
tag = tag + "</div>";

$("#QuickDescription").html(tag);
		 console.log("QuickDescription탐"); */

//QuickView의 modal에서 개수 버튼을 누르면 그 개수에 따라 값이 아래 나오는 코드+구매시 오류방지코드
$(document).ready(function(){
	
	function numberWithCommas(x) {
		console.log("numberWithCommas");    
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	};
	//모달에서 +버튼을 누르면 개수가 변하지 않고, 그에 따라 최종값이 나오지 않는다.
	//최종값 구하기는 어찌저찌 했는데, + 혹은 -버튼을 누를 때 b_amount가 +되거나 -되게 하는거에서 막혀있다.
	//slick과 마찬가지로 호출 순서에 문제가 있어서 버튼이 작동하지 않아서 강제로 클릭이벤트로 하게 하고 있다.
	//호출 순서 문제를 해결하면 한번에 될 것 같다.
	$(document).on("click","#plus",function(){	
		console.log("plus버튼");
		var price = $(this).attr("value");
		var amount = $("#b_amount").val();	
		$("#b_amount").val(parseInt(amount)+1);
		amount = $("#b_amount").val();
		console.log("amount");
		console.log(amount);
		price = price * amount;
		
		document.getElementById("finalPrice").value = numberWithCommas(price);
		
     });
	
	$(document).on("click","#minus",function(){	
		console.log("minus버튼");
		var price = $(this).attr("value");
		var amount = $("#b_amount").val();
		if(amount==0){
			console.log("0일때");
			return false;
		}
		$("#b_amount").val(parseInt(amount)-1);
		amount = $("#b_amount").val();
		console.log("amount");
		console.log(amount);
		price = price * amount;
		
		document.getElementById("finalPrice").value = numberWithCommas(price);
		
     });
	//QuickView Modal의 왼쪽 3줄 버튼누르면 각각 화면 변환되는 코드.
	//원래 slick이 자동으로 해주는 거지만 ajax쓰니 안먹혀서 직접구현
	
	//화살표 누르면 바뀌는 코드인데 처음은 되는데 그 다음이 안됨
	/* $(document).on("click","#arrowLeft",function(){
		console.log("arrowLeft버튼");
		var mainImage = $("#mainModalImage").attr("src");
		console.log(mainImage);
		var image1 = $("#2leftModalImage1").attr("src");
		console.log(image1);
		var image2 = $("#2leftModalImage2").attr("src");
		console.log(image2);
		var image3 = $("#2leftModalImage3").attr("src");
		console.log(image3);
		
		if(mainImage = image1){
			console.log("1번사진");
			var image = $("#2leftModalImage3").attr("src");
			console.log(image);
			$("#leftModalImage3").attr('class','slick-active');
			$("#leftModalImage2").attr('class','');
			$("#leftModalImage1").attr('class','');
			$("#mainModalImage").attr('src',image);
		}else if(mainImage = image2){
			console.log("2번사진");
			console.log("leftModalImage1버튼");
			var image = $("#2leftModalImage1").attr("src");
			console.log(image);
			$("#leftModalImage1").attr('class','slick-active');
			$("#leftModalImage2").attr('class','');
			$("#leftModalImage3").attr('class','');
			$("#mainModalImage").attr('src',image);
		}else if(mainImage = image3){
			console.log("3번사진");
			console.log("leftModalImage1버튼");
			var image = $("#2leftModalImage1").attr("src");
			console.log(image);
			$("#leftModalImage2").attr('class','slick-active');
			$("#leftModalImage1").attr('class','');
			$("#leftModalImage3").attr('class','');
			$("#mainModalImage").attr('src',image);
		}
     });
	tag = tag + "<div class='wrap-slick3-arrows flex-sb-m flex-w'>";
	tag = tag + "<button class='arrow-slick3 prev-slick3 slick-arrow' id='arrowLeft' style=''><i class='fa fa-angle-left' aria-hidden='true'></i></button>";
	tag = tag + "<button class='arrow-slick3 next-slick3 slick-arrow' id='arrowRight' style=''><i class='fa fa-angle-right' aria-hidden='true'></i></button>";
	tag = tag + "</div>";
	*/
	
	$(document).on("click","#arrowRight",function(){
		console.log("arrowRight버튼");
		var image = $("#mainModalImage").attr("src");
		console.log(image);
		$("#leftModalImage1").attr('class','slick-active');
		$("#leftModalImage2").attr('class','');
		$("#leftModalImage3").attr('class','');
		$("#mainModalImage").attr('src',image);
		
     });
	
	$(document).on("click","#leftModalImage1",function(){
		console.log("leftModalImage1버튼");
		var image = $("#2leftModalImage1").attr("src");
		console.log(image);
		$("#leftModalImage1").attr('class','slick-active');
		$("#leftModalImage2").attr('class','');
		$("#leftModalImage3").attr('class','');
		$("#mainModalImage").attr('src',image);
		
     });
	$(document).on("click","#leftModalImage2",function(){
		console.log("leftModalImage2버튼");
		var image = $("#2leftModalImage2").attr("src");
		console.log(image);
		$("#leftModalImage2").attr('class','slick-active');
		$("#leftModalImage1").attr('class','');
		$("#leftModalImage3").attr('class','');
		$("#mainModalImage").attr('src',image);
		
     });
	$(document).on("click","#leftModalImage3",function(){
		console.log("leftModalImage3버튼");
		var image = $("#2leftModalImage3").attr("src");
		console.log(image);
		$("#leftModalImage3").attr('class','slick-active');
		$("#leftModalImage2").attr('class','');
		$("#leftModalImage1").attr('class','');
		$("#mainModalImage").attr('src',image);
		
     });
	
	/* 상품개수가 0인 상태로 장바구니 클릭시 카트로 넘어가서 0으로 나오는걸 막는 코드 */
		$(document).on("click","#cart",function(){
			console.log("장바구니 버튼 클릭함");
			var b_amount=$("#b_amount").val();
			var p_number=$("#p_number").val();
			if(b_amount==0){
				Swal.fire('장바구니','구매수량을 입력해 주세요','error');
			}else if(b_amount!=0){
				console.log("장바구니 1개이상일때 1번");
				var data = {
						p_number : p_number,
						b_amount : b_amount
				}
				console.log(p_number);
				console.log(b_amount);
				window.location.href = '/ssmall/cart/addCart?p_number='+p_number+'&b_amount='+b_amount;
				//위에껄로 다됨...
				/*$.ajax({
					url:"/ssmall/cart/addCart",
					type:"get",
					data : data,
					success:function(){
						console.log("장바구니ajax 성공");
						window.location.href = '/ssmall/cart/cartView';
					}
				});*/
			}
		});
	
		$(document).on("click","#buy",function(){
			console.log("구매 버튼 클릭함");
			var b_amount=$("#b_amount").val();
			var p_number=$("#p_number").val();
			if(b_amount==0){
				Swal.fire('구매','구매수량을 입력해 주세요','error');
			}else if(b_amount!=0){
				console.log("구매 1개이상일때 1번");
				var data = {
						p_number : p_number,
						b_amount : b_amount
				}
				console.log(p_number);
				console.log(b_amount);
				window.location.href = '/ssmall/buy/buy?p_number='+p_number+'&b_amount='+b_amount;
			/*	$.ajax({
					url:"/ssmall/buy/buy",
					type:"get",
					data : data,
					success:function(){
						console.log("구매ajax 성공");
						window.location.href = '/ssmall/buy/buy?'+p_number;
						
					}
				});
			*/
			}
		});
		
		//백업용
		/* $(document).on("click","#cart",function(){
			console.log("장바구니 버튼 클릭함");
			var b_amount=$("#b_amount").val();
			if(b_amount==0){
				Swal.fire('장바구니','구매수량을 입력해 주세요','error');
			}else if(b_amount!=0){
				console.log("장바구니 1개이상일때 1번");
				var form = $('#buyForm');
				console.log(form);
				//var form = $("form[role='form']");
				form.attr("action",
						"/ssmall/cart/addCart");
				form.attr("method","get");												
				form.submit();
				$("#hideModal").trigger("click");//모달 닫는 버튼을 강제실행
				$("#b_amount").val(0);//값 초기화
				$("#finalPrice").val(0);
				console.log("장바구니 1개이상일때 2번");
			}
			
		});	 */
		//form태그 전송이 아니라 직접 data에 넣어서 보내보겠음
		/* $(document).on("click","#cart",function(){
			console.log("장바구니 버튼 클릭함");
			var b_amount=$("#b_amount").val();
			if(b_amount==0){
				Swal.fire('장바구니','구매수량을 입력해 주세요','error');
			}else if(b_amount!=0){
				console.log("장바구니 1개이상일때 1번");
				var form = $('#buyForm');
				console.log(form);
				$.ajax({
					url:"/ssmall/cart/addCart",
					type:"get",
					data : form.serialize(),
					success:function(){
						console.log("장바구니ajax 성공");
					}
				});
			}
		}); */
	
	
		/* 상품개수가 0인 상태로 구매 클릭시 0으로 나오는걸 막는 코드 
		$(document).on("click","#buy",function(){
			console.log("구매버튼 클릭함");
			var b_amount=$("#b_amount").val();
			if(b_amount==0){
				Swal.fire('구입하기','구매수량을 입력해 주세요','error');
			}else if(b_amount!=0){
				var form = $('#buyForm');
				//var form = $("form[role='form']");
				form.attr("action",
						"/ssmall/buy/buy");
				form.attr("method","post");												
				form.submit();
			}
			
		});*/
	});


</script>
<%-- /* $('#QuickPrice').html('<p>'+data.p_name+'</p>'); */
					/*$('#QuickPrice').html(data.p_price); */
					/* $('.wrap-modal1').modal(); */
					 /* js-show-modal1 */
					//$('#QuickPrice').html("<fmt:formatNumber value='"+data.p_price+"' pattern='###,###,###'/>원"); --%>
					
					<!-- 모달의 사진 좌우변경 화살표. modal 완성 후 필요없으면 지울 예정
					tag = tag + "<div class='wrap-slick3-arrows flex-sb-m flex-w'>"
					tag = tag + "<div class='item-slick3' data-thumb='productimage/"+data.p_image+"'>";
					tag = tag + "<div class='wrap-pic-w pos-relative'>";
					tag = tag + "<img src='productimage/"+data.p_image+"' alt='IMG-PRODUCT'>";
					tag = tag + "<a class='flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04' href='productimage/"+data.p_image+"'>";
					tag = tag + "<i class='fa fa-expand'></i>";
					tag = tag + "</a>";
					tag = tag + "</div>";
					tag = tag + "</div>";
					tag = tag + "</div>"; -->

</body>
</html>