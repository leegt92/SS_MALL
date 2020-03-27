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
	
	<script src="/ssmall/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script>
	
	$(document).ready(function(){
		
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		$('#pointUse').on('click', function(){
			console.log('클릭이벤트 발생');	
			var usePoint = null;
			if( ${totalprice * 0.01} < ${member.m_point}){
				 //포인트 입력하는곳  상품금액의 1퍼센트 이상보다 더많은 포인트가 존재한다면  상품금액의 1퍼센트의 포인트가 들어가도록한다.
				usePoint = ${totalprice * 0.01};
				document.getElementById("point").value = usePoint;
			}else{
				//아니면 적거나 같은거니까 m_point다사용
				usePoint = ${member.m_point};
				document.getElementById("point").value = usePoint;
			}
	
			var price = ${totalprice} - usePoint;			

			document.getElementById("result").value = numberWithCommas(price); //최종가격
			document.getElementById("usingPoint").value = usePoint; //컨트롤러에 넘어가는 사용포인트
		});
		
		$("#point").on("propertychange change keyup paste input", function() {
 			
			var regexp = /^[0-9]*$/
			var usePoint = $(this).val();
			var price = null;
			if( !regexp.test(usePoint) ) {

				document.getElementById("point").value = null;
				document.getElementById("result").value = null;					
				
				return false;
			}
			
			
			console.log(usePoint);
			if(usePoint > ${member.m_point} && usePoint > ${totalprice * 0.01}){	
				alert('사용가능한 포인트보다 많음');
				price = ${totalprice} - ${totalprice * 0.01};
				document.getElementById("point").value = ${totalprice * 0.01};
				document.getElementById("result").value = numberWithCommas(price);
				return false;
			
			}else if (usePoint > ${member.m_point}){
				alert('보유한 포인트보다 많음');
				price = ${totalprice} - ${member.m_point};
				
				document.getElementById("point").value = ${member.m_point};	
				document.getElementById("result").value = numberWithCommas(price);
				return false;
			
			}else if(usePoint > ${totalprice * 0.01}){
				alert('사용가능한 포인트보다 많음');
				price = ${totalprice} - ${totalprice * 0.01};
				document.getElementById("point").value = ${totalprice * 0.01};
				document.getElementById("result").value = numberWithCommas(price);
				return false;
			}
				
			price = ${totalprice} - usePoint;
			
			
			document.getElementById("result").value = numberWithCommas(price);
			
			document.getElementById("usingPoint").value = usePoint;
			
         });
		
		$('#receiver').focus(function(){
			var point = $('#point').val()
			console.log(point);
			if (point > 0 && point < 1000){
				alert("포인트는 1000원이상부터 사용가능합니다.")
				$('#receiver').blur();
				document.getElementById("point").value = null;
				document.getElementById("result").value = null;	
				$('#point').focus();
				return;
			}
		})

		
	});
	</script>

