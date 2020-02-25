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
<style>
.bg-light {
	background-color: rgba(149, 204, 210, 0.2)!important;
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
		
		<!--===================================서담 탬플릿============================================-->
		<div class="col-lg-9 col-xs-12 mobile-padding table-padding">
            <div class="post-element table-post hidden-xs">
                <div class="header mgothic"><a href="/all/1" style="color : #1c1c1c;">전체</a>

                </div>
                <div class="table-responsive">
                    <table class="table table-nomargin">
                        <thead>
                        <tr><th style="min-width:40px" class="mobile-hide">번호</th><th style="width:60%; padding-left:12px !important;">제목</th><th style="min-width:80px;text-align:center;">이름</th><th style="min-width:45px;text-align:center;">추천</th><th style="width:15%;text-align:center;">날짜</th><th style="min-width:45px;text-align:center;">조회</th></tr>
                        </thead>
                        <tbody> 

                            
                            <tr onclick="noticelink('http://m.coei.com/'); return false;" href="http://m.coei.com/?prev=1&amp;prev_content=/all" onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" style="">
                                <td class="mobile-hide" style="font-size : 11px;"><center>911221</center></td>
                                <td class="title title-align">
                                    <span class="label label-info">제휴</span>
                                    <a href="http://m.coei.com/?prev=1&amp;prev_content=/all" style="max-width: 327.816px;">
                                            <span class="">세상 쉬운 유학 준비! 종로유학원
                                            <img src="/statics/img/picture3.png" style="height : 14px ; margin-bottom : 2px; ">
                                        </span>
                                    </a>
                                    <!-- 
                                    -->
                                </td>
                               
                                    <td style="text-align:center;">진이뽀</td>
                                <td style="text-align:center;">91</td>
                                <td style="text-align:center;">12/21</td>
                                <td style="text-align:center;">920</td>
                            </tr>
    

                        
                            <tr id="bbb" onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" style=""><td class="mobile-hide" style="font-size : 11px;"><center>846111</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846111?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">동기나 선배들의 수준이 떨어져서 고민이신분도 있삼?
                                        
                                            
                                        </span>
                                    </a>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 0 l
                                    조회 1
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">0</td>
                                <td style="text-align:center;">0분 전</td>
                                <td style="text-align:center;">1</td>
                            </tr>
                        
                            <tr id="aaa" onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" style=""><td class="mobile-hide" style="font-size : 11px;"><center>846110</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="#" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">보통 폭력 사건에서 조언할때 왜 합의 보지 말라고 하는거야? 
                                        
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[2]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 0 l
                                    조회 26
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">0</td>
                                <td style="text-align:center;">1분 전</td>
                                <td style="text-align:center;">26</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" style=""><td class="mobile-hide" style="font-size : 11px;"><center>846109</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846109?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">은글슬쩍 코로나 관련 선 넘는 게시물 나오기 시작합니다
                                        
                                            
                                                <img src="/statics/img/picture3.png" style="height : 14px ; margin-bottom : 2px; ">
                                            
                                        </span>
                                    </a>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    아침부터60인분 l 추천 0 l
                                    조회 1
                                    <div>
                                
                                </div></div></td>
                                
                                    <td style="text-align:center;">아침부터60인분</td>
                                
                                <td style="text-align:center;">0</td>
                                <td style="text-align:center;">3분 전</td>
                                <td style="text-align:center;">1</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" style=""><td class="mobile-hide" style="font-size : 11px;"><center>846108</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846108?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">본인이 모르는 사이에
                                        
                                            
                                        </span>
                                    </a>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 0 l
                                    조회 29
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">0</td>
                                <td style="text-align:center;">4분 전</td>
                                <td style="text-align:center;">29</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" style=""><td class="mobile-hide" style="font-size : 11px;"><center>846107</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846107?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">애프터에서 연애경험 물어보면 좀 그런가
                                        
                                            
                                        </span>
                                    </a>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 0 l
                                    조회 12
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">0</td>
                                <td style="text-align:center;">4분 전</td>
                                <td style="text-align:center;">12</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" style=""><td class="mobile-hide" style="font-size : 11px;"><center>846105</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846105?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">우리동네가 실검에 오르는건 첨 봤네
                                        
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[2]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 0 l
                                    조회 78
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">0</td>
                                <td style="text-align:center;">5분 전</td>
                                <td style="text-align:center;">78</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''"><td class="mobile-hide" style="font-size : 11px;"><center>846103</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846103?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">목만 아파도 회사 쉬어야 할까
                                        
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[4]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 0 l
                                    조회 38
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">0</td>
                                <td style="text-align:center;">8분 전</td>
                                <td style="text-align:center;">38</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''"><td class="mobile-hide" style="font-size : 11px;"><center>846102</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846102?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">자취생 가성비 도시락 추천!
                                        
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[3]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 0 l
                                    조회 40
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">0</td>
                                <td style="text-align:center;">9분 전</td>
                                <td style="text-align:center;">40</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" style=""><td class="mobile-hide" style="font-size : 11px;"><center>846100</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846100?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">에어비앤비 환불말이야
                                        
                                            
                                        </span>
                                    </a>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 0 l
                                    조회 24
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">0</td>
                                <td style="text-align:center;">11분 전</td>
                                <td style="text-align:center;">24</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" style=""><td class="mobile-hide" style="font-size : 11px;"><center>846099</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846099?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="bolder" style="font-weight: bold">질본 발표, 속보 정리할게요
                                        
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[29]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 15 l
                                    조회 403
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">15</td>
                                <td style="text-align:center;">15분 전</td>
                                <td style="text-align:center;">403</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" style=""><td class="mobile-hide" style="font-size : 11px;"><center>846097</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846097?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">부동산 잘알 다미 있오?
                                        
                                            
                                        </span>
                                    </a>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 0 l
                                    조회 16
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">0</td>
                                <td style="text-align:center;">17분 전</td>
                                <td style="text-align:center;">16</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''"><td class="mobile-hide" style="font-size : 11px;"><center>846096</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846096?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">급작스럽게 씨파 진입하려고 결정했는데 필요 학점 학점은행제로 취득하는 게 나을까요?
                                        
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[2]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 0 l
                                    조회 42
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">0</td>
                                <td style="text-align:center;">17분 전</td>
                                <td style="text-align:center;">42</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''"><td class="mobile-hide" style="font-size : 11px;"><center>846095</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846095?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="bolder" style="font-weight: bold">같은 날에 찍힌짤...
                                        
                                            
                                                <img src="/statics/img/picture3.png" style="height : 14px ; margin-bottom : 2px; ">
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[18]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 17 l
                                    조회 360
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">17</td>
                                <td style="text-align:center;">18분 전</td>
                                <td style="text-align:center;">360</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''"><td class="mobile-hide" style="font-size : 11px;"><center>846094</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846094?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">24 여 모쏠다미
                                        
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[4]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 1 l
                                    조회 132
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">1</td>
                                <td style="text-align:center;">19분 전</td>
                                <td style="text-align:center;">132</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''"><td class="mobile-hide" style="font-size : 11px;"><center>846089</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846089?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">이번주에 영주권 때문에 급하게 미국간다....
                                        
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[7]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 4 l
                                    조회 230
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">4</td>
                                <td style="text-align:center;">26분 전</td>
                                <td style="text-align:center;">230</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''"><td class="mobile-hide" style="font-size : 11px;"><center>846087</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846087?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">수학과 데이트폭력 가해자는 왜 서대전에 사과했을까?
                                        
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[31]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 7 l
                                    조회 422
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">7</td>
                                <td style="text-align:center;">28분 전</td>
                                <td style="text-align:center;">422</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''"><td class="mobile-hide" style="font-size : 11px;"><center>846086</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846086?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">핑핑이의 코로나 타개책은 한국때리기인가봄
                                        
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[2]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 2 l
                                    조회 73
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">2</td>
                                <td style="text-align:center;">28분 전</td>
                                <td style="text-align:center;">73</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''"><td class="mobile-hide" style="font-size : 11px;"><center>846085</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846085?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">증명사진 찍는 남자친구
                                        
                                            
                                                <img src="/statics/img/picture3.png" style="height : 14px ; margin-bottom : 2px; ">
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[6]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 3 l
                                    조회 225
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">3</td>
                                <td style="text-align:center;">28분 전</td>
                                <td style="text-align:center;">225</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''"><td class="mobile-hide" style="font-size : 11px;"><center>846082</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846082?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">코로나때문에 내가 진짜 이상해졌어
                                        
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[3]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 5 l
                                    조회 183
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">5</td>
                                <td style="text-align:center;">33분 전</td>
                                <td style="text-align:center;">183</td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''"><td class="mobile-hide" style="font-size : 11px;"><center>846081</center></td>
                                <td class="title title-align">
                                    
                                    
                                    <a href="/content/846081?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                
                                        
                                        
                                            <span class="">아는 형 학습능력이 경이롭네
                                        
                                            
                                        </span>
                                    </a>
                                
                                    <span class="comment-num">[1]</span>
                                
                                
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                
                                
                                    <div class="desktop-hide" style="color : gray; font-size : 10px; margin-top : 5px; opacity : 0.9">
                                    익명 l 추천 0 l
                                    조회 138
                                
                                </div></td>
                                
                                    <td style="text-align:center;">익명</td>
                                
                                <td style="text-align:center;">0</td>
                                <td style="text-align:center;">33분 전</td>
                                <td style="text-align:center;">138</td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>


            </div>
            <div class="post-element table-post visible-xs">
                <div class="header"><a href="#" onclick="location.reload(true); return false;">전체</a>

                                          <div class="btn-group" style="float: right;">
                    <button type="button" class="btn btn-default" onclick="location.href='/write?board_no=11'"><span class="fa fa-pencil"></span></button>
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span class="caret"></span> <span class="sr-only">Toggle Dropdown</span> </button>
                    <ul class="dropdown-menu " style="min-width:0px !important;">
                        <li><a href="/me">내 정보</a></li>
                        <li><a href="/me/contents/1">내 글</a></li>
                        <li><a href="/me/comments/1">내 댓글</a></li>
                        <li><a href="/me/scrap/1">스크랩</a></li>
                    </ul>
                </div>

                </div>
                <div class="table-responsive table-responsivem">
                    <table class="table table-nomargin">
                        <thead>
                        
                        <tr><th style="min-width:40px" class="mobile-hide">번호</th><th style="width:60%; padding-left:12px !important;">제목</th><th style="min-width:80px;text-align:center;" class="mobile-hide">이름</th><th style="min-width:40px;text-align:center;" class="mobile-hide">추천</th><th style="width:15%;text-align:center;" class="mobile-hide">날짜</th><th style="min-width:40px;text-align:center;" class="mobile-hide">조회</th></tr>
                        </thead>
                        <tbody> 

                        
                            <tr onclick="noticelink('http://m.coei.com/'); return false;" href="http://m.coei.com/?prev=1&amp;prev_content=/all" onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''"><td class="mobile-hide"></td>
                                <td class="title title-align">
                                    <span class="label label-info">제휴</span>
                                
                                    <a href="http://m.coei.com/?prev=1&amp;prev_content=/all" style="max-width: 362.816px;">
                                      

                                    <span class="" style="font-size : 1em !important; color : black;">세상 쉬운 유학 준비! 종로유학원</span>
                                        
                                    </a>
                                  
                                </td>
                            </tr>
                    
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846111?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846111?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 동기나 선배들의 수준이 떨어져서 고민이신분도 있나여
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    취업게시판 &nbsp; 
                                        0분 전 &nbsp;l&nbsp; 조회 1 &nbsp;l &nbsp;추천 0
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846110?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846110?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 보통 폭력 사건에서 조언할때 왜 합의 보지 말라고 하는거야? 
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[2]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        1분 전 &nbsp;l&nbsp; 조회 26 &nbsp;l &nbsp;추천 0
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846109?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846109?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 은글슬쩍 코로나 관련 선 넘는 게시물 나오기 시작합니다
                                            
                                 
                                        
                                                <img src="/statics/img/picture3.png" style="height : 14px ; margin-bottom : 2px; ">
                                        
                                        </span>
                                    </a>

                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    문의 &nbsp; 
                                        3분 전 &nbsp;l&nbsp; 조회 1 &nbsp;l &nbsp;추천 0
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846108?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846108?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 본인이 모르는 사이에
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        4분 전 &nbsp;l&nbsp; 조회 29 &nbsp;l &nbsp;추천 0
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846107?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846107?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 애프터에서 연애경험 물어보면 좀 그런가
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    연애상담소 &nbsp; 
                                        4분 전 &nbsp;l&nbsp; 조회 12 &nbsp;l &nbsp;추천 0
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846105?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846105?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 우리동네가 실검에 오르는건 첨 봤네
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[2]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        5분 전 &nbsp;l&nbsp; 조회 78 &nbsp;l &nbsp;추천 0
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846103?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846103?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 목만 아파도 회사 쉬어야 할까
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[4]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        8분 전 &nbsp;l&nbsp; 조회 38 &nbsp;l &nbsp;추천 0
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846102?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846102?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 자취생 가성비 도시락 추천!
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[3]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        9분 전 &nbsp;l&nbsp; 조회 40 &nbsp;l &nbsp;추천 0
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846100?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846100?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 에어비앤비 환불말이야
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        11분 전 &nbsp;l&nbsp; 조회 24 &nbsp;l &nbsp;추천 0
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846099?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846099?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="bolder" style="font-weight: bold; font-size:12.2px;">질본 발표, 속보 정리할게요
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[29]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        15분 전 &nbsp;l&nbsp; 조회 403 &nbsp;l &nbsp;추천 15
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846097?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846097?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 부동산 잘알 다미 있오?
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        17분 전 &nbsp;l&nbsp; 조회 16 &nbsp;l &nbsp;추천 0
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846096?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846096?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 급작스럽게 씨파 진입하려고 결정했는데 필요 학점 학점은행제로 취득하는 게 나을까요?
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[2]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    CPA &nbsp; 
                                        17분 전 &nbsp;l&nbsp; 조회 42 &nbsp;l &nbsp;추천 0
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846095?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846095?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="bolder" style="font-weight: bold; font-size:12.2px;">같은 날에 찍힌짤...
                                            
                                 
                                        
                                                <img src="/statics/img/picture3.png" style="height : 14px ; margin-bottom : 2px; ">
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[18]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        18분 전 &nbsp;l&nbsp; 조회 360 &nbsp;l &nbsp;추천 17
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846094?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846094?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 24 여 모쏠다미
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[4]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        19분 전 &nbsp;l&nbsp; 조회 132 &nbsp;l &nbsp;추천 1
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846089?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846089?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 이번주에 영주권 때문에 급하게 미국간다....
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[7]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        26분 전 &nbsp;l&nbsp; 조회 230 &nbsp;l &nbsp;추천 4
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846087?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846087?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 수학과 데이트폭력 가해자는 왜 서대전에 사과했을까?
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[31]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        28분 전 &nbsp;l&nbsp; 조회 422 &nbsp;l &nbsp;추천 7
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846086?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846086?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 핑핑이의 코로나 타개책은 한국때리기인가봄
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[2]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        28분 전 &nbsp;l&nbsp; 조회 73 &nbsp;l &nbsp;추천 2
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846085?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846085?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 증명사진 찍는 남자친구
                                            
                                 
                                        
                                                <img src="/statics/img/picture3.png" style="height : 14px ; margin-bottom : 2px; ">
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[6]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        28분 전 &nbsp;l&nbsp; 조회 225 &nbsp;l &nbsp;추천 3
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846082?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846082?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 코로나때문에 내가 진짜 이상해졌어
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[3]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        33분 전 &nbsp;l&nbsp; 조회 183 &nbsp;l &nbsp;추천 5
                                    </div>
                                </td>
                            </tr>
                        
                            <tr onmouseover="this.style.backgroundColor='#F3F6F4'" onmouseout="this.style.backgroundColor=''" onclick="location.href='/content/846081?prev=1&amp;prev_content=/all'"><td class="mobile-hide"></td>
                                <td class="title title-align" style="min-width : 320px !important;">
                            
                                    
                                     
                                    <a href="/content/846081?prev=1&amp;prev_content=/all" style="max-width: 350px;">
                                    
                                        
                                      
                                            
                                                <span class="" style="font-size:12.2px;"> 아는 형 학습능력이 경이롭네
                                            
                                 
                                        
                                        </span>
                                    </a>

                                    
                                        <span class="comment-num">[1]</span>
                                    
                                    
                                    <img src="http://www.ssodam.com/statics/upload/9caf707000ae11e69c480242ac110004.png" style="height : 12px;">
                                        <!--span class="label label-danger new-mark">N</span-->
                                    
                                    <div class="desktop-hide" style="color : gray; font-size : 11px  ; margin-top : 5.2px; opacity : 0.7"> 

                                    익게2 &nbsp; 
                                        33분 전 &nbsp;l&nbsp; 조회 138 &nbsp;l &nbsp;추천 0
                                    </div>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>


            </div>
            <div id="pagenate"><div class="btn-group btn-pagenate" data-toggle="buttons"><button class="btn btn-red">1</button><a class="btn btn-default" href="http://www.ssodam.com/all/2">2</a><a class="btn btn-default" href="http://www.ssodam.com/all/3">3</a><a class="btn btn-default" href="http://www.ssodam.com/all/4">4</a><a class="btn btn-default" href="http://www.ssodam.com/all/5">5</a><a class="btn btn-default" href="http://www.ssodam.com/all/28359"><span class="glyphicon glyphicon-fast-forward" style="color : #6e6e6e "></span></a></div></div>


            <form class="col-xs-12 visible-xs" method="get" action="/all/1" accept-charset="UTF-8" style="margin-bottom:25px !important; padding-left:12px; padding-right:12px;">
            <div class="col-xs-3" style="padding:0px !important;border-radius: 0px;">     
                <select name="field" class="form-control" style="border-radius: 10px 0px 0px 10px; border-right:0px">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="all">제목+내용</option>
                </select>
            </div>
            <div class="col-xs-6" style="padding:0px !important;"> 
                <input type="text" name="q" class="form-control" style="width:100%; border-right:0px; border-radius: 0px !important;">
            </div>
            <div class="col-xs-3" style="padding:0px !important;">
                <button type="submit" class="btn btn-default" style="width:100%; border-radius: 0px 10px 10px 0px;"><i class="fa fa-search"></i>&nbsp;검색</button>
            </div>
            </form>
            <div class="visible-xs" style="padding-left:12px; padding-right:12px; margin-bottom:20px;">
                <a class="btn btn-red write" href="/write?board_no=11" style="width:100%; border-radius:10px;"><i class="glyphicon glyphicon-pencil"></i>&nbsp;글쓰기</a>
            </div>


            <form class="col-lg-5 searchbar hidden-xs" method="get" action="/all/1" accept-charset="UTF-8">
                <div class="col-lg-8" style="padding:5px 0px;">
                    <select name="field" class="form-control">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="all">제목+내용</option>
                    </select>
                    <input type="text" name="q" class="form-control" style="width:100%;">
                </div>
                <div class="col-lg-4" style="padding:5px;">
                    <button type="submit" class="btn btn-default" style="width:100%;"><i class="fa fa-search"></i>&nbsp;검색</button>
                </div>
            </form>
            <div class="col-lg-offset-5 col-lg-2 hidden-xs" style="padding:5px;">
                <a class="btn btn-red write" href="/write?board_no=11" style="width:100%;"><i class="glyphicon glyphicon-pencil"></i>&nbsp;글쓰기</a>
            </div>

            <div class="col-xs-12 visible-xs image">
                            <center>
            <!-- /21695859115/go_inner -->
            <div id="div-gpt-ad-1577958057211-0" data-google-query-id="CMq6q4LV6-cCFU5SvQodWTMGsg">
              
            <div id="google_ads_iframe_/21695859115/go_inner_0__container__" style="border: 0pt none; display: inline-block; width: 300px; height: 250px;"><iframe frameborder="0" src="https://tpc.googlesyndication.com/safeframe/1-0-37/html/container.html" id="google_ads_iframe_/21695859115/go_inner_0" title="3rd party ad content" name="" scrolling="no" marginwidth="0" marginheight="0" width="300" height="250" data-is-safeframe="true" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" data-google-container-id="3" style="border: 0px; vertical-align: bottom;" data-load-complete="true"></iframe></div></div>
            </center>
            </div>


        </div>
	<!--===================================서담 탬플릿============================================-->
       
      </div>
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
    	$('#aaa').click(function(){
    		var bbb = document.getElementById('bbb');
    		bbb.slideDown("slow");
    	});
   
    	
	    /* $('#aaa').click(function(){
	    	$('#bbb').slideDown();
	    },function(){
	    	$('#bbb').slideUp();	
	    });	 */
	    
    		
			
    		
	</script>

   
  </body>
</html>
