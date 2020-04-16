<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
 
    String name = "";
    if(principal != null) {
        name = auth.getName();
    }
%>
<head>

<title>Product Detail</title>
<!-- <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script> -->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script><!-- alert버튼대체제 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<!--===============================================================================================-->
<style type="text/css">
	div#ck_content img {
		width:60%;
		max-width:400px; 
		height:auto;	
	}
/* .cArea{
	border: 2px solid;
	padding: 5px;
}

.postRight{
		font-family: 'Verdana', "gulim", "굴림";
		font-size: 15px;
		color: #000;
		margin: 0;
		outline: 0;
		vertical-align: top;
		background: transparent;
		margin-top: -1px;
		border: 1px solid #ddd;
		padding: 15px 15px 15px 15px;
		position: relative;
		background-color: #fff;
}

#demo{
	position:relatve;
	font-family: 'Verdana', "gulim", "굴림";
		font-size: 15px;
		color: #000;
		right:15px;
		width:659px;
		outline: 0;
		vertical-align: top;
		background: transparent;
		margin-top: -1px;
		border: 1px solid #ddd;
		padding: 15px 15px 15px 35px;
		position: relative;
		background-color: #fff;
		
}

.qna_reply_area qa_c3{
	font-size: 12px;
	color: #000;
	border-collapse: collapse;
	border-spacing: 0;
	font-family: "굴림", Gulim, Arial, sans-serif;
	text-align: center;
	margin: 0;
	padding: 0;
	outline: 0;
	vertical-align: top;
	background: transparent;
	border: 1px solid #ddd;
	display: none;
}*/

    <style type="text/css">
        #wrap {
            width: 550px;
            margin: 0 auto 0 auto;
            text-align :center;
        }
    
        #ReplyModifyForm{
            text-align :center;
        }
 
        #wrap {
            width: 700px;
            margin: 0 auto 0 auto;
        }
        
        #comment{
            text-align :left;
        }
        
        #listGuestForm{
            text-align :center;
            overflow:scroll; 
            overflow-x:hidden; 
            height:220px;
        }
        
        #writeGuestForm, #pageForm{
            text-align :center;
        }
        
        .modal {
        text-align: center;
		}
 
		@media screen and (min-width: 768px) { 
		 .modal:before {
		        display: inline-block;
		        vertical-align: middle;
		        content: " ";
		        height: 100%;
		        }
		}
		.modal-dialog {
		        display: inline-block;
		        text-align: left;
		        vertical-align: middle;
		}
		
</style>
<style>

.DetailTable{
		font-size:15px;
		width:"200";


	}
</style>
<style>
/* 상품소감에 별표주기 */
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

</style>