<!--===============================================================================================-->			  
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script>
		function execPostCode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}
	
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					console.log(data.zonecode);
					console.log(fullRoadAddr);
	
					$("[name=addr1]").val(data.zonecode);
					$("[name=addr2]").val(fullRoadAddr);
	
					/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
					document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
				}
			}).open();
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
						<a href="/ssmall/homeview" class="flex-c-m trans-04 p-lr-25">
							Home
						</a>
						
						<a href="/ssmall/mypage/myPage_orderedList" class="flex-c-m trans-04 p-lr-25">
							My
						</a>
						
						<a href="/ssmall/cart/cartView" class="flex-c-m trans-04 p-lr-25">
							Cart
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
					<a href="/ssmall/homeview">홈</a>
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
				메인
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="/ssmall/productView" class="stext-109 cl8 hov-cl1 trans-04">
				상품
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="/ssmall/productDetail?p_number=${productImageVO.p_number}" class="stext-109 cl4">
				${productImageVO.p_brand} ${productImageVO.p_name} 
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
					<h4>구매할 상품</h4>
					<br>
						<table class="table table-list-search">
							<tr>
								<th></th>
								<th style="text-align: center; vertical-align: middle;">상품명</th>
								<th style="text-align: center; vertical-align: middle;">구매수량</th>
								<th style="text-align: center; vertical-align: middle;">구매가격</th>
							</tr>

							<tr>
								<td style="text-align: center; vertical-align: middle;">
									<a href="/ssmall/productDetail?p_number=${productImageVO.p_number}"> 
									<img src="/ssmall/productimage/${productImageVO.i_name}" alt="IMG" width="100px" height="auto">
									</a>
								</td>
								<td style="text-align: center; vertical-align: middle;">${productImageVO.p_brand} ${productImageVO.p_name}</td>
								<td style="text-align: center; vertical-align: middle;">${amount}</td>
								<td style="text-align: center; vertical-align: middle;"><fmt:formatNumber value="${totalprice}" pattern="###,###,###" />원</td>							
							</tr>							
						</table>
					</div>
				</div>
			</div>
			<br>
			<hr>
			
			<!-- 포인트 사용여부 -->
			<div class="tab-content p-t-43">
				<!-- 무신사는 7%까지 적립가능 -->
				<div class="tab-pane fade show active" id="description" role="tabpanel">
					<div class="how-pos2 p-lr-15-md">
					<h4>포인트 사용여부</h4>
					<br>
						<div>
						<form id="pointForm">			
							<span class="label-input100">포인트</span><br>
							<input id="point" class="form-control" style="width: 20%; display: inline" name="point" type="text" />							
							<input id="pointUse" type="button" class="btn btn-primary" value="전체사용" />
							<span class="label-input100">현재 포인트 : <fmt:formatNumber value="${member.m_point}" pattern="###,###,###" /></span>
							<span class="label-input100">사용가능 포인트 : <fmt:formatNumber value="${totalprice * 0.01}" pattern="###,###,###" /></span>
							<br><br>
							<span class="label-input100">최종가격</span>
							<input id="result" type="text" class="form-control" style="width: 20%;" value="">
						</form>
						</div>	
					</div>
				</div>
			</div>
			<br>
			<hr>
			
			<!-- 수령자 설정 -->
			<form:form role="form" commandName="payVO" action="/ssmall/buy/buyDo">	
			<input id="usingPoint" type="hidden" name="usingPoint" value="0">
			<div class="tab-content p-t-43">		
				<div class="tab-pane fade show active" id="description"
					role="tabpanel">
					<div class="how-pos2 p-lr-15-md">
					<h4>수령자 정보</h4>
					<br>		
						<div class="wrap-input100 validate-input m-b-23">
							<table class="table table-list-search">
								<tr>
									<td>
										<span class="label-input100">수령인</span>
										<form:input id="receiver" class="form-control" style="width: 40%;" 
											name="name" type="text" placeholder="수령인" path="name"></form:input>
										<form:errors path="name" cssStyle="color:red;"/> 
									</td>
								</tr>
								
								<tr>
									<td>
										<span class="label-input100">전화번호</span><br>
										<form:input class="form-control" style="width: 40%;"
											name="phonenum" type="text" placeholder="전화번호 -없이 입력해주세요" path="phonenum"></form:input>
										<form:errors path="phonenum" cssStyle="color:red;"/>
									</td>
								</tr>
								
								<tr>
									<td>
									
										<span class="label-input100">배송지</span><br>
										<input class="form-control" style="width: 40%; display: inline;"
											placeholder="우편번호" name="addr1" id="addr1" type="text"
											readonly="readonly">
										<button type="button" class="btn btn-default"
												onclick="execPostCode();">
											<i class="fa fa-search"></i> 우편번호 찾기
										</button>								
									</td>
								</tr>
								
								<tr>
									<td>
										<div class="form-group">
											<input class="form-control" style="width: 70%;" placeholder="도로명 주소"
												name="addr2" id="addr2" type="text" readonly="readonly" />
										</div>
									</td>
								</tr>
								
								<tr>
									<td>
										<div class="form-group">
											<input class="form-control" style="width: 70%;" placeholder="상세주소" name="addr3"
												id="addr3" type="text" />
										</div>
									</td>
								</tr>
								
								<tr>
									<td>
										<span class="label-input100">배송메모</span><br>
										<input class="form-control" style="width: 70%;"
											name="memo" type="text" placeholder="배송 메모를 입력해주세요">								
									</td>
								</tr>
							</table>
						</div>			
					</div>
				</div>
				
			</div>
			
			
			<div class="tab-content p-t-43">
			
				<div class="how-pos2 p-lr-15-md">
		       		<button type="submit" class="btn btn-secondary">구매하기</button>
		            <button type="reset" class="btn btn-secondary">취소하기</button>
				</div>				
			</div>
			
			</form:form>		
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
							<a href="/ssmall/productView" class="stext-130 cl7 hov-cl1 trans-04">
								Watch
							</a>
						</li>

						<li class="p-b-10">
							<a href="/ssmall/productView" class="stext-130 cl7 hov-cl1 trans-04">
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




<!--===============================================================================================-->
	<script src="/ssmall/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/ssmall/vendor/bootstrap/js/popper.js"></script>
	<script src="/ssmall/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->	

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