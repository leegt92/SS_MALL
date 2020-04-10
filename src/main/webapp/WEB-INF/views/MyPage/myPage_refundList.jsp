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
    <link href="/ssmall/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/ssmall/css/dashboard.css" rel="stylesheet"> 
    
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

.bg-light {
	background-color: rgba(149, 204, 210, 0.2)!important;
}
 ul li {
		border-bottom: 1px solid #bebebe;
}
/* .table-shopping-cart2 {
 	border-collapse: collapse;
  	width: 100%;
  	min-width: 680px;
} */
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



.table1{
	width:130%;
}

table {
  border: 1px solid #ccc;
  border-collapse: collapse; /* 표(table)의 테두리와 셀(td)의 테두리 사이의 간격을 없앱니다. 겹치는 부분은 한 줄로 나타냅니다.  */
  margin: 0; /* 보드 바깥쪽 여백 */
  padding: 0;/* 보드 안쪽여백  */
  width: 100%; /* 부모요소 크기의 기준으로 퍼센트를 준다  */
  table-layout: fixed;/* 어떤 상황에서도 테이블의 크기를 고정시킬때 사용함 */
  line-height: 1.25;/* 줄높이를 정한다.  */
 
}

/* table tr {

  border: 1px solid #ddd;
  padding: .35em;
}

table th,
table td {
  padding: .625em;
  text-align: center;
}

table th {
  font-size: .85em;
  letter-spacing: .1em;
 
}
 */
@media screen and (max-width: 680px) { 
/* 미디어 쿼리는 선택사항인 미디어 유형과, 자유로운수의 미디어 특성표현식
      연산자를 통해 다양한 방법으로 서로 결합 
   all연산자:모든 장치에 적합하다
   and연산자:여러 미디어특징들을 하나로 결합한다
   print:인쇄 결과물 및 출력 미리보기 화면에 표시 중인 문서
   speech:음성 합성장치 대상. 
     여기서 사용한것은 화면이 줄었을때를 기준으로 사용한것 */
  table {
    border: 0;
 }
  table thead {
    border: none;
    clip: rect(0 0 0 0);/* 요소의 특정 부분만 보여지게함,rect가 받는 인자는 마스킹되는 영역을 정의하는 것으로 (top, right, bottom, left)로 정의된다.  */
    height: 1px;
    margin: -1px;/*마진에서 마이너스(-) 요소위에 다른 요소를 겹치게한다  */
    overflow: hidden;
    padding: 0;
    position: absolute;/* static속성을 가지지 않은 부모를 위주로 움직임 아무것도없을때는 가장 오른쪽에붙음 */
    width: 1px;
  }
  
  table tr {
  	font-size: 1.2em;
    border-bottom: 3px solid #ddd; 
    display: block;
  
  }
  
  table td {
  	border-bottom: 1px solid #ddd; 
    display: block;
    font-size: 0.8em;
    text-align: left;
    
  }
  
  table td::before {/* ::before:가상선택자 요소의 시작부분에 콘텐트를 추가시킴
  					  	*중요* : 가상 선택자는 반드시 content와 같이 써줘야한다. */
    /*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
    
    /* 콘텐트 속성은 css 내용을 생성하는 역할을 한다.  */
    /* attr: 선택자의 속성을 생성한다. */
    /* data-laber="이름" 주게되면 화면상에 그이름이 나오게된다  */
    content: attr(data-label);
  	float: left;/*css정렬속성 이미지나 텍스트를 정렬 할 때 사용함  */
    font-weight: bold;
    
  }
  
   table td:last-child {
    border-bottom: 0;
  } 
}
 




	

