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
      <a href="/ssmall/cartView" style="color:white">장바구니</a>
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
                  <b>▶나의 구매 내역</b>
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
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50" style=" bottom: 70px; right: 50px;">
					<div class="m-l-25 m-r--38 m-lr-0-xl" style=" width: 1000px;">
						<div class="wrap-table-shopping-cart">
						<c:set var="hap" value="0"/>
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">상품명</th>
									<th class="column-2"></th>
									<th class="column-3">상품가격</th>
									<th class="column-4">구매수량</th>
									<th class="column-5">총구매가격</th>
									<th class="column-6" style="padding-left:50px">구매일자</th>
								</tr>		
								<c:forEach items="${p_b_vos}" var="p_b_vo">
								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="productimage/<c:out value = "${p_b_vo.p_image}"/>" alt="IMG">
										</div>
									</td>
									<td class="column-2"><c:out value = "${p_b_vo.p_name}"/></td>
									<td class="column-3"><fmt:formatNumber value="${p_b_vo.p_price}" pattern="#,###" />원</td>
									<td class="column-4">총 <c:out value = "${p_b_vo.b_amount}"/>개</td>
									<td class="column-5"><fmt:formatNumber value="${p_b_vo.b_amount*p_b_vo.p_price}" pattern="#,###" />원</td>
									<c:set var="hap" value="${hap+p_b_vo.p_price*p_b_vo.b_amount}"/>
									<td class="column-6" style="padding-left:40px"><c:out value = "${p_b_vo.b_date}"/></td>
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
							<font size="5em">회원님의 누적 구매금액</font>
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
									<br/>
								</span>
							</div>
							
							<c:if test="${hap == 0}"><font size="5em" color="black">아직 구매내역이 없습니다.</font></c:if>
						</div>
					</div>
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm" style="width: 390px;">
						<h4 class="mtext-109 cl2 p-b-30">
							<font size="5em">회원님의 사용가능 포인트</font>
						</h4>
						<div class="flex-w flex-t p-t-27 p-b-33" style="width: 330px;">
							<div class="size-208" style=" width: 90px;">
								<span class="mtext-101 cl2">
									<font size="6em">Point:</font>
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2">
									<font size="6em"><fmt:formatNumber value="${m_point}" pattern="#,###" />원</font>
									<br/>
								</span>
							</div>
							
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
