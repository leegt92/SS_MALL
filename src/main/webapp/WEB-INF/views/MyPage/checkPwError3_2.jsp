<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<style>

.bg-light {
   background-color: rgba(149, 204, 210, 0.2)!important;
}
 ul li {
      border-bottom: 1px solid #bebebe;
    }
    
    
 table#tabletype {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}
table#tabletype th {
 
    width: 200px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table#tabletype td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    
}
#name{
   color:black;
}

</style>
  </head>

  <body>
  
     <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
      <a href="/ssmall" class="logo"><img src="/ssmall/images/icons/mainlogo.png" alt="IMG-LOGO" style="
    width: 200px;
    height: 60px;
    "></a>
      <a href="/ssmall" style="color:white">홈</a>
      <a href="/ssmall/productView" style="color:white">상품</a>
      <a href="/ssmall/cart/cartView" style="color:white">장바구니</a>
      <a href="/ssmall/boardnoticeView" style="color:white">공지사항</a>
      <a href="/ssmall/companyView" style="color:white">회사소개</a>
     
      <ul class="navbar-nav px-3">
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
        <nav class="col-md-2 d-none d-md-block bg-light sidebar m-t-37" style = "width:320px;top: 23px;">
          <div class="sidebar-sticky">
             <h3><a href="/ssmall/mypage/myPage_orderedList" style="color:black">MyPage</a></h3>
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
                  <b>▶회원 정보 수정</b>
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
                <a class="nav-link" href="/ssmall/mypage/myPage_askRequestView">
                  <span data-feather="users"></span>
                  <b>1:1 문의</b>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/mypage/myPage_refundList">
                  <span data-feather="shopping-cart"></span>
                  <b>나의 환불 내역</b>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/ssmall/mypage/myPage_aSRequestView">
                  <span data-feather="layers"></span>
                  <b>A/S 서비스 신청</b>
                </a>
              </li>
            </ul>
          </div>
        </nav>
      
      <div class="limiter" style="position:fixed;left:550px;top: 100px;">
      <div class="container-login100"><!-- style="background-color: #f8f8f8;width: 660px;height: 686px;" -->
         <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">

            
            <form:form id = "reviseInformation" action="/ssmall/mypage/myPage_reviseInformation2_2" class="container-login100">

               
               <!-- <span class="login100-form-title p-b-49" style="position:absolute;left: 245px;bottom: 700px;width: 300px;right: 0px;"   ><font size="5em"><b>회원정보 수정</b></font></span> -->
                   <h1 id="name">회원 정보 수정</h1>
         
               <table id="tabletype"class="table table-list-search">
                      <tr>
                          <th >
                        <div class="wrap-input100 validate-input m-b-23"
                           data-validate="아이디 입력해주세요">
                     
                     
                        <span class="label-input100"><font size="4em" color="black">아이디</font></span></div> 
                     </th>
                     <td>
                        <div><font color="black"><c:out value="${m_id}"/> </font></div>
                        <span class="focus-input100"data-symbol="&#xf206;"></span>
                        <p>(아이디는 수정이 불가합니다.)</p>
                        <div id="id_check"></div>
                     </td>
                  </tr>      
               <tr>
                  <th>
                     <div class="wrap-input100 validate-input m-b-23"
                        data-validate="이름 입력해주세요">
                        <span class="label-input100"><font size="4em" color="black">이름</font></span></div>
                  </th>
                  <td >
                     <div><font color="black"><c:out value="${m_name2}"/></font></div>
                     <span class="focus-input100" data-symbol="&#xf206;"></span>
                     <p>(이름은 수정이 불가합니다.)</p>
                  </td>
               
               </tr>
            
            <tr>
               <th>
                  <div class="wrap-input100 validate-input m-b-23"
                     data-validate="나이 입력해주세요">
                  <span class="label-input100"><font size="4em" color="black">나이</font></span></div>
               </th>
               <td>
                  <div class="form-control" >
                     <input id="m_age" class="input100" type="text" name="m_age" placeholder="<c:out value="${m_age3}"/>(클릭하여 수정할 값을 입력하세요)" maxlength="2" style="width: 545px;">
                  
                     <span class="focus-input100" data-symbol="&#xf206;"></span>
                  </div>
                  
               </td>
            </tr>
         
            <tr>
               <th>
                  <div class="wrap-input100 validate-input m-b-23"
                     data-validate="이메일 입력해주세요">
   
                     <span class="label-input100"><font size="4em" color="black">이메일</font></span></div>
               </th>
               <td >
                      <div ><font color="black"><c:out value="${m_email}"/> </font></div> <span
                        class="focus-input100" data-symbol="&#xf206;"></span>
                        <p>(이메일은 수정이 불가능합니다.)</p>
               </td>
            </tr>
            <tr>
               <th>
                  <div class="wrap-input100 validate-input m-b-23"
                     data-validate="배송지 입력해주세요">
               
                     <span class="label-input100"><font size="4em" color="black">주소 수정</font></span>
                  </div>
               </th>
               <td > 
                  <div class="form-control" >
                     <input id="m_adress" class="input100"
                        type="text" name="m_adress" placeholder="<c:out value="${m_adress2}"/>(클릭하여 수정할 값을 입력)" style="width: 545px;"> <span
                        class="focus-input100" data-symbol="&#xf206;"></span>
                  <!-- </div> -->
                  </div>
               </td>
            </tr>
         
            <tr>
               <th>   
                  <div class="wrap-input100 validate-input m-b-23"
                     data-validate="핸드폰번호 입력해주세요">
               
                     <span class="label-input100"><font size="4em" color="black">핸드폰번호</font></span>
                  </div>
               </th>
               <td > 
                  <div class="form-control">
                     <input id = "m_phonenum" class="input100"
                        type="text" name="m_phonenum" placeholder="<c:out value="${m_phonenum2}"/>(클릭하여 수정할 값을 입력하세요)"
                        maxlength="11" style="width: 545px;"> <span class="focus-input100"
                        data-symbol="&#xf206;"></span>
                  </div>
               </td>
               <!--    </div>-->
            </tr>
            <tr>
                <th>
                  <div class="wrap-input100 validate-input m-b-23">
               
                     <span class="label-input100"><font size="4em" color="black">이메일 수신여부</font></span> 
                  </div>
               </th>
               <td >
                     <input type="radio"name="m_receive_email" value="1" style="position:fixed;top: 680px;" >
                     <font size="2em" color="black" style="position:absolute;left:300px;bottom: 193px;width: 300px;right: 0px;">광고성 이메일을 수신하겠습니다.</font> 
                     <input type="radio"name="m_receive_email" value="0" style="position:fixed;top: 705px;"><font size="2em" color="black" style="position:absolute;left: 300px;bottom: 166px;width: 300px;right: 0px;">광고성 이메일을 수신하지 않겠습니다.</font>
               </td>
               
            </tr>
         </table>

               <div class="flex-c-m">
                  <button id="revise_submit" class="btn btn-info" style="position:fixed;top: 800px;left: 900px;">수정완료</button>
                  <button id="withdraw_submit" class="btn btn-dark" style="
                      position:fixed;
                      margin-left: 10px;
                      padding-left: 0px;
                      padding-bottom: 0px;
                      padding-top: 0px;
                      padding-right: 0px;
                      top: 800px;
                      left: 990px;
                      height: 35px;
                      ">
                      
               </div>
            </form:form>

            
            <form:form action="myPage_reviseInformation3" class="login100-form validate-form" method="POST">
                <input class="btn btn-danger" type="submit" value="회원탈퇴" style="
                
                margin-left: 410px;
                  margin-top: 40px;">
            </form:form>   
            
          
      </div>
   </div>
</div>
 </div>
 </div>

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
    Swal.fire({
		icon: 'error',
		position: 'center',
		title: '수정사항 미입력',
		text: '수정할 사항을 입력해 주세요.',	
		}).then(function() {
			window.location = "/ssmall/mypage/myPage_reviseInformation2-3";
		});
	</script>

    
  </body>
</html>
