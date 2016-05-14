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
받은 순번 : <%=request.getParameter("seq") %><br>
받은 아이디 : <%=request.getParameter("userID") %> <br>
받은 물품명 : <%=request.getParameter("productName") %> <br>
받은 종류 : <%=request.getParameter("type") %> <br>
받은 단가 : <%=request.getParameter("price") %> <br>
받은 수량 : <%=request.getParameter("amount") %> <br>

</body>
</html>