<script>	    	    	
	    function replyList(){
	    	console.log("replyList타는지 확인2");
	    	console.log("${productNum.p_number}")
	    	 $.ajax({
	    		 url : '/ssmall/product_replyAjax2',
	    		 type :'get',
	    		 dataType :'json',
	    		 data :{
	    			 p_number: ${productNum.p_number}
	    	 	 },
	    	 	
	    		 success : function(data) {
	    			 var tag="";
	    			 console.log(data);
	    			 $.each(data, function(key, data){
	    				 
						tag = tag + "<div class='container'> "
	    				tag = tag + "<div style=' border: 1px solid #e6e6e6;'>";
	    				tag = tag + "<div style='margin-bottom : 10px; margin-left : 10px;'><strong><br>&nbsp;작성자 : "+data.m_id+"&nbsp;</strong>";
	    				tag = tag + "<strong>작성날짜 : "+data.bdate+"</strong><br>";															 
	    				tag = tag + "<hr><div id='ck_content'>"+data.bcontent+"</div></div>";
	    			 	tag = tag + "<form role='form' method='post' autocomplete='off' id='form_'"+data.bid+"'>";
						tag = tag + "<input type='hidden' id = 'p_number' name='p_number' value='"+data.p_number+"'>";
						tag = tag + "<input type='hidden' id = 'bstep_"+data.bid+"' name='bstep' value='"+data.bstep+"'>";/* 대댓글의 세로단을 위한 인자 */
						tag = tag + "<input type='hidden' id = 'bindent_"+data.bid+"' name='bindent' value='"+data.bindent+"'>";/* 대댓글의 가로단을 위한 인자 */
						tag = tag + "<input type='hidden' id = 'm_number' name='m_number' value='"+data.m_number+"'>";/* 회원번호.글 수정 삭제시 본인만 가능하게 하기 위해 */
						tag = tag + "<input type='hidden' id = 'm_id' name='m_id' value='"+data.m_id+"'>";									
						tag = tag + "<input type='hidden' id = parentBid value='"+data.bid+"'name='"+data.bid+"'>";
						tag = tag + "<input type='hidden' value='"+data.btitle+"' name='btitle'>";
						tag = tag + "<input type='hidden' value='"+data.bcontent+"' name='bcontent'>";
						tag = tag + "<input type='hidden' value='"+data.btotalrepot+"' name='btotalrepot'>";//리폿당한 횟수
						tag = tag + "<input type='hidden' value='"+data.brepotid1+"' name='btotalrepot'>";//리폿한 사용자1의 member number
						tag = tag + "<input type='hidden' value='"+data.brepotid2+"' name='btotalrepot'>";//리폿한 사용자2의 member number
						/* 로그인이 되어있을때 수정, 삭제버튼이 보인다. 비 로그인유저는 버튼을 보지 못한다. */
						tag = tag + "<sec:authorize access='hasRole("USER")'>";												
						/* tag = tag + "<p>현재 로그인한 아이디 principal_m_id:'${principal_m_id}'</p>";
						tag = tag + "<p>글에 저장된 아이디 data.m_id:"+data.m_id+"</p>"; */
						tag = tag + "<hr><div style='margin-top : 10px; margin-bottom : 10px; margin-right : 10px; text-align : right;'><button class='btn btn-secondary'  type='button' id = deleteBoard name = 'deleteBoard' value='"+data.bid+"'>"+"<i class='fas fa-trash-alt'></i> 삭제</button>";
						tag = tag + "&nbsp;<button class='btn btn-info '  type = 'button' id = modify name = 'modify' value='"+data.bid+"'>"+"<i class='fas fa-pencil-alt'></i> 수정</button>";
						tag = tag + "&nbsp;<button class='btn btn-danger '  type = 'button' id = report name = 'report' value='"+data.bid+"'>"+"<i class='fas fa-ban'></i> 신고</button></div>";
						/* tag = tag + "<button type = 'button' id = reply_reply name = 'reply_reply' value='"+data.bid+"'>"+"댓글"+"</button>"; 대댓글을 위한 버튼*/
						tag = tag + "</sec:authorize>";																									
	/* 					tag = tag + "</p>"; */
						tag = tag + "</form>";
						tag = tag+ "</div></div><br>"
							
    				 
	    			 });
	    			 $("section.reply_ajax").html(tag);
    				 console.log("html탐");
	    			 
	    		 },
	    		 error : function(request, status, error) {
                     console.log(request.responseText);
                     console.log(error);
                     console.log(this.url);
                 }	    		 	    		 
	    		 
	    	 });
	    	 /* alert("replyList탐"); */
	    	 console.log('1532번');

	    	}

	   </script>

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
			<!-- <div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>

				<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
					<i class="zmdi zmdi-favorite-outline"></i>
				</a>
			</div> -->

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
					</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="homeview" class="flex-c-m p-lr-10 trans-04">
							Home
						</a>

						<a href="myPage" class="flex-c-m p-lr-10 trans-04">
							My
						</a>

						<a href="cartView" class="flex-c-m p-lr-10 trans-04">
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


	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="/ssmall/" class="stext-109 cl8 hov-cl1 trans-04"> Main <i
				class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <a href="productView" class="stext-109 cl8 hov-cl1 trans-04"> 상품
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <span class="stext-109 cl4">
			<c:forEach items="${productDetail}" var="productDetail" begin="0" end="0">					
				${productDetail.p_name}
				</c:forEach>

			</span>
		</div>
	</div>

	<!-- Product Detail -->

	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">

				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
								<c:forEach items="${productDetail}" var="productDetail">
									<div class="item-slick3"
										data-thumb="productimage/${productDetail.i_name}">

										<div class="wrap-pic-w pos-relative">
											<img src="productimage/${productDetail.i_name}"width="300" height="450"
												alt="IMG-PRODUCT"> <a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="productimage/${productDetail.i_name}"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</c:forEach>
							</div>


						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<c:forEach items="${productDetail}" var="productDetail" begin="0"
							end="0">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">
								${productDetail.p_name}</h4>

							<span class="mtext-106 cl2"> <fmt:formatNumber
									value="${productDetail.p_price}" pattern="###,###,###" />원
							</span>

						</c:forEach>

						<!--  -->
						<div class="p-t-33">
							<!-- <div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">
									Size<br /> 사용할건지 말건지 확인
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

							<div class="stext-102 cl3 p-t-23">
								<div class="size-203 flex-c-m respon6" style="width: 250px">
									<table class="table table-search">									
									 <tr>
									   <td>적립금</td>
									   <td>
									<fmt:formatNumber
									value="${productNum.p_price/10}" pattern="###,###,###" />원
									 </tr>
									 <tr>
									   <td>배송비</td>
									   <td>무료</td>
									 </tr>
									 <tr>
									   <td>브랜드</td>
									   <td>${productNum.p_brand}</td>
									 </tr>
									</table>
								</div>
								
								<!-- <div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">
									<table border="1">
										<th>자리1</th>
										<th>자리2</th>
										<tr> 첫번째줄
											<td>1자리</td>
											<td>2자리</td>
										</tr>
										<tr> 두번째줄
											<td>1자리</td>
											<td>2자리</td>
										</tr>
									</table>
								</div> -->

								<!-- <div class="size-204 respon6-next">
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
								</div> -->
							</div>

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next" style="width: 500px">
									<form:form role="form" method="post" id="buyForm" >
										<div class="wrap-num-product flex-w m-r-20 m-tb-10" >					
											<input type="hidden" name="p_number" value="${productNum.p_number}">
											<div id="minus" class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>
											<input id="b_amount" readonly class="mtext-104 cl3 txt-center num-product" type="number" name="b_amount" value="0">
											<div id="plus" class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>
											<div>
											<span class="label-input100">최종가격</span>
											<input id="finalPrice" type="text" class="form-control m-3" style="width: 50%;" value="0" readonly>
											</div>
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

						<!-- <div class="flex-w flex-m p-l-100 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
									data-tooltip="Add to Wishlist"> <i
									class="zmdi zmdi-favorite"></i>
								</a>
							</div>

							<a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
								data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
							</a> <a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
								data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
							</a> <a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
								data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
							</a>
						</div> -->
					</div>
				</div>

			</div>

			<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						
							
						<li class="nav-item p-b-10"><a class="nav-link active"
							data-toggle="tab" href="#description" role="tab">Description
								상품설명 설명</a></li>

						<!-- <li class="nav-item p-b-10"><a class="nav-link"
							data-toggle="tab" href="#information" role="tab">Additional
								information상세정보. 크기 길이 등</a></li> -->
						<li class="nav-item p-b-10"><a class="nav-link"
							data-toggle="tab" href="#reviews" role="tab">Reviews</a></li>

					</ul>

					<!-- Tab panes -->
					<div class="tab-content p-t-43">
						<!-- - -->
						<div class="tab-pane fade show active" id="description"
							role="tabpanel">
							<div class="how-pos2 p-lr-15-md" style="overflow:auto;">
								<p>${productDetail[0].p_description}</p>
								<%-- <c:forEach items="${productDetail}" var="productDetail">
								<p>${productDetail.p_description}</p>
								</c:forEach> --%>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="information" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<ul class="p-lr-28 p-lr-15-sm">
										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> 명칭<br />Weight
										</span> <span class="stext-102 cl6 size-206"> 값<br /> 0.79 kg
										</span></li>

										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> Dimensions </span> <span
											class="stext-102 cl6 size-206"> 110 x 33 x 100 cm </span></li>

										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> Materials </span> <span
											class="stext-102 cl6 size-206"> 60% cotton </span></li>

										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> Color </span> <span
											class="stext-102 cl6 size-206"> Black, Blue, Grey,
												Green, Red, White </span></li>

										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> Size </span> <span
											class="stext-102 cl6 size-206"> XL, L, M, S </span></li>
									</ul>
								</div>
							</div>
						</div>

						<div class="tab-pane fade" id="reviews" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm">
																			
