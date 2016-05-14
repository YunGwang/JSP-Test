<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %> <!-- 한글 깨짐 방지 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 조회 화면</title>
</head>
<body>
<center></center>
<h1>메인 화면</h1>
<form method = post name = form1 action = "event.jsp">
<input type = submit value = "회원가입"><br>
</form>
<form method = post name = form2 action = "buy.jsp">
<input type = submit value = "물품 구매"><br>
</form>
<HR>

</body>
</html>