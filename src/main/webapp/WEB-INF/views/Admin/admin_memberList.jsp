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

    <title>상승몰 관리자 페이지</title>

    <!-- Bootstrap core CSS -->
  <!-- IonIcons -->
  
  
  <link rel="stylesheet" href="css/OverlayScrollbars.min.css">
  
  <link rel="stylesheet" href="css/sidemenu.css">
  
  <link rel="stylesheet" href="css/adminpage.css">
  
  <!-- Theme style -->
  <link rel="stylesheet" href="css/adminlte.min.css">
  
  
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  
  
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>


.dropdown button {
 display: block;    /* table */
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
  width:200%;

}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>



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
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="adminpage" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    

    
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="adminpage" class="brand-link">
      <img src="images/logo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">상승몰 관리자</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Alexander Pierce</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview"
         role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview">
            <div class="dropdown">
  <button class="dropbtn">사원관리</button>
  <div class="dropdown-content">
    <a href="admin_staff1">사원관리1</a>
    <a href="admin_staff2">사원관리2</a>
    <a href="admin_staff3">사원관리3</a>
  </div>
</div>

<li class="nav-item has-treeview">
            <div class="dropdown">
  <button class="dropbtn">회원관리</button>
  <div class="dropdown-content">
    <a href="admin_member1">회원관리1</a>
    <a href="admin_member2">회원관리2</a>
    <a href="admin_member3">회원관리3</a>
  </div>
</div>

<li class="nav-item has-treeview">
            <div class="dropdown">
  <button class="dropbtn">게시판관리</button>
  <div class="dropdown-content">
    <a href="admin_board1">게시판관리1</a>
    <a href="admin_board2">게시판관리2</a>
    <a href="admin_board3">게시판관리3</a>
  </div>
</div>

<li class="nav-item has-treeview">
            <div class="dropdown">
  <button class="dropbtn">상품관리</button>
  <div class="dropdown-content">
    <a href="admin_product1">상품관리1</a>
    <a href="admin_product2">상품관리2</a>
    <a href="admin_product3">상품관리3</a>
  </div>
</div>

<li class="nav-item has-treeview">
            <div class="dropdown">
  <button class="dropbtn">A/S서비스관리</button>
  <div class="dropdown-content">
    <a href="admin_AS1">A/S서비스관리1</a>
    <a href="admin_AS2">A/S서비스관리2</a>
    <a href="admin_AS3">A/S서비스관리3</a>
  </div>
</div>

<li class="nav-item has-treeview">
            <div class="dropdown">
  <button class="dropbtn">주문관리</button>
  <div class="dropdown-content">
    <a href="admin_order1">주문관리1</a>
    <a href="admin_order2">주문관리2</a>
    <a href="admin_order3">주문관리3</a>
  </div>
</div>




            </ul>
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
    
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.0.2
    </div>
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->





<script>
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */

</script>

</body>
</html>
  