<!-- ----------------------------------------------------구매감상 게시판----------------------------------------------------------------- -->
																												
										
											<sec:authorize access="isAnonymous()">												
												<!-- <p style="font-weight: bold; font-size: 1.5em;">isAnonymous</p> -->
												<button type="button" id="btn_collapse_notLogin"class="btn btn-dark" style="margin-bottom: 20px; margin-left: 15px;"><i class="fas fa-user-edit"></i> 구매후기 작성</button>
											</sec:authorize>
										
											<%-- 콜햅스 원본버튼. 모달로 바꿔보기 위해 주석처리함.
											<sec:authorize access="hasRole('USER')">콜햅스원본												
												<p class="text-success" style="font-weight:bold; font-size: 1.5em;"><%=name%>님</p>
												<p>principal_m_id:"${principal_m_id}"</p>
												<button type="button" class="btn btn-info"data-toggle="collapse" data-target="#demo">구매후기 작성</button>
											</sec:authorize> --%>
											
											<sec:authorize access="hasRole('USER')">
												<%-- <p class="text-success" style="font-weight:bold; font-size: 1.5em;"><%=name%>님</p>
												<p>principal_m_id:"${principal_m_id}"</p> --%>
												<button type="button" class="btn btn-dark" id="writeModalBtn" style="margin-bottom: 20px; margin-left: 15px;"><i class="fas fa-user-edit"></i> 구매후기 작성</button>
											</sec:authorize>
																																	
											<!-- <button type="button" class="btn btn-info"data-toggle="collapse" data-target="#demo">구매후기 작성</button> -->
												<div id="demo" class="collapse in" >	<!-- style="border: 1px solid;"	 -->
												
									<!-- ================================================================================================= -->
										<!-- <div class="row p-b-25">
												<div class="col-12 p-b-5">
													<label class="stext-102 cl3" for="review">Your review</label>
													<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="review" name="review"></textarea>
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="name">Name</label>
													<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="name" type="text" name="name">
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="email">Email</label>
													<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="email" type="text" name="email">
												</div>
											</div> -->
										<!-- 콜랩스 원본
											<form id="form" name="form" role="form" method="post" autocomplete="off">
														<input type="hidden" id="p_number" value="${productNum.p_number}"name="p_number">																													
														<input type="hidden" id="m_number" value="${principal_m_number}" name="m_number">														
														<input type="hidden" id="m_id" value="${principal_m_id}" name="m_id" />
														<label>제목</label>
														<input type="text" class="btitleCollapse" size="62" id="btitle" name="btitle" style="border: 1px solid;" /><br />
														<!-- <label>작성자</label> <input type="text" name="m_id" style=" border:1px solid;" /><br />
														<label>내용</label>
														<textarea cols="63" rows="5" class="bcontentCollapse" id="bcontent" name="bcontent" style="border: 1px solid; resize: none;"></textarea><br/>
														<button type="button" id="reply_btn" data-toggle="collapse" data-target="#demo">작성</button>-->
											
									<!-- ==================================================================================================== -->
																																																											
													<form id="form" name="form" role="form" method="post" autocomplete="off">
														<input type="hidden" id="p_number" value="${productNum.p_number}"name="p_number">																													
														<input type="hidden" id="m_number" value="${principal_m_number}" name="m_number">
														<input type="hidden" id="m_id" value="${principal_m_id}" name="m_id" />
														
														<div class="row p-b-25"> <!-- class="container" -->
															<div class="col-sm-6 p-b-5">
																<label class="stext-102 cl3" for="name"></label><!-- Title -->
																<input class="size-111 bor8 stext-102 cl2 p-lr-20" type="hidden" id="btitle" name="btitle">
															</div>
															<!-- <div class="col-sm-6 p-b-5">
																<label class="stext-102 cl3" for="email">Email</label>
																<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="email" type="text" name="email">
															</div> -->
															<div class="col-12 p-b-5">
																<label class="stext-102 cl3" for="review">Your review</label>
																<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" style="resize: none;" id="bcontent" name="bcontent"></textarea>
															</div>
														</div>
														<button class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10" type="button" id="reply_btn" data-toggle="collapse" data-target="#demo">작성</button>
															
	
														
														<!-- m_number의 value에 로그인한 사람의 m_number를 가져오면 됨. -->
														
														<!-- <label>제목</label>
														<input type="text" class="btitleCollapse" size="62" id="btitle" name="btitle" style="border: 1px solid;" /><br />
														<label>작성자</label> <input type="text" name="m_id" style=" border:1px solid;" /><br />
														<label>내용</label>
														<textarea cols="63" rows="5" class="bcontentCollapse" id="bcontent" name="bcontent" style="border: 1px solid; resize: none;"></textarea><br/> -->
														
														
														 <script>
															$("#btn_collapse_notLogin").click(function(){
																console.log("btn_collapse_notLogin 버튼이벤트 탐");
																Swal.fire({
																	title:'글쓰기',
																	text:'로그인 후 이용 가능합니다.',
																	type:'warning',
																	showCancelButton: true,
																	confirmButtonColor:'#3085d6',
																	cancelButtonColor:'#d33',
																	confirmButtonText:'Login'
																}).then((result)=>{
																	if(result.value){
																		location.href="productDetailLogin?p_number=${productNum.p_number}";
																	}
																})
																/* location.href="productDetailLogin?p_number=${productNum.p_number}"; */
															})
															
															$("#writeModalBtn").click(function(){
																/* console.log("checkBuyList확인1");
																console.log(${checkBuyList});
																console.log("checkBuyList확인2"); */
																if(${checkBuyList}!="0"){
																	alert("${checkBuyList}!=0 즉 구매한 상품");
																	$('#writeModal').modal();
																}else{
																alert("구입 후 이용하실수 있습니다.");
																}
															});
															
															
															/* $("#btn08").click(function(){
																  Swal.fire({
																    title: '好きなタイトルを入力',
																    text: "好きなテキストを入力",
																    type: 'warning',
																    showCancelButton: true,
																    confirmButtonColor: '#3085d6',
																    cancelButtonColor: '#d33',
																    confirmButtonText: 'OK'
																  }).then((result) => {
																    if (result.value) {
																      Swal.fire(
																        '自由に入力',
																        '自由に入力',
																        'success'
																        );
																    }
																  });
																}); */
															
															
															/* 	구매후기 작성 누르면 콜햅스 내려와서 작성되는 스크립트.
																작성 누르면 수정처럼 모달이 뜨고 거기서 글쓰기가 되게 하고싶음. 주석처리
																$("#reply_btn").click(function(){
																console.log("구매소감Ajax");
																var formObj = $("#demo form[role='form']");
																console.log("구매소감Ajax1");
																var p_number = $("#p_number").val();
																console.log("구매소감Ajax2");
																var m_number = $("#m_number").val();
																console.log("구매소감Ajax3");
																var m_id = $("#m_id").val();
																console.log("구매소감Ajax4");
																var bcontent = $("#bcontent").val();
																console.log("구매소감Ajax5");
																var btitle = $("#btitle").val();
																console.log("m_number넘김");
																var m_number = $("#m_number").val();
																console.log("구매소감Ajax data위");
																var data = {
																		p_number : p_number,
																		m_number : m_number,
																		m_id : m_id,
																		bcontent : bcontent,
																		btitle : btitle,
																		m_number : m_number
																		};
																console.log("구매소감Ajax $.ajax 위");
																
																
																$.ajax({
																	url : '/ssmall/product_Write_reply',																	
																	method : 'get',
																	data : data,
																	error:function(request,status,error){
																	    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
														            },																	
																	success : function(){
																		console.log("구매소감Ajax $.ajax 위2");	
																			글목록 함수입니다 
																			replyList();
																		
																			$(".btitleCollapse").val("");
																			$(".bcontentCollapse").val("");
																		console.log("success밑에");

																	}																	
																});
																
															}); */
														</script>												
														
													</form>																									
												</div>									
																																																					
															<!-- 댓글 출력  -->
									<section class="reply_ajax">
																		
									</section>
									<!-- <div class="reply_ajax" id="reply_ajax" > -->

									<!-- <button class='btn btn-default' id='popbutton'>모달출력버튼</button>
									<button id = popbutton name = 'popbutton' value=329>모달출력버튼3</button> -->
									<!-- 동기화식 댓글출력을 주석화 -->
										<%-- <c:forEach items="${productReply}" var="productReply" varStatus="status" >
											<div class="postRight">
												<!-- postContents-->
												<div class="postContents container photo_est_cont">
													<div class="profile">
														<p>
															<span class="gallery_lv">작성자 : ${productReply.m_id},${status.count}</span> 
															<a href="delete?p_number=${productReply.p_number}">게시물 삭제</a>
															<span class="date"> 작성날짜 : ${productReply.bdate}</span> 														
														</p>											
													</div>
		
													<div class="pContent">
														
														<div class="summary" style="cursor: pointer;">
															<div class="cArea">
																<div class="pContent_text">
																	<h3><div class="tit">${productReply.btitle}</div></h3><br/>
																	<span class="content-review">${productReply.bcontent}</span>
																</div>
																<div class="pContent_Img img3 photoReview">
																	<img class="musinsa-gallery-images"
																		src="//image.msscdn.net/data/estimate/1199146_0/gallery_5e439a2f82e05.jpg.list"
																		alt="BRENSON [패키지] Errday">
																</div>
																<div class="clear"></div>
															</div>
														</div>
														<!-- 상세보기 -->
														<div class="detail" style="display: none;"></div>
														<!-- //상세보기 -->
														<form role="form" method="post" autocomplete="off"
															id="form_${productReply.bid }">
															<input type="hidden" value="${productReply.p_number}"
																name="p_number"> <input type="hidden"
																value="${productReply.bid}" name="bid"> <input
																type="hidden" value="${status.count}"
																name="status_count">
															<p>
																"${productReply.bid}"
																<button onclick="modifyBoard('${productReply.bid}')">수정</button>
																<button onclick="deleteBoard('${productReply.bid}')">삭제</button>
																<a href="#" onclick="cmUpdateOpen(${productReply.bid})">[수정]</a><br>
																카운트${status.count},${productReply.bid}
															</p>
														</form>
												
													</div>
													<div class="clear20"></div>
													<!--comment-->
													<div class="comments-list">
														<a name="#comment_8243670"></a>
														<div class="comments comments-input" c_idx="8243670"
															est_type="photo" is_open="">
															<div class="comment_store cFormTriger ">
																<div class="comment_area"></div>
																<span class="comment_area_btn plain-btn btn active">댓글작성
																</span>
															</div>
														<tr class="qna_reply_area qa_c3" style="display:none;">
															<!--댓글작성-->
															<div class="cFormBox groupType-cForm cFormInput"></div>
															<!--//댓글작성-->
															<!--댓글-->
															<div class="comment-post comment_box" style="border: 0px"
																id="div_8243670" c_idx="8243670" c_type="goods_estimate">
															</div>
															<!--댓글-->
														</tr>
														</div>														
													</div>
													<!--//comment-->
												</div>
												<!--//postContents-->													
											</div>
											</c:forEach> --%>
										<!-- </div> -->
										
										<script>
										replyList();
										console.log("945replyList();")										
										</script>
											
											<!-- 댓글수정 버튼을 누르면 열리는 창 -->
											<%-- <div id="wrap">
												<br><b><font size="5" color="gray">댓글 답변</font></b>
												<hr size="1" width="550">
												<br>

												<div id="ReplyModifyForm">
													<form name="replyInfo" target="parentForm">
														<textarea rows="7" cols="70" name="comment_content"></textarea>
														<br>
														<br> <input type="button" value="등록" onclick="checkValue()"> 
															<input type="button" value="창닫기" onclick="window.close()">
															
													</form>
												</div>
											</div> --%>

										

										<%-- <form role = "form" method="post" autocomplete="off">
														<p>
														<button id="modity_btn">수정</button>
														<button id="delete_btn">삭제</button>
														</p>
													
														<input type="hidden" value="${productNum.p_number}" name="productNum.p_number">
														<c:forEach items="${productReply}" var="productReply" begin="0" end="0">
														<input type="hidden" value="${productNum.p_number}" name="p_number">
														<input type="hidden" value="${productReply.bid}" name="bid">
														</c:forEach>														
														<c:forEach items="${productDetail}" var="productDetail" begin="0" end="0">					
														${productDetail.p_name}
														"${boardNum.bid}"
														</c:forEach>
														"${boardVO.bid}"
														
														</form> --%>
													
													
											
											
									
