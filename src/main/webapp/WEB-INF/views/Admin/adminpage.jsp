<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">


    <title>상승몰 관리자 페이지</title>

<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">


<link rel="stylesheet" href="/ssmall/css/OverlayScrollbars.min.css">

<link rel="stylesheet" href="/ssmall/css/sidemenu.css">

<link rel="stylesheet" href="/ssmall/css/adminpage.css">

<!-- Theme style -->
<link rel="stylesheet" href="/ssmall/css/adminlte.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">

<!-- Google Font: Source Sans Pro -->

<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />

<script src="https://code.jquery.com/jquery.min.js"></script>

<!-- google charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	

	<script>
		 var brand = new Array();
		 var sales = new Array(); 		
	</script>
	
	<c:set var="index" value="0"/>
	<c:forEach items="${map}" var = "map">		
		<script>
			brand[${index}] = '${map.key}';
			sales[${index}] = '${map.value}';
	
		</script>
	<c:set var="index" value="${index+1}"/>
	</c:forEach>
	
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawVisualization);

	function drawVisualization() {
		
		var data = new google.visualization.DataTable();
		data.addColumn('string', '브랜드');
		data.addColumn('number', '판매량');
		
		for(var i=0; i < brand.length; i++){
			data.addRow([brand[i], parseInt(sales[i]),]);
		}
		
		var options = {
			title : '브랜드 별 전체 통계',
			width: 1500,
		    height: 500,
			
			vAxis : {
				title : 'Sales Rate'
			},
			hAxis : {
				title : '브랜드'
			},
			seriesType : 'bars',
			series : {
				5 : {
					type : 'line'
				}
			},
			colors: ['#dbbf41'],
		};

		var chart = new google.visualization.ComboChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>


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

<script type="text/javascript">
	function move(url) {
		location.href = url;
	}
</script>

</head>

<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to to the body tag
to get the desired effect
|---------------------------------------------------------|
|LAYOUT OPTIONS | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->


<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item d-none d-sm-inline-block"><a 
					href="/ssmall/" class="nav-link"><i class="fas fa-home"></i> Main</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="/ssmall/admin/adminpage" class="nav-link">Home</a></li>

			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4"
			style="position: fixed;">
			<!-- Brand Logo -->
			<img src="/ssmall/images/logo.png" alt="logo"
				class="brand-image img-circle elevation-3"> <a
				href="/ssmall/admin/adminpage">
				<h3 class="brand-text font-weight-light"
					style="color: white; display: inline;">상승몰 관리자</h3>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="info"></div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<a href="/ssmall/admin/memberList"><button class="dropbtn">회원관리</button></a>
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<a href="/ssmall/admin/productList"><button class="dropbtn">상품</button></a>
								<div class="dropdown-content">
									<a href="/ssmall/admin/productList">상품 목록</a> <a
										href="/ssmall/admin/addProduct">상품 등록</a>
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
								<div class="dropdown-content">
									<a href="/ssmall/admin/requestList">답변완료된 1:1문의 목록</a> <a
										href="/ssmall/admin/unAnsweredrequestList">답변미완료된 1:1문의 목록</a>
								</div>
							</div>
						</li>
						<li class="nav-item has-treeview">
							<div class="dropdown">
								<a href="/ssmall/admin/asList"><button class="dropbtn">A/S요청</button></a>
								<div class="dropdown-content">
									<a href="/ssmall/admin/asList">답변완료된 A/S요청 목록</a> <a
										href="/ssmall/admin/unAnsweredasList">답변미완료된 A/S요청 목록</a>
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
							<h4>통계</h4>
						</div>													
					</div>					
				</div>			
			</section>
			
			<section class="content style">
				<div class="row">		
					<div class="col-md-12">
						<div class="card card-primary card-outline">
							<div class="card-header">
								<div id="Line_Controls_Chart">
									<!-- 라인 차트 생성할 영역 -->
									<div id="chart_div"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h4>실적</h4>
						</div>													
					</div>					
				</div>			
			</section>
			
			<section class="content style">
				<!-- 3번째 줄 -->
				<div class="row">						
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-white">
							<div class="inner">
								<h4 style="text-align: center; font-weight: bold;">
									<fmt:formatNumber value="${weeklySales}" pattern="###,###,###" /> 원
								</h4>
								<div class="icon">
									<i class="fas fa-coins"></i>
								</div>
							</div>
							<strong class="small-box-footer" style="color: blue;">주간 판매실적</strong>
						</div>
					</div>
						
					<!-- ./col -->
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-white">
							<div class="inner">
								<h4 style="text-align: center; font-weight: bold;">
									<fmt:formatNumber value="${monthlySales}" pattern="###,###,###" /> 원
								</h4>
								<div class="icon">
									<i class="fas fa-coins"></i>
								</div>
							</div>
							<strong class="small-box-footer" style="color: blue;">월간 판매실적</strong>
						</div>
					</div>
								
					<!-- ./col -->
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-white">
							<div class="inner">
								<h4 style="text-align: center; font-weight: bold;">
									<fmt:formatNumber value="${yearlySales}" pattern="###,###,###" /> 원
								</h4>
								<div class="icon">
									<i class="fas fa-coins"></i>
								</div>
							</div>
							<strong class="small-box-footer" style="color: blue;">연간 판매실적</strong>
						</div>
					</div>
							
					<!-- ./col -->
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-white">
							<div class="inner">
								<h4 style="text-align: center; font-weight: bold;">
									<fmt:formatNumber value="${totalSales}" pattern="###,###,###" /> 원
								</h4>
								<div class="icon">
									<i class="fas fa-coins"></i>
								</div>
							</div>
							<strong class="small-box-footer" style="color: blue;">총 판매실적</strong>
						</div>				
					</div>	
				</div>	
			</section>								
		</div>
		
		<!-- Main Footer -->
		<footer class="main-footer">
			<strong>Copyright &copy; 2014-2019 
				<a href="http://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 3.0.2
			</div>
		</footer>				
	</div>

</body>
</html>