</style>
  </head>

  <body>
  
     <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
      <a href="/ssmall/" class="logo"><img src="/ssmall/images/icons/mainlogo.png" alt="IMG-LOGO" style="
    width: 200px;
    height: 60px;
 	"></a>
      <a href="/ssmall/" style="color:white">홈</a>
      <a href="/ssmall/productView" style="color:white">상품</a>
      <a href="/ssmall/cart/cartView" style="color:white">장바구니</a>
      <a href="/ssmall/boardnoticeView" style="color:white">공지사항</a>
      <a href="/ssmall/companyView" style="color:white">회사소개</a>
      <a href="/ssmall/asView" style="color:white">AS</a>
     
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
          	<h3><a href="/ssmall/mypage/myPage" style="color:black">MyPage</a></h3>
            <ul class="nav flex-column">
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
                  <b>▶나의 환불 내역</b>
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

				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50" style="bottom: 70px; left:50px;">
					<div class="m-l-25 m-r--38 m-lr-0-xl" >
						<div class="table1"class="wrap-table-shopping-cart"  >
						  <c:set var="hap" value="0"/>
							<table class="table-shopping-cart2" >
							<%--  <colgroup> 
									<col width="20%"/>
									<col width="20%"/>
									<col width="20%"/>
									<col width="20%"/>
									<col width="20%"/>
									<col width="20%"/>  
								</colgroup>   --%>
								<thead>
									<tr class="table_head">
										<th scope="col" style="text-align: center;"></th>
										<th scope="col" style="text-align: center;">상품명</th>
										<th scope="col" style="text-align: center;">수량</th>
										<th scope="col" style="text-align: center;">가격</th>
										<th scope="col" style="text-align: center;">환불일자</th>
										<th scope="col" style="text-align: center;">환불상태</th>
									</tr>	
								</thead>	
								<tbody>
									<c:forEach items="${refund}"  var="refund">
									<c:set var="hap" value="${hap+refund.r_price}"/>
									
										<tr >
										
											<td data-label=""  onclick="location.href='/ssmall/productDetail?p_number=${refund.p_number}'">
												<div class="how-itemcart1">										
													<img src="productimage/${refund.p_image}" alt="IMG">							
												</div>
											</td>
											<td data-label="상품명"style="text-align: center;">${refund.p_name}</td>
											<td data-label="수량"style="text-align: center;">${refund.r_amount}개</td>				
											<td data-label="가격"style="text-align: center;"><fmt:formatNumber value="${refund.r_price}" pattern="###,###,###" />원</td>								
											<td data-label="환불일자"style="text-align: center;">${refund.r_date}</td>								
											<td data-label="환불상태"style="text-align: center;">${refund.r_status}</td>	
										</tr>
									
									</c:forEach>
								</tbody>
	
							</table>		
						</div>
				
						<nav aria-label="Page navigation example">
							<ul class="pagination m-5 flex-c-m" >				
								<c:if test="${pageMaker.prev}"><!--pageMaker.getprev출력, 트루이게되면 링크를걸음 -->
									<li class="page-item"><a class="page-link" aria-label="Previous" href="/ssmall/mypage/myPage_refundList${pageMaker.makeQuery(pageMaker.startPage - 1)}">«</a></li>
									<!--get방식의 key value를 넘김, 함수를 다이렉트로 추출하는 소스(직접호출) -->
								</c:if>
								<!-- var="idx"하게되면 1씩증가  -->								
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
									<c:out value="${pageMaker.cri.page == idx?'':''}" />
									<li class="page-item"><a class="page-link" href="/ssmall/mypage/myPage_refundList${pageMaker.makeQuery(idx)}">${idx}</a></li>
								</c:forEach>
		
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li class="page-item"><a class="page-link" href="/ssmall/mypage/myPage_refundList${pageMaker.makeQuery(pageMaker.endPage +1) }">»</a></li>
								</c:if>
							</ul>
						</nav>					
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50" style ="height: 900px; width: 130px; padding-left: 15px; left: 250px; bottom:70px;">
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
    <script>window.jQuery || document.write('<script src="/ssmall/js/jquery-slim.min.js"><\/script>')</script>
    <script src="/ssmall/js/popper.min.js"></script>
    <script src="/ssmall/js/bootstrap.min.js"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

  
  </body>
</html>