<!-- ----------------------------------------구매감상 게시판 끝---------------------------------------------------------------------------- -->
										
										<%-- <form class="w-full">						
										<c:forEach items="${productReply}" var="productReply">
											<div class="container">
												<h2>간단한 콜랩스</h2>
												<button type="button" class="btn btn-info"
													data-toggle="collapse" data-target="#demo">
													번호 : ${productReply.bid}
													제목 : ${productReply.btitle}
													작성자 : ${productReply.m_id}													
													날짜 : ${productReply.bdate}
													<fmt:formatDate value="${productReply.bdate}"pattern="yyyy-MM-dd"></fmt:formatDate>		
													</button>
												<div id="demo" class="collapse in">
												${productReply.bcontent}
												</div>
											</div>
											</c:forEach>

											<div class="flex-w flex-m p-t-50 p-b-23">
												<span class="stext-102 cl3 m-r-16"> Your Rating<br />
													별. 추천수. 지울껀지 냅둘껀지. 기능은 안함.
												</span> <span class="wrap-rating fs-18 cl11 pointer"> <i
													class="item-rating pointer zmdi zmdi-star-outline"></i> <i
													class="item-rating pointer zmdi zmdi-star-outline"></i> <i
													class="item-rating pointer zmdi zmdi-star-outline"></i> <i
													class="item-rating pointer zmdi zmdi-star-outline"></i> <i
													class="item-rating pointer zmdi zmdi-star-outline"></i> <input
													class="dis-none" type="number" name="rating">
												</span>
											</div>

											<div class="row p-b-25">
												<div class="col-12 p-b-5">
													<label class="stext-102 cl3" for="review">Your
														review<br />제목
													</label>
													<textarea
														class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10"
														id="review" name="review"></textarea>
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="name">Name이름</label> <input
														class="size-111 bor8 stext-102 cl2 p-lr-20" id="name"
														type="text" name="name">
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="email">Email이메일</label> <input
														class="size-111 bor8 stext-102 cl2 p-lr-20" id="email"
														type="text" name="email">
												</div>
											</div>

											<button
												class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
												Submit제출</button>
										</form> --%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
			<span class="stext-107 cl6 p-lr-25"> 상품 짤막설명? </span> <span
				class="stext-107 cl6 p-lr-25"> Categories: Jacket, Men 카테고리나
				등등 </span>
		</div>
	</section>


	<!-- Related Products -->
	<section class="sec-relate-product bg0 p-t-45 p-b-105">
		<div class="container">
			<div class="p-b-45">
				<!-- <h3 class="ltext-106 cl5 txt-center">
					Related Products 관련상품 혹은 인기상품<br /> p_amount 높은순정렬했음.
				</h3> -->
			</div>

			<!-- Slide2 -->
			<div class="wrap-slick2">
				<div class="slick2">
					<c:forEach items="${productAmount}" var="productAmount">
						<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
							<!-- Block2 -->
							<div class="block2">
								<div class="block2-pic hov-img0">
									<img src="productimage/${productAmount.i_name}"
										alt="IMG-PRODUCT" width="300" height="300"> <%-- <a
										href="productDetail?p_number=${product.p_number}"
										class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
										Quick View </a> --%>
								</div>

								<div class="block2-txt flex-w flex-t p-t-14">
									<div class="block2-txt-child1 flex-col-l ">
										<a href="productDetail?p_number=${productAmount.p_number}"
											class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
											${productAmount.p_name} </a> <span class="stext-105 cl3">
											<fmt:formatNumber value="${productAmount.p_price}"
												pattern="###,###,###" />원
										</span>
									</div>

									<div class="block2-txt-child2 flex-r p-t-3">
										<a href="#"
											class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
											<img class="icon-heart1 dis-block trans-04"
											src="images/icons/icon-heart-01.png" alt="ICON"> <img
											class="icon-heart2 dis-block trans-04 ab-t-l"
											src="images/icons/icon-heart-02.png" alt="ICON">
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>

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
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- Modal1 -->
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
									<div class="item-slick3"
										data-thumb="images/product-detail-01.jpg">

										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-01.jpg" alt="IMG-PRODUCT">

											<a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-01.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3"
										data-thumb="images/product-detail-02.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-02.jpg" alt="IMG-PRODUCT">

											<a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-02.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3"
										data-thumb="images/product-detail-03.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-03.jpg" alt="IMG-PRODUCT">

											<a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-03.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">Lightweight
								Jacket</h4>

							<span class="mtext-106 cl2"> $58.79 </span>

							<p class="stext-102 cl3 p-t-23">Nulla eget sem vitae eros
								pharetra viverra. Nam vitae luctus ligula. Mauris consequat
								ornare feugiat.</p>

							<!--  -->
							<div class="p-t-33">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">Size</div>

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
									<div class="size-203 flex-c-m respon6">Color</div>

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
										
											<div class="size-203 flex-c-m respon6">Amount</div>
											<div
												class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product"
												type="number" name="num-product" value="1">

											<div
												class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>

										<button
											class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
											Add to cart</button>
									</div>
								</div>
							</div>

							<!-- 구매하기 밑 좋아요버튼들 -->
							<!-- <div class="flex-w flex-m p-l-100 p-t-40 respon7">
								<div class="flex-m bor9 p-r-10 m-r-11">
									<a href="#"
										class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
										data-tooltip="Add to Wishlist"> <i
										class="zmdi zmdi-favorite"></i>
									</a>
								</div>

								<a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
								</a>
							</div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<!--===============================================================================================-->
	
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
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
				delegate : 'a', // the selector for gallery item
				type : 'image',
				gallery : {
					enabled : true
				},
				mainClass : 'mfp-fade'
			});
		});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e) {
			e.preventDefault();
		});

		$('.js-addwish-b2').each(
				function() {
					var nameProduct = $(this).parent().parent().find(
							'.js-name-b2').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-b2');
						$(this).off('click');
					});
				});

		$('.js-addwish-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent().find(
							'.js-name-detail').html();

					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-detail');
						$(this).off('click');
					});
				});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent()
							.parent().find('.js-name-detail').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to cart !", "success");
					});
				});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
	

	 <%--   <!-- 모달 -->
	<div class="modal fade" id="modal">
		<div class="modal-dialog">
			<div class="modal-content" style="position:relative;width:800px; height:500px; right:150px;">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">수정</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
					<form id="modalForm" name="modalForm" action="modifyReply2" method="post">
						<input id="bidUpdate" type="hidden" name="bid">
						<input id="check" type="hidden" name="check" value="modal1">
						<input id="p_numberUpdate" type="hidden" name="p_number" value="${productNum.p_number}">
						<input type="hidden"name="btitle" id="btitleUpdate" size="50" style="border:1px solid gray" value="btitlehidden"><br>
						<textarea name="bcontent" id="bcontentImageUpdate" rows="10" cols="52" style="border:1px solid gray; resize:none;"></textarea>
						<div align="center">
						<input class="btn btn-secondary m-1" type="button" id = "modalSubmit" type="submit" data-dismiss="modal" value="입력">
						</div>
					</form>
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<!-- Footer -->
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button> -->

				</div>
			</div>
		</div>
	</div>
	 --%>
	<div class="modal fade" id="modal">
		<div class="modal-dialog">
			<div class="modal-content" style="position:relative;width:800px; height:500px; right:150px; margin:0px; padding:0px;">
				<!-- header -->
				<div class="modal-header">
					<!-- header title -->
					<h4 class="modal-title">수정</h4>
					<!-- 닫기(x) 버튼 -->
					<button type="button" id = "Xbutton" class="close" data-dismiss="modal">×</button>
				</div>
				<!-- body -->
				<div class="modal-body">
					<form id="modalForm" name="modalForm" action="modifyReply2" method="post">
						<input id="bidUpdate" type="hidden" name="bid">
						<input id="check" type="hidden" name="check" value="modal1">
						<input id="p_numberUpdate" type="hidden" name="p_number" value="${productNum.p_number}">
						<input type="hidden"name="btitle" id="btitleUpdate" size="50" style="border:1px solid gray" value="btitlehidden">
						<textarea name="bcontent" id="bcontentImageUpdate" rows="8" cols="52" style="border:1px solid gray; resize:none;"></textarea>
						<div align="center">
						<input class="btn btn-secondary m-1" type="button" id = "modalSubmit" type="submit" data-dismiss="modal" value="입력">
						</div>
					</form>
				</div>	
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="writeModal">
		<div class="modal-dialog">
			<div class="modal-content" style="position:relative;width:800px; height:500px; right:150px;">
				<!-- header -->
				<div class="modal-header">
					<!-- header title -->
					<h4 class="modal-title">작성</h4>
					<!-- 닫기(x) 버튼 -->
					<!-- <button type="button" id = "Xbutton" class="close" data-dismiss="modal">×</button> -->
				</div>
				<!-- body -->
				<div class="modal-body" >
					<form id="writeModalForm" name="writeModalForm" action="product_Write_reply" method="post">
						<input type="hidden" id="m_number" value="${principal_m_number}" name="m_number">
						<input type="hidden" id="m_id" value="${principal_m_id}" name="m_id" >
						<input id="p_number" type="hidden" name="p_number" value="${productNum.p_number}">
						<input type="hidden"name="btitle" id="btitleWrite" class="writeBtitle" size="50" style="border:1px solid gray" value="btitehidden">
						<textarea name="bcontent" id="bcontentImage" class="writeBcontent" rows="8" cols="52" style="border:1px solid gray;"></textarea>
						<div align="center">
						<input class="btn btn-secondary m-1" type="button" id = "modalWriteSubmit" name="modalWriteSubmit" type="submit" data-dismiss="modal" value=" 작성  ">
						</div>
					</form>
				</div>					
			</div>
				<!-- Footer -->
				<!-- <div class="modal-footer">
					
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>

				</div> -->
		</div>
	</div>

