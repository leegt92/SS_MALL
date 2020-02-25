<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<style type="text/css">
.bg-light {
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

        font-size: 12px;

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

    ul li h3 {

        position: relative;

        width: 100%;
        height: 30px;

        line-height: 30px;

        text-align: center;

        color: black;

        background-color: #FFFFFF;

        cursor: pointer;

        margin: 0px;
        padding: 0px;

        border-bottom: #ddd 1px solid;
    }

    ul li h3:hover{
        color: #757575;
        background-color: #e5e5e5;
    }

    ul li h3.active {
        color: #757575;
        background-color: #f5f5f5;
    }

    ul li div{

        position: relative;

        width: 100%;
        height: 100px;

        background-color: #FFFFFF;

        word-break: break-all;
        word-wrap: break-word;

        overflow: auto;

        margin: 0;
        padding: 0;

        display: none;
    }

    ul li div span{

        position: relative;

        width: 100%;
        height: 100%;
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
      <a href="/ssmall/cartview" style="color:white">장바구니</a>
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
                  <b>나의 구매 내역</b>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/myPage_askRequest">
                  <span data-feather="users"></span>
                  <b>▶1:1 문의</b>
                </a>
              </li>
              <!-- <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="bar-chart-2"></span>
                  Reports
                </a> -->
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/myPage_askAS">
                  <span data-feather="layers"></span>
                  <b>A/S 서비스 신청</b>
                </a>
              </li>
            </ul>
          </div>
        </nav>
		</div>
    </div>
    
    <div class="accordion" style="position:fixed;left: 400px;width: 1200px;top: 100px;">
    <font size="5em">나의 1:1문의 내역</font>
    <table class="table table-nomargin" style="margin-bottom: 0px;">
           <thead>
           <tr><th style="min-width:40px" class="mobile-hide">번호</th><th style="width:60%; padding-left:12px !important;">제목</th><th style="min-width:80px;text-align:center;">이름</th><th style="min-width:45px;text-align:center;">추천</th><th style="width:15%;text-align:center;">날짜</th><th style="min-width:45px;text-align:center;">조회</th></tr>
           </thead>
    </table>
    <ul class="accordion1">
        <li class="accordion2">
            <h3 class="accordion3">↓ menu 1</h3>
            <div class="accordion3">
                21:9 Curved UltraWide QHD (3440*1440) display offers visual comfort with 2.4 times more visual information at one time than a Full HD monitor. And also, the QHD resolution’s 1440p vertical height allows you to use more vertically than a 29 inch 21:9 monitor.</p>
                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>


                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>

                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>
            </div>
        </li>
        <li class="accordion2">
            <h3 class="accordion3">↓ menu 2</h3>
            <div>
                21:9 Curved UltraWide QHD (3440*1440) display offers visual comfort with 2.4 times more visual information at one time than a Full HD monitor. And also, the QHD resolution’s 1440p vertical height allows you to use more vertically than a 29 inch 21:9 monitor.</p>
                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>


                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>

                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>
            </div>
        </li>
        <li class="accordion2">
            <h3 class="accordion3">↓ menu 3</h3>
            <div>
                21:9 Curved UltraWide QHD (3440*1440) display offers visual comfort with 2.4 times more visual information at one time than a Full HD monitor. And also, the QHD resolution’s 1440p vertical height allows you to use more vertically than a 29 inch 21:9 monitor.</p>
                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>


                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>

                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>
            </div>
        </li>
        <li class="accordion2">
            <h3 class="accordion3">↓ menu 4</h3>
            <div>
                21:9 Curved UltraWide QHD (3440*1440) display offers visual comfort with 2.4 times more visual information at one time than a Full HD monitor. And also, the QHD resolution’s 1440p vertical height allows you to use more vertically than a 29 inch 21:9 monitor.</p>
                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>


                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>

                <p class=''>
                    <strong>IPS Display</strong>
                    IPS ’s 178’ wide viewing angles, close to 180’, allow you to view the screen clearly without distortion. Also, the Curved IPS provides an immersive viewing angle covering the entire viewing angle around your range of vision.</p>
            </div>
        </li>
    </ul>
</div>
    
    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"><\/script>')</script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/sweetalert2.js"></script>

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
