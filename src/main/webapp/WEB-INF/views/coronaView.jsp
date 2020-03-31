<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="table-responsive"> 
		<table class="table table-list-search">
			<tr>
				<th style="text-align: center">이름</th>
				<th style="text-align: center">주소</th>
				<th style="text-align: center">판매처</th>
				<th style="text-align: center">위도</th>
				<th style="text-align: center">경도</th>
				<th style="text-align: center">입고시간</th>
				<th style="text-align: center">재고상태</th>
				<th style="text-align: center">데이터생성일자</th>
			</tr>
			<c:forEach items="${list}" var="list">
			<tr>
				<td style="text-align: center">${list.name}</td>
				<td style="text-align: center">${list.addr}</td>
				<td style="text-align: center">${list.type}</td>
				<td style="text-align: center">${list.lat}</td>
				<td style="text-align: center">${list.lng}</td>
				<td style="text-align: center">${list.stock_at}</td>
				<td style="text-align: center">${list.remain_stat}</td>
				<td style="text-align: center">${list.created_at}</td>	
			</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>