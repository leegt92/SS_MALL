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




<style >

background-color: rgba(149, 204, 210, 0.2)!important;
}
	/*  html, body {

        width: 100%;
        height: 100%;

        margin: 0;
        padding: 0;

        font-family: "Helvetica Neue", Helvetica, sans-serif;

        background-color: #FFFFFF;
    }   */

    .accordion{

        position: relative;

        width: 500px;
        height: 100%;

        font-size: 16px;

        margin: 0 auto;

        padding-top: 30px;
    }

    .accordion1{
        position: relative;

        width: 100%;
        height: 100%;

        list-style: none;

        margin: 0;
        padding: 0;
    } 
    
    .accordion2 {
		border-bottom: 1px solid #bebebe;
    }

    .accordion2 h3 {

        position: relative;

        width: 100%;
        height: 30px;

        line-height: 30px;

        /* text-align: center; */

        color: black;

        background-color: #FFFFFF;

        cursor: pointer;

        margin: 0px;
        padding: 0px;

        border-bottom: #ddd 1px solid;
    }

    .accordion2 h3:hover{
        color: #757575;
        background-color: #e5e5e5;
    }

    .accordion2 h3.active {
        color: #757575;
        background-color: #f5f5f5;
    }

    .accordion2 div{

        position: relative;

        width: 100%;
        height: 400px;

        background-color: #FFFFFF;

        word-break: break-all;
        word-wrap: break-word;

        overflow: auto;

        margin: 0;
        padding: 0;

        display: none;
    }

    .accordion2 div span{

        position: relative;

        width: 100%;
        height: 100%;
    }


body {overflow-y: hidden; overflow-x: hidden;}


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
<body class="hold-transition sidebar-mini" >
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
								<button class="dropbtn" style="font-weight: bold;">공지사항</button>
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
							<h1>공지사항</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#"></a></li>
								<li class="breadcrumb-item"></li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			
			<table class="table table-nomargin" style="margin-bottom: 0px;margin-top: 0px;">
			
           <thead>
           <th style="width:60%; padding-left:12px !important;">제목(작성날짜)</th>
           </thead>           	
    </table>
	<button onclick="window.location.href='/ssmall/admin/noticeWrite'" style="margin-top: 0px; margin-left: 1500px;"><font size="3em" style="border:2px solid black; background-color:#bebebe">공지사항 작성</font></button>
			<!-- Main content -->
			<section class="content style=">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<div class="card card-primary card-outline">
							<div class="card-header">
							
							
							<div class="accordion" style="left: 400px;width: 1200px;top: 100px;">
    
    
    <ul class="accordion1" style="height: 220px;">
    	<c:forEach items="${askRequestboards}" var="askRequestboards" varStatus="status">
        <li class="accordion2">
            <c:choose>
            	<c:when test="${askRequestboards.banswered eq '답변완료'}">
            		<h3 style="font-size:16px; color:green;" class="accordion3">
            		<c:out value = "${askRequestboards.btitle}"/><c:out value = " (${askRequestboards.bdate})"/><c:out value = " (${askRequestboards.banswered})"/>
            		<c:set var="bId" value="${askRequestboards.bid}" />
            		<button onclick="window.location.href='/ssmall/admin/noticeWrite2?bId=${askRequestboards.bid}'" style="left: 1505px;"><font size="4em" style="border:2px solid black; background-color:#bebebe">수정</font></button>
            		<button onclick="Swal.fire({
        				  title: '정말 삭제하시겠습니까?',
        				  text: '삭제 되면 복구되지 않습니다.',
        				  icon: 'warning',
        				  showCancelButton: true,
        				  confirmButtonColor: '#3085d6',
        				  cancelButtonColor: '#d33',
        				  confirmButtonText: '네 삭제하겠습니다.'
        				}).then((result) => {
        				  if (result.value) {
        				    Swal.fire(
        				      '삭제완료',
        				      '삭제가 완료되었습니다.',
        				      'success'
        				    ).then(function() {
        				    	window.location.href='/ssmall/mypage/delete.do?bId=' + ${askRequestboards.bid};
    	    				});
        				  }
        				})" style="left: 1550px;">
            		<font size="4em" style="style="left: 1505px;"><font size="4em" style="border:2px solid black; background-color:#bebebe">삭제</font>
            		</button>
            		</h3>
            	</c:when>
            	<c:otherwise>
            		<h3 style="font-size:16px; color:red;" class="accordion3">
            		<c:out value = "${askRequestboards.btitle}"/><c:out value = " (${askRequestboards.bdate})"/><c:out value = " (${askRequestboards.banswered})"/>
            		<button onclick="window.location.href='/ssmall/admin/noticeWrite2?bId=${askRequestboards.bid}'" style="position:fixed;left: 1505px;"><font size="4em" style="border:2px solid black; background-color:#bebebe">수정</font></button>
            		<button onclick="Swal.fire({
      				  title: '정말 삭제하시겠습니까?',
    				  text: '삭제 되면 복구되지 않습니다.',
    				  icon: 'warning',
    				  showCancelButton: true,
    				  confirmButtonColor: '#3085d6',
    				  cancelButtonColor: '#d33',
    				  confirmButtonText: '네 삭제하겠습니다.'
    				}).then((result) => {
    				  if (result.value) {
    				    Swal.fire(
    				      '삭제완료',
    				      '삭제가 완료되었습니다.',
    				      'success'
    				    ).then(function() {
    				    	window.location.href='/ssmall/admin/delete.do?bId=' + ${askRequestboards.bid};
	    				});
    				  }
    				})" style="position:fixed;left: 1550px;">
            		<font size="4em" style="border:2px solid black; background-color:#bebebe">삭제</font>
            		</button>
            		</h3>
            	</c:otherwise>
            </c:choose>
            <div class="accordion3">
            	<p><b>제목 : </b><c:out value = "${askRequestboards.btitle}"/></p>
            	<br/>
            	<p><b>내용 : </b><c:out value = "${askRequestboards.bcontent}"/></p>
            	<br/>
            	
              	
            </div>
        </li>
        </c:forEach>
        <c:if test="${pageMaker.prev}">
			<a href="//ssmall/admin/noticeList${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
	</c:if>
	
	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<c:out value="${pageMaker.cri.page == idx?'':''}" />
			<a href="/ssmall/admin/noticeList${pageMaker.makeQuery(idx)}">${idx}</a>
	</c:forEach>
	
	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="/ssmall/admin/noticeList${pageMaker.makeQuery(pageMaker.endPage +1) }"> » </a>
	</c:if> <br>
        
    </ul>
    
