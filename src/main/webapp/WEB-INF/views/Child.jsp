<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <style>
      * {
        font-size: 16px;
        font-family: Consolas, sans-serif;
      }
    </style>
   

</head>
<body>
<br>
<form action="modifyReply2" method="post">
    <b><font size="5" color="gray">자식창</font></b>
    <br><br>
    <p></p>
    <!-- <input id="bid" type="hidden" name="bid" value="281"> -->
    <input type="hidden" name="bid" id="childBid">
    <input type="text" name="btitle" id="btitle" size="50" style="width=100%"><br><br>   
    <textarea name="bcontent" rows="10" cols="50" ></textarea>
    <input type="submit" value="입력" id="child" onclick="window.close()">
</form>

<script>

/* $(function(){
	$(document).on("click","#child",function(){
		alert($(this).attr("value"));
		console.log("modifyBoard탐");
		var form = $("form[role='form']");
		form.attr("action",
				"/ssmall/modifyReply2");
		form.attr("method","get");
		console.log("jsp 수정아래")
		form.submit();

	})
}) */
</script>
</body>
</html>