<!-- 글 작성시 이미지 삽입을 위한 CKEDITOR 스크립트 -->
	<script type="text/javascript">
		$(function(){
			CKEDITOR.replace('bcontentImage',{extraPlugins : 'confighelper',
				disallowedContent : 'img{width,height}',
				height:'270px',
				filebrowserUploadUrl: '${pageContext.request.contextPath}/mine/imageUpload.do?${_csrf.parameterName}=${_csrf.token}'
					
			});
		});
	</script>
<!-- 이미지를 포함한 글 수정을 위한 CKEDITOR 스크립트 -->
	<script type="text/javascript">
		$(function(){
			CKEDITOR.replace('bcontentImageUpdate',{extraPlugins : 'confighelper',
				height:'270px',
				filebrowserUploadUrl: '${pageContext.request.contextPath}/mine/imageUpload.do?${_csrf.parameterName}=${_csrf.token}'
					
			});
		});
	</script>
<!-- <script type="text/javascript">
		$(function(){
			CKEDITOR.replace('bcontentShow',{extraPlugins : 'confighelper',
				filebrowserUploadUrl: '${pageContext.request.contextPath}/mine/imageUpload.do?${_csrf.parameterName}=${_csrf.token}'
					
			});
		});
		
</script> -->

								<script>
									//수정modal창에서 수정확인 버튼을 눌럿을때,DB에서 값이 수정되고 난 후 화면(리스트)를 다시 갱신하는 스크립트.
									$(function(){
										$(document).on("click","#modalSubmit",function(){
											console.log("modalSubmit(수정) 스크립트 탔음.");
											var value = CKEDITOR.instances["bcontentImageUpdate"].getData();
											
											var data = {
													bid : $("#bidUpdate").attr("value"),
													p_number : $("#p_numberUpdate").attr("value"),
													btitle : $("#btitleUpdate").attr("value"),
													bcontent : value
												};
											console.log(data);
											
											$.ajax({
												method:"get",
												url:"/ssmall/modifyReply2",
												data:data,
												error:function(xhr,status,error){
													alert("에러");
												},
												success:function(){
													replyList();
													CKEDITOR.instances["bcontentImageUpdate"].setData("");
												},
											});												
											})
										})
										
										//X버튼 누르면(글쓰기 취소하면) 취소 전에 적었던 글자들 사라짐.초기화.
										$(function(){
										$(document).on("click","#Xbutton",function(){
											CKEDITOR.instances["bcontentImage"].setData("");
										})
										})
										
										//글쓰기 모달버전
										$(function(){
										$(document).on("click","#modalWriteSubmit",function(){
											console.log("modalWriteSubmit 스크립트 탔음.");
											var value = CKEDITOR.instances["bcontentImage"].getData();
											alert(value);
											/* alert("확인"); */
											/* var queryString = $("form[name=writeModalForm]").serialize();
											console.log(queryString); */
											
											var data = {
													m_number : $("#m_number").attr("value"),
													m_id : $("#m_id").attr("value"),
													p_number : $("#p_number").attr("value"),
													btitle : $("#btitleWrite").attr("value"),
													bcontent : value
												};
											
											$.ajax({
												method:"get",
												url:"/ssmall/product_Write_reply",
												/* data:queryString, */
												data:data,
												error:function(xhr,status,error){
													alert("에러");
												},
												success:function(){
													replyList();
													CKEDITOR.instances["bcontentImage"].setData("");
													/* $("#bcontentImage").val("");
													$(".writeBtitle").val("");
													$(".writeBcontent").val(""); */
													
												},
											});												
											})
										})
										
										

										/* $(function(){
											$(document).on("click","#modifyBoard",function(){ */
												/* alert($(this).attr("value"));
												console.log("수정위"); */												
												/* var form = $('#form_' + $(this).attr("value"));
												//var form = $("form[role='form']");
												form.attr("action",
														"/ssmall/Child");
												form.attr("method","get");												
												form.submit(); */											
												/* var form = $("form[role='form']"); */
												/* window.name = "parentForm";												
												openWin = window.open("Child",
									                    "childForm", "width=570, height=350, resizable = no, scrollbars = no"); */
												/* $(opener.document).find("childBid").val($(this).attr("value"));
												openWin.document.getElementById("childBid").value = $(this).attr("value"); */
												/* console.log("modifyBoard탐"); */																								
												//$("#modifyBoard").submit();											
											/* })
										}) */
																																																	
										/* $(function(){
											$(document).on("click","#deleteBoard",function(){
												alert($(this).attr("value"));
												console.log("!아래");												
												var form = $('#form_' + $(this).attr("value"));
												form.attr("action",
														"/ssmall/deleteReply");
												form.attr("method", "get");
												form.submit();
												console.log("삭제아래");	
												alert($(this).attr("value"));
											})
										}) */
										
										/* $(document).on("click", "#deleteBoard", function(){
											  alert($(this).attr("value"));
											var result = confirm("삭제하시겠습니까?");
											if(result){
												var m_number = $("#m_number").val();
												  console.log("m_number : "+m_number);
												  console.log("딜리트보드 밑 m_number 옮기기");
												  var data = {
														  bid : $(this).attr("value"),
														  m_number : m_number											  
												  };											  											  
												  $.ajax({
												   url : "/ssmall/deleteReply",
												   type : "get",
												   data : data,
												   success : function(result){
													 if(result == 1){
														 console.log("result=1. 삭제완료 후 갱신");
													     replyList();
													 }
													 else{
														 console.log("result=0. 삭제 실패");
														 alert("작성자만 가능합니다.");
													     replyList();
													 }
												   }
												  });
												}else{
												    alert("취소");
												}

											 }); */
										
											 
											 $("#btn_collapse_notLogin").click(function(){
													console.log("btn_collapse_notLogin 버튼이벤트 탐");
													Swal.fire({
														title:'글쓰기',
														text:'로그인 후 이용 가능합니다.',
														type:'warning',
														showCancelButton: true,
														confirmButtonColor:'#3085d6',
														cancelButtonColor:'#d33',
														confirmButtonText:'Login'
													}).then((result)=>{
														if(result.value){
															location.href="productDetailLogin?p_number=${productNum.p_number}";
														}
													})
													/* location.href="productDetailLogin?p_number=${productNum.p_number}"; */
												})
												
												/* $("#writeModalBtn").click(function(){
													$('#writeModal').modal();																
												}) */	 
											 
											 
										$(document).on("click", "#deleteBoard", function(){
											  /* alert($(this).attr("value")); */
											Swal.fire({
												title:'글 삭제',
												text:'글을 지우시겠습니까?',
												type:'warning',
												showCancelButton: true,
												confirmButtonColor:'#3085d6',
												cancelButtonColor:'#d33',
												confirmButtonText:'OK'
											}).then((result)=>{
												if(result.value){
													var m_number = $("#m_number").val();
													  console.log("m_number : "+m_number);
													  console.log("딜리트보드 밑 m_number 옮기기");
													  var data = {
															  bid : $(this).attr("value"),
															  m_number : m_number											  
													  };											  											  
													  $.ajax({
													   url : "/ssmall/deleteReply",
													   type : "get",
													   data : data,
													   success : function(result){
														 if(result == 1){
															 console.log("result=1. 삭제완료 후 갱신");
															 Swal.fire('글 삭제','삭제되었습니다','success');
														     replyList();
														 }
														 else{
															 console.log("result=0. 삭제 실패");
															 Swal.fire('글 삭제','작성자만 가능합니다','error');
														     replyList();
														 }
													   }
													  });
												}
											}) 
										})
										
											$(function(){
											    $(document).on("click","#modify",function(){
											    	var bid = $(this).attr("value");
											    	var data = {
											    			bid : bid											    			
											    	};											    		
													$.ajax({
														url:"/ssmall/checkUser",
														type:"get",
														data:data,
														success:function(result){
															if(result == 1){
																/* alert("유저인증 확인"); */
																console.log("모달스크립트");
														    	/* alert(data.bid); */
														        $('#modal').modal();
														    	$('#bidUpdate').val(data.bid);	
															}
															else{
																Swal.fire('글 수정','작성자만 가능합니다','error');
															}
														}
														
													})											    											    											    	
											    })
											})
											
											$(function(){
											    $(document).on("click","#write",function(){
											    	$('#writeModal').modal();											    	
											    												    											    											    											    	
											    })
											})
											//신고하기 버튼 누를 시 글의 btotalrepot 이 1 증가함.
											$(function(){
											    $(document).on("click","#report",function(){
											    	var bid = $(this).attr("value");
											    	var data = {
											    			bid : bid											    			
											    	};
													$.ajax({
														url:"/ssmall/report",
														type:"get",
														data:data,
														success:function(result){
															if(result==0){
																alert("신고하였습니다.");
																console.log("컨트롤러 report 탄 후 글목록 재구축");
																replyList();
															}
															else if(result==1){
																alert("중복신고 입니다.");
																replyList();
															}
															else if(result==2){
																alert("자신의 글은 신고할 수 없습니다.");
																replyList();
															}
															else if(result==3){
																alert("이미 삭제처리된 댓글입니다.");
																replyList();
															}
														},
														error:function(xhr,status,error){
															alert("에러");
														},
														
													})											    											    											    	
											    })
											})
											
											$(function(){
											    $(document).on("click","#reply_reply",function(){
											    	var bid = $(this).attr("value");
											    	console.log(bid);
											    	var bstep = $('#bstep_'+bid).attr("value");
											    	console.log(bstep);
											    	var bindent = $('#bindent_'+bid).attr("value");
											    	console.log(bindent);
											    	/* var form = $('#form_' + bid); 예시*/
											    	/* var bstep = $('#bstep').attr("value");값은 나오는데 항상 최신값 */											    	
											    	var data = {
											    			bid : bid,
											    			bstep : bstep,
											    			bindent : bindent
											    			
											    	};											    		
													$.ajax({
														url:"/ssmall/product_Write_reply_replyCheckAjax",
														type:"get",
														data:data,
														success:function(result){
															if(result == 1){
																/* alert("대댓글 유저인증 확인"); */
																console.log("모달스크립트");
														    	/* alert(data.bid); */
														        $('#replyReply').modal();
														    	$('#bid2').val(data.bid);
														    	$('#bstep2').val(data.bstep);
														    	$('#bindent2').val(data.bindent);
															}
															else{
																alert("작성자만 가능합니다.");
															}
														}
														
													})											    											    											    	
											    })
											})
											
											/*$(function(){
											    $(document).on("click","#modify",function(){
													
											    	console.log("모달스크립트");
											    	alert($(this).attr("value"));
											        $('div.modal').modal();
											        
											        var bid = $(this).attr("value");
											    	$('#bid').val(bid);
											    	alert(bid);											    
											    	var p_number = ${productNum.p_number};
											    	$('#p_number').val(p_number);
											    	alert(p_number); 
											    	
											    })
											})*/
											
											/* $(function(){
											    $(document).on("click","#modalSubmit",function(seq){
											    	console.log("offset 타나?111111111111111111111111111111111111111111111111111111111111111111111111111111111111111");
											        var offset = $("#offset" + seq).offset();
											        $('html, body').animate({scrollTop : offset.top}, 1);
											    })
											}) */
										
											/* //수정
											function modifyBoard(bid) {
												var form = $('#form_' + bid);
												form.attr("action",
														"/ssmall/modifyReply");
												form.attr("method", "get");
												form.submit();
											}

											//삭제											
	
											/* function deleteBoard(bid){
												var form = $('#form_' + bid);
												form.attr("action",
														"/ssmall/deleteReply");
												form.attr("method", "get");
												form.submit();
											} 
											
											function cmUpdateOpen(bid){
									            window.name = "parentForm";
									            window.open("CommentUpdateForm.co?num="+bid,
									                        "updateForm", "width=570, height=350, resizable = no, scrollbars = no");
									        }
											
											$(function(){
											$("#check").on("click",function(){
												alert("이벤트체크");
											});
											
											});
											
											var win = window.open("", "PopupWin", "width=500,height=600");

											win.document.write("<p>새창에 표시될 내용 입니다.</p>");
 											*/
											
										</script>
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
	
	/* $("#btn_collapse_notLogin").click(function(){
		console.log("btn_collapse_notLogin 버튼이벤트 탐");
		alert("로그인 후 이용 가능합니다");																
		location.href="productDetailLogin?p_number=${productNum.p_number}";
	}) */

	$("#reply_btn1").click(function(){
		console.log("구매소감Ajax");
		var formObj = $("#demo form[role='form']");
		console.log("구매소감Ajax1");
		var p_number = $("#p_number").val();
		console.log("구매소감Ajax2");
		var m_number = $("#m_number").val();
		console.log("구매소감Ajax3");
		var m_id = $("#m_id").val();
		console.log("구매소감Ajax4");
		var bcontent = $("#bcontent1").val();
		console.log("구매소감Ajax5");
		var btitle = $("#btitle1").val();
		console.log("m_number넘김");
		var m_number = $("#m_number").val();
		console.log("구매소감Ajax data위");
		var data = {
				p_number : p_number,
				m_number : m_number,
				m_id : m_id,
				bcontent : bcontent,
				btitle : btitle,
				m_number : m_number
				};
		console.log("구매소감Ajax $.ajax 위");
			
		$.ajax({
			url : '/ssmall/product_Write_reply',																	
			method : 'get',
			data : data,
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },																	
			success : function(){
				console.log("구매소감Ajax $.ajax 위2");	
				/* 글목록 함수입니다 */
					replyList();
				
					$("#btitle1").val("");
					$("#bcontent1").val("");
				console.log("success밑에");

			}																	
		});
		
	});
	//productDetail에서 물품 구매 수량을 바꿧을때 가격이 바로바로 바뀌는 부분
	
	$(document).ready(function(){
	
	function numberWithCommas(x) {
		console.log("numberWithCommas");    
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	/* $("#b_amount").on("propertychange change keyup paste input", function() { */
	/* $("#b_amount").on("change",function() { */
	$("#plus").on("click",function(){
	
		console.log("버튼");
		var amount = $("#b_amount").val();
		var price = null;
		
		price = ${productNum.p_price} * amount;
		
		document.getElementById("finalPrice").value = numberWithCommas(price);
		
     });
	
	$("#minus").on("click",function(){
		
		console.log("버튼");
		var amount = $("#b_amount").val();
		var price = null;
		
		price = ${productNum.p_price} * amount;
		
		document.getElementById("finalPrice").value = numberWithCommas(price);
		
     });	
	
	/* 상품개수가 0인 상태로 장바구니 클릭시 카트로 넘어가서 0으로 나오는걸 막는 코드 */
		$(document).on("click","#cart",function(){
			console.log("장바구니 버튼 클릭함");
			var b_amount=$("#b_amount").val();
			if(b_amount==0){
				Swal.fire('장바구니','구매수량을 입력해 주세요','error');
			}else if(b_amount!=0){
				var form = $('#buyForm');
				console.log(form);
				//var form = $("form[role='form']");
				form.attr("action",
						"/ssmall/cart/addCart");
				form.attr("method","get");												
				form.submit();
			}
			
		});
		/* 상품개수가 0인 상태로 구매 클릭시 0으로 나오는걸 막는 코드 */
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
			
		});
	})
		
</script>

</body>
</html>