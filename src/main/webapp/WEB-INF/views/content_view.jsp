<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <title>SS_MALL</title>
   <meta charset="UTF-8">

   <meta name="viewport" content="width=device-width, initial-scale=1">
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
   #content{
      width:1000px;
      margin: 0 auto;
   }
   #content th{
    color:black;
   }
   #content h1{
    text-align:center;
    color:black;
    letter-spacing:10px;
   
    
   }
       
</style>
</head>
<body class="animsition" background-color="#F8F8F8"><!-- class="animsition" -->
   
   <!-- Header -->
   <header class="header-v4">
      <!-- Header desktop -->
      <div class="container-menu-desktop">
         <!-- Topbar -->
         <div class="top-bar">
            <div class="content-topbar flex-sb-m h-full container">
               <div class="left-top-bar">                  
                  SSMALL with luxury watches and wallets
               </div>

               <div class="right-top-bar flex-w h-full">
                  <a href="homeview" class="flex-c-m trans-04 p-lr-25">
                     Home
                  </a>
                  
                  <a href="/ssmall/mypage/myPage_orderedList" class="flex-c-m trans-04 p-lr-25">
                     My
                  </a>
                  
                  <a href="cartView" class="flex-c-m trans-04 p-lr-25">
                     Cart
                  </a>

                  <a href="companyView" class="flex-c-m trans-04 p-lr-25">
                     About Us
                  </a>
               
               </div>
            </div>
         </div>

         <div class="wrap-menu-desktop how-shadow1">
            <nav class="limiter-menu-desktop container">
               
               <!-- Logo desktop -->      
               <a href="homeview" class="logo">
                  <img src="images/icons/productlogo.png" alt="IMG-LOGO">
               </a>

               <!-- Menu desktop -->
               <div class="menu-desktop">
                  <ul class="main-menu">
                     <li>
                        <a href="homeview">홈</a>                        
                     </li>

                     <li>
                        <a href="productView">상품</a>
                     </li>
         
                     <li>
                        <a href="boardnoticeView">공지사항</a>
                     </li>

                     <li>
                        <a href="companyView">회사소개</a>
                     </li>
                     
                     <li>
                        <a href="asView">AS</a>
                     </li>   
      				
      				 <li>
						<a href="#" onclick="chat();">채팅</a>
					 </li>
                  </ul>
               </div>            
            </nav>
         </div>   
      </div>

      <!-- Header Mobile -->
      <div class="wrap-header-mobile">
         <!-- Logo moblie -->      
         <div class="logo-mobile">
            <a href="homeview"><img src="images/icons/productlogo.png" alt="IMG-LOGO"></a>
         </div>

         <!-- Button show menu -->
         <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
            <span class="hamburger-box">
               <span class="hamburger-inner"></span>
            </span>
         </div>
      </div>


      <!-- Menu Mobile -->
      <div class="menu-mobile">
         
         <ul class="main-menu-m">
            <li>
               <a href="homeview">홈</a>
               <span class="arrow-main-menu-m">
                  <i class="fa fa-angle-right" aria-hidden="true"></i>
               </span>
            </li>

            <li>
               <a href="productView">상품</a>
            </li>
            
            
            
            <li>
               <a href="boardnoticeView">공지사항</a>
            </li>
            

            <li>
               <a href="companyView">회사소개</a>
            </li>

            <li>
               <a href="asView">AS</a>
            </li>
            
            <li>
				<a href="#" onclick="chat();">채팅</a>
			</li>
         </ul>
      </div>

      <!-- <!-- Modal Search 
      <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
         <div class="container-search-header">
            <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
               <img src="images/icons/icon-close2.png" alt="CLOSE">
            </button>

            <form class="wrap-search-header flex-w p-l-15">
               <button class="flex-c-m trans-04">
                  <i class="zmdi zmdi-search"></i>
               </button>
               <input class="plh3" type="text" name="search" placeholder="Search...">
            </form>
         </div>
      </div> -->
   </header> 

   
   
   <!-- breadcrumb -->
   <div class="container">
      <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
         <a href="homeview" class="stext-109 cl8 hov-cl1 trans-04">
            홈
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
         </a>

         <span class="stext-109 cl4">
            공지사항
         </span>
      </div>
   </div>

   
      <div id="content">
          <form action="modify" method="post">
          <input type="hidden" name="bId" value="${content_view.bId}" >
           <table class="table table-list-search " >      
               <c:choose>
                  <c:when test="${content_view.bType eq '공지사항'}">
                     <h1 class="m-5" >공지사항</h1>
                  </c:when>
                  <c:otherwise>
                     <h1 class="m-5" >혜택</h1>
                  </c:otherwise>
               </c:choose>
 
                <tr>
                  <td>${content_view.bTitle}</td>
               </tr> 
                
                <tr>
                   
                  <td><div style="overflow:auto;  heigth:auto; width:1000px;">${content_view.bContent}</div></td>
               
               </tr> 
               <tr>
	               	<td style="text-align: right;">
	               		<a  href="boardnoticeView" class="btn btn-primary ">공지사항 목록보기</a>
	       			  	<a style="text-align: right;" href="boardgradenoticeView" class="btn btn-primary ">혜택 목록보기</a>
	               	</td>
               </tr>
           
         </table>
          </form>
         
         <br><br>
      
      </div>                  
            
            <%-- <tr>
                  <td colspan="2"> <!-- <input type="submit" value="수정"> &nbsp;&nbsp; -->  &nbsp;&nbsp; <a href="delete?bId=${content_view.bId}">삭제</a> &nbsp;&nbsp; <a href="reply_view?bId=${content_view.bId}">답변</a></td>
               </tr> --%>            
      



      <!-- Footer -->
   <footer class="bg3 p-t-75 p-b-32" style="position:relative; bottom:0px; top:60px;">
      <div class="container">
         <div class="row">
            <div class="col-sm-6 col-lg-2 p-b-50">
               <h4 class="stext-500 cl0 p-b-30">
                  Category
               </h4>

               <ul>
                  <li class="p-b-10">
                     <a href="productViewWatch" class="stext-130 cl7 hov-cl1 trans-04">
                        Watch
                     </a>
                  </li>

                  <li class="p-b-10">
                     <a href="productViewWallet" class="stext-130 cl7 hov-cl1 trans-04">
                        Wallet
                     </a>
                  </li>

               
               </ul>
            </div>

            <div class="col-sm-6 col-lg-3 p-b-50">
               <h4 class="stext-500 cl0 p-b-30">
                  Help
               </h4>


                  <p class="stext-130 cl7 size-201">
                     ● 대표 전화번호: 02-1234-5678
                  </p>
                  <p class="stext-130 cl7 size-201">
                     ● 고객센터 : 1234-5678
                  </p>
                  <p class="stext-130 cl7 size-201">● 이메일문의 :<a href="mailto:abcdefg@abcdefg.com" title="이메일 문의"class="stext-130 cl7 size-201">
                      abcdefg@abcdefg.com
                  </a></p>
                  <p class="stext-130 cl7 size-201">
                     ● FAQ
                  </p>
               
               
            </div> 

            <div class="col-sm-2 col-lg-50 p-b-40" >
               <h4 class="stext-500 cl0 p-b-30">
                  Directions
             </h4>
                <button id="map1" type="button"class="btn btn-link stext-130 cl7 hov-cl1 trans-04">오시는 길</button> 
                  
               
         </div>
            
            <div class="col-sm-2 col-lg-40 p-b-40" >
               <h4 class="stext-500 cl0 p-b-30">
                  SNS Page
                </h4>
                   
               <div class="p-t-10">         
                  <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-width="" data-layout="standard" data-action="like" data-size="small" data-share="true">         
                           <a href="https://www.facebook.com/ssmall1111111" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                              <i class="fa fa-facebook"></i>
                           </a>
               
                  
                     <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                        <i class="fa fa-instagram"></i>
                     </a>
               
               
                     <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                        <i class="fa fa-twitter"></i>
                     </a>
                  </div>
               </div>
            </div>
            
              <div class="col-sm-6 col-lg-3 p-b-50">
                 <img src="images/icons/mainlogo.png" width="500">
            </div>  
         </div>
         

         <div class="p-t-40">
            <div class="flex-c-m flex-w p-b-18">
               <a href="#" class="m-all-1">
                  <img src="images/icons/icon-pay-01.png" alt="ICON-PAY">
               </a>

               <a href="#" class="m-all-1">
                  <img src="images/icons/icon-pay-02.png" alt="ICON-PAY">
               </a>

               <a href="#" class="m-all-1">
                  <img src="images/icons/icon-pay-03.png" alt="ICON-PAY">
               </a>

               <a href="#" class="m-all-1">
                  <img src="images/icons/icon-pay-04.png" alt="ICON-PAY">
               </a>

               <a href="#" class="m-all-1">
                  <img src="images/icons/icon-pay-05.png" alt="ICON-PAY">
               </a>
            </div>

            <p class="stext-107 cl6 txt-center">
               <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

            </p>
         </div>
      </div>
   </footer>
   
      



   <!-- Back to top -->
   <div class="btn-back-to-top" id="myBtn">
      <span class="symbol-btn-back-to-top">
         <i class="zmdi zmdi-chevron-up"></i>
      </span>
   </div>
   

