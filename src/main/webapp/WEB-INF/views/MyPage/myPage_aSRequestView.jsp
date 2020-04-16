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
    
    ul li {
		border-bottom: 1px solid #bebebe;
    }

    ul li h3 {

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
        height: 400px;

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
              <!-- <li class="nav-item">
                <a class="nav-link active" href="#">
                  <span data-feather="home"></span>
                  Dashboard <span class="sr-only">(current)</span>
                </a> 
              </li>-->
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
                  <b>나의 환불 내역</b>
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
                  <b>▶A/S 서비스 신청</b>
                </a>
              </li>
            </ul>
          </div>
        </nav>
		</div>
    </div>
    
    <div class="accordion" style="position:fixed;left: 400px;width: 1200px;top: 100px;">
    <font size="6em">나의 A/S 서비스 신청 내역</font>
    <table class="table table-nomargin" style="margin-bottom: 0px;margin-top: 30px;">
           <thead>
           <th style="width:60%; padding-left:12px !important;">제목(작성날짜)</th>
           </thead>
    </table> 
    <ul class="accordion1" style="height: 220px;">
    	<c:forEach items="${aSRequestboards}" var="aSRequestboards" varStatus="status">
        <li class="accordion2">
            <c:choose>
            	<c:when test="${aSRequestboards.banswered eq '답변완료'}">
            		<h3 style="font-size:16px; color:green;" class="accordion3">
            		<c:out value = "${aSRequestboards.btitle}"/><c:out value = " (${aSRequestboards.bdate})"/><c:out value = " (${aSRequestboards.banswered})"/>
            		<button onclick="window.location.href='/ssmall/mypage/myPage_askAS2?bId=${aSRequestboards.bid}'" style="position:fixed;left: 1505px;"><font size="4em" style="border:1px solid gray; border-radius: 5px 5px 5px 5px; background-color:#98ebdc">수정</font></button>
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
        				    	window.location.href='/ssmall/mypage/delete2.do?bId=' + ${aSRequestboards.bid};
    	    				});
        				  }
        				})" style="position:fixed;left: 1550px;">
            		<font size="4em" style="border:1px solid black; border-radius: 5px 5px 5px 5px; background-color:#FF99CC">삭제</font>
            		</button>
            		</h3>
            	</c:when>
            	<c:otherwise>
            		<h3 style="font-size:16px; color:red;" class="accordion3">
            		<c:out value = "${aSRequestboards.btitle}"/><c:out value = " (${aSRequestboards.bdate})"/><c:out value = " (${aSRequestboards.banswered})"/>
            		<button onclick="window.location.href='/ssmall/mypage/myPage_askAS2?bId=${aSRequestboards.bid}'" style="position:fixed;left: 1505px;"><font size="4em" style="border:1px solid gray; border-radius: 5px 5px 5px 5px; background-color:#98ebdc">수정</font></button>
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
        				    	window.location.href='/ssmall/mypage/delete2.do?bId=' + ${aSRequestboards.bid};
    	    				});
        				  }
        				})" style="position:fixed;left: 1550px;">
            		<font size="4em" style="border:1px solid black; border-radius: 5px 5px 5px 5px; background-color:#FF99CC">삭제</font>
            		</button>
            		</h3>
            	</c:otherwise>
            </c:choose>
            <div class="accordion3">
              <p><b>A/S 신청 제품명:</b>${aSRequestboards.btitle}</p>
            	<br/>
            	<p><b>A/S 신청 내용:</b>${aSRequestboards.bcontent}</p>
            	<br/>
            	=======================================================================================================================
            	<br/>
            	<br/>
              	<p><b>답변 제목:</b>${aSRequestboardsAnswers[status.index].btitle}</p>
              	<br/>
              	<p><b>답변 내용:</b>${aSRequestboardsAnswers[status.index].bcontent}</p>
            </div>
        </li>
        </c:forEach>
        <ul class="pagination m-5 flex-c-m" >
					<c:if test="${pageMaker.prev}"><!--pageMaker.getprev출력, 트루이게되면 링크를걸음 -->
						<li class="page-item"><a class="page-link"  href="/ssmall/mypage/myPage_aSRequestView${pageMaker.makeQuery(pageMaker.startPage - 1) }">이전</a></li>
						<!--get방식의 key value를 넘김, 함수를 다이렉트로 추출하는 소스(직접호출) -->
					</c:if>
				<!-- var="idx"하게되면 1씩증가  -->
				
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
						<c:out value="${pageMaker.cri.page == idx?'':''}" />
						<li class="page-item"><a class="page-link" href="/ssmall/mypage/myPage_aSRequestView${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>
					
					
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="page-item"><a class="page-link" href="/ssmall/mypage/myPage_aSRequestView${pageMaker.makeQuery(pageMaker.endPage +1) }"> 다음 </a></li>
					</c:if>
			</ul>
        <button onclick="window.location.href='/ssmall/mypage/myPage_askAS'" style="margin-top: 0px;margin-left: 500px;"><font size="5em" style="border:1px solid black; border-radius: 5px 5px 5px 5px; background-color:#99FFFF">A/S서비스 신청하기</font></button>

    </ul>
    
</div>
<!-- onclick="window.location.href='/ssmall/myPage_askAS'" -->

    
    

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
