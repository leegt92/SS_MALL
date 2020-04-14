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

<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script>
function previewImage(f){

	var file = f.files;

	// 확장자 체크
	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
		alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

		// 선택한 파일 초기화
		f.outerHTML = f.outerHTML;

		document.getElementById('preview').innerHTML = '';

	}
	else {

		// FileReader 객체 사용
		var reader = new FileReader();

		// 파일 읽기가 완료되었을때 실행
		reader.onload = function(rst){
			document.getElementById('preview').innerHTML = '<img src="' + rst.target.result + '">';
		}

		// 파일을 읽는다
		reader.readAsDataURL(file[0]);

	}
}
</script>

<style>
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:100px; padding:5px; }
label[for='p_description'] { display:block; }
input { width:150px; }
textarea#p_description { width:400px; height:180px; }

.select_img img { margin:20px 0; }

.inputArea1 {
	position: relative;
	left: 20px;
}
</style>

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
				<li class="nav-item d-none d-sm-inline-block"><a href="/ssmall/admin/productList"
					class="nav-link">Product</a></li>
			</ul>
			
			
		</nav>
		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
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
								<a href="/ssmall/admin/memberList"><button class="dropbtn">회원관리</button></a>							
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<button class="dropbtn" style="font-weight: bold;">상품</button>
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
							
						</div>
						
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			
	<section id="container">
		<div id="container_box">
			<h2 class="inputArea1">상품 등록</h2>
			

			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data" action="/ssmall/admin/productAdd?${_csrf.parameterName}=${_csrf.token}">
			
			<div class="inputArea1">	
				<label>분류</label>
				<select class="category1" name="p_category">
					<option>지갑</option>
					<option>시계</option>
				</select>
			</div>
			
			<div class="inputArea1">
				<label for="p_name">상품명</label>
				<input type="text" id="p_name" name="p_name" />
			</div>
			
			<div class="inputArea1">
				<label for="p_brand">상품 브랜드</label>
				<input type="text" id="p_brand" name="p_brand" />
			</div>
			
			<div class="inputArea1">
				<label for="p_price">상품 가격</label>
				<input type="text" id="p_price" name="p_price" />
			</div>
			
			<div class="inputArea1">
				<label for="p_stock">상품 재고</label>
				<input type="text" id="p_stock" name="p_stock" />
			</div>
			
			<div class="inputArea1">
				<label for="p_description">상품소개</label>
				<textarea rows="5" cols="50" id="p_description" name="p_description"></textarea>
				
				<script>
					var ckeditor_config = {
							resize_enaleb : false,
							enterMode : CKEDITOR.ENTER_BR,
							shiftEnterMode : CKEDITOR.ENTER_P,
							filebrowserUploadUrl : ""
					};

					CKEDITOR.replace('p_description', {filebrowserUploadUrl: '${pageContext.request.contextPath}/mine/imageUpload.do?${_csrf.parameterName}=${_csrf.token}'});

					
					CKEDITOR.replace("p_description", ckeditor_config);

				</script>
				
			</div>
			

			<div class="inputArea1" >
				<label for="sel1">썸네일</label><br>
				<input type="file" id="" name="thumbnail1" size="10px"/><br/>
				<input type="file" id="" name="thumbnail2" /><br/>
				<input type="file" id="" name="thumbnail3" /><br/>

				
				<script>
					
					$("#").change(function(){
						if(this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(". img").attr("src", data.target.result).width(500);								
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
				</script>
			</div>
			
			<div class="inputArea1">
				
				<br><input type="submit" value="등록">			

			</div>
			
			</form>
			
		</div>
	</section>
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
</body>
</html>