<!--===============================================================================================-->   
   <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
   <script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
   <script src="vendor/bootstrap/js/popper.js"></script>
   <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
   <script src="vendor/select2/select2.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
   <script type="text/javascript">
      $(function(){
         CKEDITOR.replace('notice',{extraPlugins : 'confighelper',
            filebrowserUploadUrl: '${pageContext.request.contextPath}/mypage/mine/imageUpload.do?${_csrf.parameterName}=${_csrf.token}'
         });
      });
   </script> 
   <script>
      $(".js-select2").each(function(){
         $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
         });
      })
   </script>
<!--===============================================================================================-->
   <script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
<script src="js/main.js"></script>
       
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5630cc013f43366cb57b2e70f3f6e69c"></script>
   <script>
      $('#map1').click(function(){
         var container = document.getElementById('map1');
          var options = {
            center: new kakao.maps.LatLng(37.552475, 126.937825),
            level: 3
         }; 
          window.open("https://map.kakao.com/link/to/비트캠프 신촌센터,37.552475, 126.937825");

      });
   </script> 
   <span class="bt-basic" id="map"></span> 
<!--===============================================================================================-->
<script>
$(document).ready(function() {

   // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
   var floatPosition = parseInt($("#floatMenu").css('top'));
   // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

   $(window).scroll(function() {
      // 현재 스크롤 위치를 가져온다.
      var scrollTop = $(window).scrollTop();
      var newPosition = scrollTop + floatPosition + "px";

      /* 애니메이션 없이 바로 따라감
       $("#floatMenu").css('top', newPosition);
       */

      $("#floatMenu").stop().animate({
         "top" : newPosition
      }, 300);

   }).scroll();
});
</script>
<!--===============================================================================================-->
   
   <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
   <script>
      $('.js-pscroll').each(function(){
         $(this).css('position','relative');
         $(this).css('overflow','hidden');
         var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
         });

         $(window).on('resize', function(){
            ps.update();
         })
      });
   </script>
<!--===============================================================================================-->
   <script src="js/main.js"></script>
   <script>
   function scroll_follow( id )
      {
        $(window).scroll(function( )  //스크롤이 움직일때마다 이벤트 발생
        { 
            var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
            $( id ).stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
         });
      }
       scroll_follow( "#scroll" );
 </script>
  <script src="/ssmall/js/chat.js"></script>

</body>
</html>