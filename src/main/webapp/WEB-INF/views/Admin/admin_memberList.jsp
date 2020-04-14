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



</head>

<body class="hold-transition sidebar-mini">

	<div class="wrapper">
		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- SEARCH FORM -->
			<form class="form-inline ml-3" action="/ssmall/admin/memberSearch">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" name="search" type="search" placeholder="Search" aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-navbar" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</form>
		</nav>
		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4" style="position: fixed;">
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
								<a href="/ssmall/admin/productList"><button class="dropbtn">상품</button></a>
								<div class="dropdown-content" >
								    <a href="/ssmall/admin/productList">상품 목록</a>
								    <a href="/ssmall/admin/addProduct">상품 등록</a>
								 </div>															
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<a href="/ssmall/admin/noticeList"><button class="dropbtn">공지사항</button></a>
								<div class="dropdown-content">
									<a href="/ssmall/admin/noticeList">공지사항 목록</a>
									<a href="/ssmall/admin/noticeWrite">공지사항 작성</a>							
								</div>
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<button class="dropbtn" style="font-weight: bold;">1:1문의</button>
								<div class="dropdown-content">
									<a href="/ssmall/admin/requestList">답변완료된 1:1문의 목록</a>
									<a href="/ssmall/admin/unAnsweredrequestList">답변미완료된 1:1문의 목록</a>							
								</div>
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<button class="dropbtn" style="font-weight: bold;">A/S요청</button>
								<div class="dropdown-content">
									<a href="/ssmall/admin/asList">답변완료된 A/S요청 목록</a>
									<a href="/ssmall/admin/unAnsweredasList">답변미완료된 A/S요청 목록</a>							
								</div>
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
						<div class="col-sm-6">
							<h1>회원 목록</h1>
						</div>
											
					</div>					
				</div>			
			</section>
	
			<!-- Main content -->
			<section class="content style=">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<div class="card card-primary card-outline">
							
							<div class="card-body p-0">
								<div class="mailbox-controls">		
									
									
									<div class="table-responsive mailbox-messages">
										<c:choose>
											<c:when test="${search[0] != NULL }">
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
													</tr>										
													<c:forEach items="${search}" var="search">
													<tr>
														<td style="text-align: center; vertical-align: middle;">${search.m_authority}</td>
														<td style="text-align: center; vertical-align: middle;">
														<a href="/ssmall/admin/memberInfo?m_number=${search.m_number}" style="text-decoration: none;">${search.m_id}</a>
														</td>
														<td style="text-align: center; vertical-align: middle;">${search.m_name}</td>						
														<td style="text-align: center; vertical-align: middle;">${search.m_age}</td>
														<td style="text-align: center; vertical-align: middle;">${search.m_email}</td>
														<td style="text-align: center; vertical-align: middle;">${search.m_adress}</td>
														<td style="text-align: center; vertical-align: middle;">${search.m_phonenum}</td>
														<td style="text-align: center; vertical-align: middle;">${search.m_point}</td>										
													</tr>
													</c:forEach>													
												</table>
												
												<nav aria-label="Page navigation example">
													<ul class="pagination m-5 flex-c-m">				
														<c:if test="${pageMaker.prev}"><!--pageMaker.getprev출력, 트루이게되면 링크를걸음 -->
															<li class="page-item"><a class="page-link" aria-label="Previous" href="/ssmall/admin/memberSearch${pageMaker.makeQuery(pageMaker.startPage - 1)}&search=${keyword}">«</a></li>
															<!--get방식의 key value를 넘김, 함수를 다이렉트로 추출하는 소스(직접호출) -->
														</c:if>
														<!-- var="idx"하게되면 1씩증가  -->								
														<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
															<c:out value="${pageMaker.cri.page == idx?'':''}" />
															<li class="page-item"><a class="page-link" href="/ssmall/admin/memberSearch${pageMaker.makeQuery(idx)}&search=${keyword}">${idx}</a></li>
														</c:forEach>
								
														<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
																<li class="page-item"><a class="page-link" href="/ssmall/admin/memberSearch${pageMaker.makeQuery(pageMaker.endPage +1) }&search=${keyword}">»</a></li>
														</c:if>
														
													</ul>
													
												</nav>		
											</c:when>
										
											<c:when test="${member[0] == NULL}">				
												<table class="table table-list-search">
													<h3>가입한 회원이 없습니다.</h3>
												</table>
	
											</c:when>
											<c:otherwise>
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
													</tr>										
													<c:forEach items="${member}" var="member">
													<tr>
														<td style="text-align: center; vertical-align: middle;">${member.m_authority}</td>
														<td style="text-align: center; vertical-align: middle;">
														<a href="/ssmall/admin/memberInfo?m_number=${member.m_number}" style="text-decoration: none;">${member.m_id}</a>
														</td>
														<td style="text-align: center; vertical-align: middle;">${member.m_name}</td>						
														<td style="text-align: center; vertical-align: middle;">${member.m_age}</td>
														<td style="text-align: center; vertical-align: middle;">${member.m_email}</td>
														<td style="text-align: center; vertical-align: middle;">${member.m_adress}</td>
														<td style="text-align: center; vertical-align: middle;">${member.m_phonenum}</td>
														<td style="text-align: center; vertical-align: middle;">${member.m_point}</td>										
													</tr>
													</c:forEach>													
												</table>
												
												<nav aria-label="Page navigation example">
													<ul class="pagination m-5 flex-c-m">				
														<c:if test="${pageMaker.prev}"><!--pageMaker.getprev출력, 트루이게되면 링크를걸음 -->
															<li class="page-item"><a class="page-link" aria-label="Previous" href="/ssmall/admin/memberList${pageMaker.makeQuery(pageMaker.startPage - 1)}">«</a></li>
															<!--get방식의 key value를 넘김, 함수를 다이렉트로 추출하는 소스(직접호출) -->
														</c:if>
														<!-- var="idx"하게되면 1씩증가  -->								
														<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
															<c:out value="${pageMaker.cri.page == idx?'':''}" />
															<li class="page-item"><a class="page-link" href="/ssmall/admin/memberList${pageMaker.makeQuery(idx)}">${idx}</a></li>
														</c:forEach>
								
														<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
																<li class="page-item"><a class="page-link" href="/ssmall/admin/memberList${pageMaker.makeQuery(pageMaker.endPage +1) }">»</a></li>
														</c:if>
														
													</ul>
													
												</nav>		
																														
											</c:otherwise>
																				
										</c:choose>											
									</div>
								</div>								
							</div>						
						</div>						
					</div>				
				</div>				
			</section>
			<c:choose>
				<c:when test="${admin[0] == NULL}">
				
				</c:when>
				<c:otherwise>
					<!-- Content Header (Page header) -->
					<section class="content-header">
						<div class="container-fluid">
							<div class="row mb-2">
								<div class="col-sm-6">
									<h1>관리자 목록</h1>
								</div>
													
							</div>					
						</div>			
					</section>
			
					<!-- Main content -->
					<section class="content style=">
						<div class="row">
							<!-- /.col -->
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
													</tr>										
													<c:forEach items="${admin}" var="admin">
													<tr>
														<td style="text-align: center; vertical-align: middle;">${admin.m_authority}</td>											
														<td style="text-align: center; vertical-align: middle;">
															<a href="/ssmall/admin/memberInfo?m_number=${admin.m_number}" style="text-decoration: none;">${admin.m_id}</a>
														</td>						
														<td style="text-align: center; vertical-align: middle;">${admin.m_name}</td>
														<td style="text-align: center; vertical-align: middle;">${admin.m_age}</td>
														<td style="text-align: center; vertical-align: middle;">${admin.m_email}</td>
														<td style="text-align: center; vertical-align: middle;">${admin.m_adress}</td>
														<td style="text-align: center; vertical-align: middle;">${admin.m_phonenum}</td>										
													</tr>
													</c:forEach>													
												</table>
											
											</div>
										</div>								
									</div>						
								</div>						
							</div>				
						</div>				
					</section>
				</c:otherwise>
			</c:choose>
		</div>	
		<footer class="main-footer">
			<strong>Copyright &copy; 2014-2019 
				<a href="http://adminlte.io">AdminLTE.io</a>
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 3.0.2
			</div>
		</footer>
		
	</div>



</body>

</html>