</div>
								

					</div>	
								</tbody>
									</table>
																
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
	
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="/ssmall/js/jquery-slim.min.js"><\/script>')</script>
    <script src="/ssmall/js/popper.min.js"></script>
    <script src="/ssmall/js/bootstrap.min.js"></script>
    <script src="/ssmall/js/sweetalert2.js"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
	
    <script>
    $(document).ready(function() {

	    // click 이벤트가 발생된 마지막 element
	    var lastElem = null;

	    $('.accordion').on('click', function (e) {

	        // click 이벤트가 발생한 element
	        var elem = e.target;

	        // nodeName 이 `h3` 가 아닌 경우, 해당 이벤트를 중지시킨다.
	        if (elem.nodeName.toLowerCase() !== 'h3'){
	            return;
	        }

	        // target element
	        var targetElem = $(elem);

	        // 이벤트가 발생된 마지막 element 를 닫는다.
	        if (lastElem) {
	            slideUp(lastElem.next(), 5, function (elem) {
	                elem.prev().attr('class', '');
	            });
	        }

	        var targetContentElem = targetElem.next();

	        // target element 가 active 일 경우
	        if (targetElem.attr('class') === 'active') return;

	        // 현재 target element 를 마지막 element 로 할당한다.
	        lastElem = targetElem;

	        // target content 를 보이게한다.
	        targetContentElem.show();
	        targetElem.attr('class', 'active');

	        slideDown(targetContentElem, 20);
	    });


	        function slideDown($elem, step, cb){

	            // jquery 로 생성된 element
	            if (!$elem){
	                /* console.error('엘리먼트가 존재하지 않습니다'); */
	                return;
	            }

	            // 증감 총 단계(전체 height 사이즈를, 총 몇 단계로 나눠 증감 시킬것인지 정할 수 있으며, 수치가 작을 수록 이동 속도가 올라간다.)
	            step = step || 20;

	            // callback function
	            cb = cb || function(){};

	            // $elem: jquery 로 생성된 element
	            // elem: dom element
	            var elem = $elem.get(0);

	            // 만약 타이머가 존재할 경우, 해당 타이머를 clear 시킨다.
	            if (elem.__timerId__){
	                window.clearInterval(elem.__timerId__);
	                elem.__timerId__ = null;
	            }

	            // (1)초당 함수가 호출되는 수(30 프레임으로 고정한다)
	            var fps = 1000 / 30;

	            // element 의 세로 사이즈
	            var height = parseFloat($elem.height());

	            // element 의 (초기)전체 사이즈
	            var dummyHeight = 0;

	            if (!elem.__dummyHeight__){
	                dummyHeight = elem.__dummyHeight__ = height;

	                $elem.height(0);
	                height = 0;
	            }
	            else{
	                dummyHeight = elem.__dummyHeight__;
	            }

	            // 증감 값
	            var increaseValue = dummyHeight / step;

	            elem.__timerId__ = window.setInterval(function () {

	                // height 값을 증감 시킨다.
	                height += increaseValue;

	                // height 값이 dummyHeight(전체 사이즈) 보다 크거나 같을경우, 해당 interval 을 중지시킨다.
	                if (height >= dummyHeight) {

	                    // 타이머를 중지 시킨다.
	                    if (elem.__timerId__){
	                        window.clearInterval(elem.__timerId__);
	                        elem.__timerId__ = null;
	                    }

	                    // element height 에 dummyHeight 값을 할당한다.
	                    $elem.height(dummyHeight);

	                    /* console.error('slideDown', $elem.text(), 'height', height, 'timerId', elem.__timerId__); */

	                    // callback 호출
	                    cb($elem);
	                }
	                else{

	                    // 증감된 height 값을 할당한다.
	                    $elem.height(height);
	                    /* console.error('slideDown', $elem.text(), 'height', height); */
	                }

	            }, fps);
	        }


	        function slideUp($elem, step, cb){

	            // jquery 로 생성된 element
	            if (!$elem){
	                /* console.error('엘리먼트가 존재하지 않습니다'); */
	                return;
	            }

	            // 가감 총 단계(전체 height 사이즈를, 총 몇 단계로 나눠 가감 시킬것인지 정할 수 있으며, 수치가 작을 수록 이동 속도가 올라간다.)
	            step = step || 5;

	            // callback function
	            cb = cb || function(){};

	            // $elem: jquery 로 생성된 element
	            // elem: dom element
	            var elem = $elem.get(0);

	            // 만약 타이머가 존재할 경우, 해당 타이머를 clear 시킨다.
	            if (elem.__timerId__){
	                window.clearInterval(elem.__timerId__);
	                elem.__timerId__ = null;
	            }

	            // (1)초당 함수가 호출되는 수(30 프레임으로 고정한다)
	            var fps = 1000 / 30;

	            // element 의 세로 사이즈
	            var height = parseFloat($elem.height());

	            // 가감 값
	            var increaseValue = elem.__dummyHeight__ / step;

	            elem.__timerId__ = window.setInterval(function () {

	                // height 값을 가감 시킨다.
	                height -= increaseValue;

	                // height 값이 0 보다 작거나 같을경우, 해당 interval 을 중지시킨다.
	                if (height <= 0) {

	                    if (elem.__timerId__){
	                        window.clearInterval(elem.__timerId__);
	                        elem.__timerId__ = null;
	                    }

	                    // element height 에 0 값을 할당한다.
	                    $elem.height(0);

	                    /* console.error('slideUp', $elem.text(), 'height', height, 'timerId', elem.__timerId__); */
	                    cb($elem);
	                }
	                else{	
	                    // 가감된 height 값을 할당한다.
	                    $elem.height(height);
	                }

	            }, fps);
	        }

	});
    		
   
			
    		
	</script>
	
</body>
</html>
