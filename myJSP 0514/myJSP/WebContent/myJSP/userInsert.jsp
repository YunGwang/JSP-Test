<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %> <!-- 한글 깨짐 방지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
받은 아이디 : <%=request.getParameter("userID") %><br>
받은 이름 : <%=request.getParameter("userName") %> <br>
받은 생년 : <%=request.getParameter("birth") %> 
받은 월 : <%=request.getParameter("month") %> 
받은 일 : <%=request.getParameter("day") %> <br>
받은 지역 : <%=request.getParameter("area") %> <br>
받은 국번 :  <%=request.getParameter("num") %> <br>
받은 전화번호 : <%=request.getParameter("call") %> <br>
받은 키 : <%=request.getParameter("height") %> <br>
받은 가입입 : <%=request.getParameter("date") %> <br>

</body>
</html>