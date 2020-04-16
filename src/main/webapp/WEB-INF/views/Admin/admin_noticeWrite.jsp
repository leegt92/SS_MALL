<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" href="/ssmall/images/icons/productlogo.png"/>

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
	display: block;
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

span {
	display: table-cell;
	padding-left: 10px;
	text-align: left;
	vertical-align: middle;
}
</style>
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">

				<li class="nav-item d-none d-sm-inline-block"><a
					href="/ssmall/admin/adminpage" class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="/ssmall/admin/noticeList" class="nav-link">Notice</a></li>		
			</ul>


		</nav>
		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<img src="/ssmall/images/logo.png" alt="logo"
				class="brand-image img-circle elevation-3"> <a
				href="/ssmall/admin/adminpage"><h3
					class="brand-text font-weight-light"
					style="color: white; display: inline;">상승몰 관리자</h3></a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="info"></div>
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
								<a href="/ssmall/admin/productList"><button class="dropbtn">상품</button></a>
								<div class="dropdown-content" >
								    <a href="/ssmall/admin/productList">상품 목록</a>
								    <a href="/ssmall/admin/addProduct">상품 등록</a>
								 </div>															
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<a href="/ssmall/admin/noticeList"><button class="dropbtn" style="font-weight: bold;">공지사항</button></a>
								<div class="dropdown-content">
									<a href="/ssmall/admin/noticeList">공지사항 목록</a>
									<a href="/ssmall/admin/noticeWrite">공지사항 작성</a>							
								</div>
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<a href="/ssmall/admin/requestList"><button class="dropbtn">1:1문의</button></a>
								<div class="dropdown-content">							

									<a href="/ssmall/admin/requestList">답변완료된 1:1문의 목록</a>
									<a href="/ssmall/admin/unAnsweredrequestList">답변미완료된 1:1문의 목록</a>							

								</div>
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<a href="/ssmall/admin/asList"><button class="dropbtn">A/S요청</button></a>
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
							<h1>공지사항</h1>
						</div>
						
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content style">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<div class="card card-primary card-outline">
							<div class="card-body p-0">
								<div class="mailbox-controls">									
									<div class="table-responsive mailbox-messages">						
										<form action="/ssmall/admin/noticeWriteDo?${_csrf.parameterName}=${_csrf.token}" method="post">
										
										<table class="table table-list-search">	
											<tr>
												<td>										
													<select class="form-control" id="sel1" name="btype">
														<option>공지사항</option>
														<option>혜택</option>
													</select>
												</td>
											</tr>										
											<tr>											
												<td>
													<textarea placeholder="제목을 입력하세요" style="width: 1590px; height:auto; font-size: 1.5em; font-weight: bold;" name="btitle"></textarea>
												</td>
											</tr>
											<tr>
												<td>
													<textarea id="Content" placeholder="내용을 입력하세요" style="width: 1590px; height:auto; vertical-align: center; font-size : 1.2em;" name="bcontent"></textarea>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="text-align: right;"><button class="btn btn-primary" type="submit" >작성</button> &nbsp;&nbsp; <a href="/ssmall/admin/noticeList"><button type="button" class="btn btn-primary">목록</button></a>&nbsp;&nbsp;</td>
											</tr>									
										</table>
									</form>
							</div>				
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</div>



	<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- Main Footer -->
		<footer class="main-footer">
			<strong>Copyright &copy; 2014-2019 <a
				href="http://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 3.0.2
			</div>
		</footer>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(function(){
			CKEDITOR.replace('Content', {
			      width : '1590px', 
			      height : '700px',
			      startupFocus : false,
			      filebrowserUploadUrl: '${pageContext.request.contextPath}/mine/imageUpload.do?${_csrf.parameterName}=${_csrf.token}',
			      extraPlugins : 'confighelper'		  
			    });
		});
		
	</script> 
</body>
</html>
