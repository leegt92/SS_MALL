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

<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">


<link rel="stylesheet" href="/ssmall/css/OverlayScrollbars.min.css">

<link rel="stylesheet" href="/ssmall/css/sidemenu.css">

<link rel="stylesheet" href="/ssmall/css/adll.min.css">

<link rel="stylesheet" href="/ssmall/css/bootstrap.css">

<link rel="stylesheet" href="/ssmall/css/icheck-bootstrap.min.css">

<link rel="stylesheet" href="/ssmall/css/fontawesome.min.css">

<link rel="stylesheet" href="/ssmall/css/adminpage.css">
<!-- Theme style -->
<link rel="stylesheet" href="/ssmall/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

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

.noresize {
  resize: both; /* 공지작성 내용 크기조절 */
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
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="adminpage" class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Contact</a></li>
			</ul>
			
		</nav>
		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4" style="position:fixed">
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
				<nav class="mt-2" >
					<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">							
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<a href="/ssmall/admin/memberList"><button class="dropbtn">회원관리</button></a>							
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
								<button class="dropbtn">A/S요청</button>
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
							<h1>1:1 문의 및 A/S 요청 답변</h1>
						</div>
						
						<div class="container">
						
		<table class="table table-bordered">
		
   
    
        <form action="/ssmall/admin/doAnswer" method="get">
        	<input type="hidden" value="${bId}" name="bId"/>
            <tr>
                <th style="width: 168px;">문의 및 요청 제목: </th>
                <td><input type="text" value="${FbTitle}" name="subject" readonly="readonly" class="form-control"/></td>
            </tr>
            <tr>
                <th>문의 및 요청 내용: </th>

                <td><textarea id="askContent" cols="10" placeholder="내용을 입력하세요. " name="answerContent" class="form-control" readonly="readonly" style="height: 214px;">${FbContent}</textarea></td>

            </tr>
            <br>
             <tr>
                <th>답변 제목: </th>
                <td><input type="text" value="${FanswerbTitle}" name="answerTitle" class="form-control"/></td>
            </tr>
            <tr>
                <th>답변 내용: </th>
                <td><textarea id="answerContent" cols="10" placeholder="내용을 입력하세요. " name="answerContent" class="form-control" style="height: 214px;">${FanswerbContent}</textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="답변 등록 및 수정"  class="pull-right"/>
                </td>
            </tr>
		</form>
   
</table>
							
								</div>												
							</div>										
						</div>														
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
	
	<!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="/ssmall/js/jquery-slim.min.js"><\/script>')</script>
    <script src="/ssmall/js/popper.min.js"></script>
    <script src="/ssmall/js/bootstrap.min.js"></script>
    <script src="/ssmall/js/sweetalert2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
	
	<!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    
  <script type="text/javascript">
		$(function(){
			CKEDITOR.replace('askContent',  {
			      width : '930px', 
			      height : '700px',
			      startupFocus : false
			    },{extraPlugins : 'confighelper',
				filebrowserUploadUrl: '${pageContext.request.contextPath}/mine/imageUpload.do?${_csrf.parameterName}=${_csrf.token}'
			});
		});
	</script>
	
	<script type="text/javascript">
		$(function(){
			CKEDITOR.replace('answerContent', {
			      width : '930px', 
			      height : '700px',
			      startupFocus : false,
			      filebrowserUploadUrl: '${pageContext.request.contextPath}/mine/imageUpload.do?${_csrf.parameterName}=${_csrf.token}',
			      extraPlugins : 'confighelper'		  
			    });
		});
		
	</script> 
   
</body>
</html>
