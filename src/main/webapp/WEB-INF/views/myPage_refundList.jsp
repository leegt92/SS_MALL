<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<c:choose>
	<c:when test="${success eq 'success'}">
		<script>
			alert('주문 취소가 완료되었습니다.');
		</script>
		<% 
			session.removeAttribute("success");
			
		%>
	</c:when>
</c:choose>

<style>
<style>
.bg-light {
	background-color: rgba(149, 204, 210, 0.2)!important;
}
 ul li {
		border-bottom: 1px solid #bebebe;
}
.table-shopping-cart2 {
 	border-collapse: collapse;
  	width: 100%;
  	min-width: 680px;
}
.table-shopping-cart2 tr {
  border-top: 1px solid #e6e6e6;
  border-bottom: 1px solid #e6e6e6;
}

.table-shopping-cart2 .column-1 {
  width: 50px;
  padding-left: 50px;
}

.table-shopping-cart2 .column-2 {
  width: 130px;
  font-size: 15px;
}

.table-shopping-cart2 .column-3 {
  width: 110px;
  font-size: 16px;
}

.table-shopping-cart2 .column-4 {
  width: 100px;
  text-align: right;
}

.table-shopping-cart2 .column-5 {
  width: 200px;
  padding-right: 50px;
  text-align: right;
  font-size: 16px;
}

.table-shopping-cart2 .table_row {
  height: 185px;
}

.table-shopping-cart2 .table_row td {
  padding-bottom: 20px;
}

.table-shopping-cart2 .table_row td.column-1 {
  padding-bottom: 30px;
}

.table-shopping-cart2 .table_head th {
  font-family: Poppins-Bold;
  font-size: 13px;
  color: #555;
  text-transform: uppercase;
  line-height: 1.6;
  padding-top: 15px;
  padding-bottom: 15px;
}

.table-shopping-cart2 td {
  font-family: Poppins-Regular;
  color: #555;
  line-height: 1.6;
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
      <a href="/ssmall/cartView" style="color:white">장바구니</a>
      <a href="/ssmall/notice" style="color:white">공지사항</a>
      <a href="/ssmall/companyView" style="color:white">회사소개</a>
      <a href="/ssmall/asView" style="color:white">AS</a>
     
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
                </a> 
              </li>-->
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
                <a class="nav-link" href="/ssmall/myPage_refundList">
                  <span data-feather="shopping-cart"></span>
                  <b>▶나의 환불 내역</b>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/myPage_askRequestView">
                  <span data-feather="users"></span>
                  <b>1:1 문의</b>
                </a>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="/ssmall/myPage_aSRequestView">
                  <span data-feather="layers"></span>
                  <b>A/S 서비스 신청</b>
                </a>
              </li>
            </ul>
          </div>
        </nav>
		
		<!-- Shoping Cart -->
		<form class="bg0 p-t-140 p-b-85 m-l-130 p-l-300 m-t-20">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50" style="
				bottom: 70px;
				right: 50px;
				">
					<div class="m-l-25 m-r--38 m-lr-0-xl" style="
					width: 1000px;
					">
						<div class="wrap-table-shopping-cart">
						<c:set var="hap" value="0"/>
							<table class="table-shopping-cart2">
								<tr class="table_head">
									<th style="text-align: center;"></th>
									<th style="text-align: center;">상품명</th>
									<th style="text-align: center;">수량</th>
									<th style="text-align: center;">가격</th>
									<th style="text-align: center;">환불일자</th>
									<th style="text-align: center;">환불상태</th>
								</tr>		
								<c:forEach items="${refund}"  var="refund">
								<c:set var="hap" value="${hap+refund.r_price}"/>
								<tr class="table_row">
								
									<td class="column-1" onclick="location.href='/ssmall/productDetail?p_number=${refund.p_number}'">
										<div class="how-itemcart1">										
											<img src="productimage/${refund.p_image}" alt="IMG">							
										</div>
									</td>
									<td style="text-align: center;">${refund.p_name}</td>
									<td style="text-align: center;">${refund.r_amount}개</td>				
									<td style="text-align: center;"><fmt:formatNumber value="${refund.r_price}" pattern="###,###,###" />원</td>								
									<td style="text-align: center;">${refund.r_date}</td>								
									<td style="text-align: center;">${refund.r_status}</td>	
								</tr>
								</c:forEach>
								
							</table>
						</div>

						
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50" style =
					"height: 900px;
					width: 130px;
					padding-left: 15px;
					left: 250px;
					bottom:70px;
					">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm" style="width: 390px;">
						<h4 class="mtext-109 cl2 p-b-30">
							<font size="5em">회원님의 총 환불금액</font>
						</h4>
						<div class="flex-w flex-t p-t-27 p-b-33" style="width: 330px;">
							<div class="size-208" style=" width: 90px;">
								<span class="mtext-101 cl2">
									<font size="6em">Total:</font>
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2">
									<font size="6em"><fmt:formatNumber value="${hap}" pattern="#,###" />원</font>
								</span>
							</div>
							<c:if test="${hap == 0}"><font size="5em" color="black">최근 주문내역이 없습니다.</font></c:if>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		</form>
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

  
  </body>
</html>
