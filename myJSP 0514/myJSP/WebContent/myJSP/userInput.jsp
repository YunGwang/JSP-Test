<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %> <!-- 한글 깨짐 방지 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 받은 이름 : <%=request.getParameter("userName") %><br>
받은 직업 : <%=request.getParameter("job") %> <br>
관심 분야 : <% 
	String fv[] = request.getParameterValues("favorite"); 

	for ( String f : fv){ //몇 개를 받던지 출력해라ㅌ
		out.println(f + "<br>"); 
		
	}
 %> 

</body>
</html>