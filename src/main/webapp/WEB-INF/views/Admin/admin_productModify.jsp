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
			<!-- Left navbar links -->

			<!-- SEARCH FORM -->
			<form class="form-inline ml-3" action="/ssmall/admin/productSearch">
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
			
			<a href="/ssmall/admin/adminpage">
				<h3 class="brand-text font-weight-light" style="color:white; display: inline;">상승몰 관리자</h3>
			</a>
			
			

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
								<a href="/ssmall/admin/memberList"><button class="dropbtn">회원관리</button></a>							
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<a href="/ssmall/admin/productList"><button class="dropbtn" style="font-weight: bold;">상품</button></a>
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
						<div class="col-sm-6">
							<h1>상품 목록</h1>
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
												<th></th>
												<th style="text-align: center;">상품 명</th>
												<th style="text-align: center;">상품 브랜드</th>
												<th style="text-align: center;">상품 가격</th>
												<th style="text-align: center;">상품 재고</th>
												<th style="text-align: center;">상품 판매량</th>
												<th style="text-align: center;">상품 종류</th>
											</tr>										
									
											<tr>
												<td style="text-align: center;">
													<img id="myBtn" src="/ssmall/productimage/${product.p_image}" alt="IMG" width="100px" height="100px">	
												</td>										
												<td style="text-align: center; vertical-align: middle;">${product.p_name}</td>
												<td style="text-align: center; vertical-align: middle;">${product.p_brand}</td>						
												<td style="text-align: center; vertical-align: middle;"><fmt:formatNumber value="${product.p_price}" pattern="###,###,###" />원</td>
												<td style="text-align: center; vertical-align: middle;">${product.p_stock}</td>
												<td style="text-align: center; vertical-align: middle;">${product.p_amount}</td>
												<td style="text-align: center; vertical-align: middle;">${product.p_category}</td>
											</tr>	
																							
										</table>											
									</div>
								</div>								
							</div>						
						</div>						
					</div>				
				</div>				
			</section>	
		</div>


		<!-- The Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">상품 수정</h4>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>

					<!-- Modal body -->
					<form id="modifyForm" action="/ssmall/admin/productUpdate?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
						<input type="hidden" name="p_number" value="${product.p_number}"/>
						
						<div class="modal-body">

							<div class="form-group">
								<label for="sel1">활성화</label>
									<select class="form-control" id="sel1" name="p_enabled" value="">
										<option>활성화</option>
										<option>비활성화</option>
									</select>
								<br><label for="sel1">상품 명</label> <br>
									<input type="text" class="form-control" name="p_name" value="${product.p_name}">
								<br><label for="sel1">상품 브랜드</label> <br>
									<input type="text" class="form-control" name="p_brand" value="${product.p_brand}">
								<br><label for="sel1">상품 가격</label> <br>
									<input type="text" class="form-control" name="p_price" value="${product.p_price}">
								<br><label for="sel1">상품 재고</label> <br>
									<input type="text" class="form-control" name="p_stock" value="${product.p_stock}">								
								<br><label for="sel1">대표 사진</label><br>
									<input type="file" name="file1" />
								<br><label for="sel1">상품 사진1</label><br>	
									<input type="file" name="file2" />	
								<br><label for="sel1">상품 사진2</label><br>	
									<input type="file" name="file3" />																				
							</div>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button id="modify" type="button" class="btn btn-danger">수정</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
					</form>

				</div>
			</div>
		</div>

		<footer class="main-footer">
			<strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io.</a>
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 3.0.2
			</div>
		</footer>		
	</div>
</body>
<script>
	$('#modify').click(function(){
		if("confirm('수정 하시겠습니까?')"){
			$('#modifyForm').submit();
		}
	})
</script>
</html>
