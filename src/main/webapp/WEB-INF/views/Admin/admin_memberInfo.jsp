<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>상승몰 관리자 페이지</title>

<!-- Bootstrap core CSS -->
<!-- IonIcons -->
<link rel="icon" type="image/png" href="/ssmall/images/icons/productlogo.png"/>
<link rel="stylesheet" href="/ssmall/css/OverlayScrollbars.min.css">

<link rel="stylesheet" href="/ssmall/css/sidemenu.css">

<link rel="stylesheet" href="/ssmall/css/adminpage.css">

<!-- Theme style -->
<link rel="stylesheet" href="/ssmall/css/adminlte.min.css">

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/ssmall/css/util.css">	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!--===============================================================================================-->

<style>
.dropdown button {
	display: block; /* table */
	width: 230px;
	height: 50px;
	color: #fff;
	background-color: #585858;
	border: none;
}

.dropdown {
	position: relative;
	display: inline-block;
	padding: 12px 0px
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #585858;
	min-width: 160px;
	z-index: 1;
	width: 200%;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}
</style>



<script>
	$(document).ready(function(){
	  $("#myBtn").click(function(){
	    $("#myModal").modal();
	  });
	});
</script>

</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light">
			<h4>${member.m_name}님</h4>
		</nav>
		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4" style="position:fixed;">
			<!-- Brand Logo -->
			<img src="/ssmall/images/logo.png" alt="logo" class="brand-image img-circle elevation-3">
			
			<a href="/ssmall/admin/adminpage"><h3 class="brand-text font-weight-light" style="color:white; display: inline;">상승몰 관리자</h3></a>
			
			

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">					
					<div class="info">
						
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">							
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<a href="/ssmall/admin/memberList"><button class="dropbtn" style="font-weight: bold;">회원관리</button></a>							
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<button class="dropbtn">상품</button>
								<div class="dropdown-content" >
								    <a href="/ssmall/admin/productList">상품 목록</a>
								    <a href="/ssmall/admin/addProduct">상품 등록</a>
								 </div>															
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<button class="dropbtn">공지사항</button>
								<div class="dropdown-content">
									<a href="/ssmall/admin/noticeList">공지사항</a>
									<a href="/ssmall/admin/noticeWrite">공지사항 작성</a>							
								</div>
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<a href="/ssmall/admin/requestList"><button class="dropbtn">1:1문의</button></a>							
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<a href="/ssmall/admin/asList"><button class="dropbtn">AS</button></a>							
							</div>
						</li>			
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
		    <!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div>
							<h1 style="color: black;">회원 정보</h1>
						</div>
											
					</div>					
				</div>			
			</section>
	
			<!-- 회원정보 -->
			<section class="content style">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-primary card-outline">							
							<div class="card-body p-0">
								<div class="mailbox-controls">									
									<div class="table-responsive mailbox-messages">						
										<table class="table table-list-search">
											<tr>
												<th style="text-align: center;">등급</th>
												<th style="text-align: center;">아이디</th>
												<th style="text-align: center;">이름</th>
												<th style="text-align: center;">나이</th>
												<th style="text-align: center;">이메일</th>
												<th style="text-align: center;">주소</th>
												<th style="text-align: center;">핸드폰</th>
												<th style="text-align: center;">포인트</th>
												<th style="text-align: center;">네이버가입여부</th>		
												<th style="text-align: center;">카카오가입여부</th>		
												<th style="text-align: center;">활성화여부</th>														
											</tr>										
											
											<tr>
												<td style="text-align: center; vertical-align: middle;" >
												<button type="button" class="btn btn-link" id="myBtn" style="text-decoration: none; color: black;">${member.m_authority}</button></td>
												<td style="text-align: center; vertical-align: middle;">${member.m_id}</td>
												<td style="text-align: center; vertical-align: middle;">${member.m_name}</td>						
												<td style="text-align: center; vertical-align: middle;">${member.m_age}</td>
												<td style="text-align: center; vertical-align: middle;">${member.m_email}</td>
												<td style="text-align: center; vertical-align: middle;">${member.m_adress}</td>
												<td style="text-align: center; vertical-align: middle;">${member.m_phonenum}</td>
												<td style="text-align: center; vertical-align: middle;">${member.m_point}</td>
												<c:choose>
													<c:when test="${member.m_naver == null}">
														<td style="text-align: center; vertical-align: middle;">X</td>
													</c:when>
													<c:otherwise>
														<td style="text-align: center; vertical-align: middle;">O</td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${member.m_kakao == null}">
														<td style="text-align: center; vertical-align: middle;">X</td>
													</c:when>
													<c:otherwise>
														<td style="text-align: center; vertical-align: middle;">O</td>
													</c:otherwise>
												</c:choose>													
												<c:choose>
													<c:when test="${member.m_enabled == 1}">
														<td style="text-align: center; vertical-align: middle;">활성화</td>
													</c:when>
													<c:otherwise>
														<td style="text-align: center; vertical-align: middle;">비활성화</td>
													</c:otherwise>
												</c:choose>
																				
											</tr>																								
										</table>
										<!-- The Modal -->
										<div class="modal fade" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">
									
													<!-- Modal Header -->
													<div class="modal-header">
														<h4 class="modal-title">등급 수정</h4>
														<button type="button" class="close" data-dismiss="modal">×</button>
													</div>
									
													<!-- Modal body -->
													<form action="/ssmall/admin/updateAutoritiy">
													<input type="hidden" name="m_number" value="${member.m_number}">	
													<div class="modal-body">
														
															<div class="form-group">
																<label for="sel1">등급</label> 
																<select class="form-control" id="sel1" name="m_authority">
																	<option>일반회원</option>
																	<option>관리자</option>
																	<option>VIP</option>
																	<option>BC</option>
																</select>
																
															</div>
														
													</div>
									
													<!-- Modal footer -->													
													<div class="modal-footer">
														<button type="submit" class="btn btn-danger" onclick="confirm('수정하시겠습니까?');">수정</button>
														<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													</div>
													</form>
									
												</div>
											</div>
										</div>
																																								
									</div>
								</div>								
							</div>						
						</div>						
					</div>				
				</div>				
			</section>
				
			<!-- 구매 정보 -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div>
							<a href="/ssmall/admin/buyInfo?m_number=${member.m_number}" style="color: black;"><h1>구매 정보</h1></a>
						</div>
					</div>					
				</div>			
			</section>					
			
			<section class="content style">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<div class="card card-primary card-outline">							
							<div class="card-body p-0">
								<div class="mailbox-controls">																				
									<div class="table-responsive mailbox-messages">
										<c:choose>
											<c:when test="${buyList[0] == NULL}">
												<table class="table table-list-search">
													<h3>구매한 내역이 없습니다.</h3>
												</table>	
											</c:when>
											<c:otherwise>																						
												<table class="table table-list-search">
													<tr>
														<th></th>
														<th style="text-align: center; vertical-align: middle;">상품명</th>
														<th style="text-align: center; vertical-align: middle;">상품가격</th>
														<th style="text-align: center; vertical-align: middle;">구매수량</th>
														<th style="text-align: center; vertical-align: middle;">총구매가격</th>
														<th style="text-align: center; vertical-align: middle;">구매일자</th>
														<th style="text-align: center; vertical-align: middle;">구매상태</th>
													</tr>		
													<c:forEach items="${buyList}"  var="buyList">													
													<tr>													
														<td style="text-align: center;">
															<a href="/ssmall/productDetail?p_number=${buyList.p_number}">
																<img src="/ssmall/productimage/${buyList.p_image}" alt="IMG" width="100px" height="100px">
															</a>
														</td>
														<td style="text-align: center; vertical-align: middle;">${buyList.p_brand} ${buyList.p_name}</td>
														<td style="text-align: center; vertical-align: middle;">${buyList.p_price}</td>		
														<td style="text-align: center; vertical-align: middle;">${buyList.b_amount}</td>			
														<td style="text-align: center; vertical-align: middle;"><fmt:formatNumber value="${buyList.b_total}" pattern="###,###,###" />원</td>																														
														<td style="text-align: center; vertical-align: middle;">${buyList.b_date}</td>
														<td style="text-align: center; vertical-align: middle;">${buyList.b_status}</td>	
													</tr>
													</c:forEach>														
												</table>																																						
											</c:otherwise>																		
										</c:choose>											
									</div>
								</div>								
							</div>						
						</div>						
					</div>				
				</div>				
			</section>	
			
			<!-- 환불 정보 -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div>
							<a href="/ssmall/admin/refundInfo?m_number=${member.m_number}" style="color: black;"><h1>환불 정보</h1></a>
						</div>
					</div>					
				</div>			
			</section>					
			
			<section class="content style">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<div class="card card-primary card-outline">							
							<div class="card-body p-0">
								<div class="mailbox-controls">																				
									<div class="table-responsive mailbox-messages">
										<c:choose>
											<c:when test="${refundList[0] == NULL}">
												<table class="table table-list-search">
													<h3>환불한 내역이 없습니다.</h3>
												</table>	
											</c:when>
											<c:otherwise>																						
												<table class="table table-list-search">
													<tr>
														<th></th>
														<th style="text-align: center; vertical-align: middle;">상품명</th>
														<th style="text-align: center; vertical-align: middle;">환불수량</th>
														<th style="text-align: center; vertical-align: middle;">환불가격</th>
														<th style="text-align: center; vertical-align: middle;">환불일자</th>
														<th style="text-align: center; vertical-align: middle;">환불상태</th>
													</tr>		
													<c:forEach items="${refundList}"  var="refundList">													
													<tr>													
														<td style="text-align: center;">
															<a href="/ssmall/productDetail?p_number=${refundList.p_number}">
																<img src="/ssmall/productimage/${refundList.p_image}" alt="IMG" width="100px" height="100px">
															</a>
														</td>
														<td style="text-align: center; vertical-align: middle;">${refundList.p_brand} ${refundList.p_name}</td>
														<td style="text-align: center; vertical-align: middle;">${refundList.r_amount}</td>			
														<td style="text-align: center; vertical-align: middle;"><fmt:formatNumber value="${refundList.r_price}" pattern="###,###,###" />원</td>																														
														<td style="text-align: center; vertical-align: middle;">${refundList.r_date}</td>
														<td style="text-align: center; vertical-align: middle;">${refundList.r_status}</td>	
													</tr>
													</c:forEach>														
												</table>																																						
											</c:otherwise>																		
										</c:choose>														
									</div>
								</div>								
							</div>						
						</div>						
					</div>				
				</div>				
			</section>
			
			<!-- 1:1문의 정보 -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div>
							<a href="/ssmall/admin/requestInfo?m_number=${member.m_number}" style="color: black;"><h1>1:1문의 정보</h1></a>
						</div>
					</div>					
				</div>			
			</section>	
			<section class="content style">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<div class="card card-primary card-outline">							
							<div class="card-body p-0">
								<div class="mailbox-controls">																				
									<div class="table-responsive mailbox-messages">
										<c:choose>
											<c:when test="${requestList[0] == NULL}">
												<table class="table table-list-search">
													<h3>1:1문의 내역이 없습니다.</h3>
												</table>	
											</c:when>
											<c:otherwise>																						
												<table class="table table-list-search">
													<tr>											
														<th style="text-align: center; vertical-align: middle;">작성자</th>
														<th style="text-align: center; vertical-align: middle;">제목</th>
														<th style="text-align: center; vertical-align: middle;">작성일자</th>
														<th style="text-align: center; vertical-align: middle;">답변여부</th>
													</tr>		
													<c:forEach items="${requestList}"  var="requestList">													
													<tr>													
														<td style="text-align: center; vertical-align: middle;">${requestList.bname}</td>
														<td style="text-align: center; vertical-align: middle;">${requestList.btitle}</td>			
														<td style="text-align: center; vertical-align: middle;">${requestList.bdate}</td>																													
														<td style="text-align: center; vertical-align: middle;">${requestList.banswered}</td>	
													</tr>
													</c:forEach>														
												</table>																																						
											</c:otherwise>																		
										</c:choose>														
									</div>
								</div>								
							</div>						
						</div>						
					</div>				
				</div>				
			</section>
			
			<!-- AS문의 정보 -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div>
							<a href="/ssmall/admin/asInfo?m_number=${member.m_number}" style="color: black;"><h1>AS문의 정보</h1></a>
						</div>
					</div>					
				</div>			
			</section>	
			<section class="content style=">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<div class="card card-primary card-outline">							
							<div class="card-body p-0">
								<div class="mailbox-controls">																				
									<div class="table-responsive mailbox-messages">
										<c:choose>
											<c:when test="${asList[0] == NULL}">
												<table class="table table-list-search">
													<h3>AS문의 내역이 없습니다.</h3>
												</table>	
											</c:when>
											<c:otherwise>																						
												<table class="table table-list-search">
													<tr>
														<th style="text-align: center; vertical-align: middle;">작성자</th>
														<th style="text-align: center; vertical-align: middle;">제목</th>
														<th style="text-align: center; vertical-align: middle;">작성일자</th>
														<th style="text-align: center; vertical-align: middle;">답변여부</th>
													</tr>		
													<c:forEach items="${asList}"  var="asList">													
													<tr>													
														<td style="text-align: center; vertical-align: middle;">${asList.bname}</td>
														<td style="text-align: center; vertical-align: middle;">${asList.btitle}</td>			
														<td style="text-align: center; vertical-align: middle;">${asList.bdate}</td>																													
														<td style="text-align: center; vertical-align: middle;">${asList.banswered}</td>	
													</tr>
													</c:forEach>														
												</table>																																						
											</c:otherwise>																		
										</c:choose>														
									</div>
								</div>								
							</div>						
						</div>						
					</div>				
				</div>				
			</section>		
		</div>
		<footer class="main-footer">
				<strong>Copyright &copy; 2014-2019 <a
					href="http://adminlte.io">AdminLTE.io</a>.
				</strong> All rights reserved.
				<div class="float-right d-none d-sm-inline-block">
					<b>Version</b> 3.0.2
				</div>
		</footer>
	</div>

	
</body>

</html>
