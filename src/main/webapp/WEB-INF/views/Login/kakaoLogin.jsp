<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>상승몰</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	
</head>

<body>

	<form:form id="login" action="/ssmall/login"  class="login100-form validate-form" method="post" name="login">																
		<input id= "m_id" class="input100" type="hidden" name="m_id" value="${member.m_id}">
		<input id= "m_password" class="input100" type="hidden" name="m_password" value="${member.m_kakao}">				
	</form:form>
	
	<script>
		document.login.submit();
	</script>
</body>
</html>