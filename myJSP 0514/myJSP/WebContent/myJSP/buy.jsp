<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %> <!-- 한글 깨짐 방지 -->
<html>
<%
// (0) 필요한 변수를 미리 정의 하자.
Connection conn = null;
PreparedStatement pstmt = null;
String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://127.0.0.1/sqlDB";
String db_user = "root";
String db_pass = "1234";
// --------------------------- //
try {
	// (1) 드라이버 로딩
	Class.forName(jdbc_driver);
	
	// (2) 데이터베이스 연결
	conn = DriverManager.getConnection(jdbc_url, db_user, db_pass);
	
	// (3) Statement 생성 (쿼리문 생성)
	String sql = "INSERT INTO buyTBL VALUES(?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("num"));
	pstmt.setString(2, request.getParameter("userID"));
	pstmt.setString(3, request.getParameter("prodName"));
	pstmt.setString(4, request.getParameter("groupName"));
	pstmt.setString(5, request.getParameter("price"));
	pstmt.setString(6, request.getParameter("amount"));
	
	// (4) SQL문 전송
	if (request.getParameter("num") != null){
		pstmt.executeUpdate();
	}

} catch ( Exception e) {
	System.out.println(e);
}

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매 조회 화면</title>
</head>
<body>
<center></center>
<h1>물품 구매</h1>
<form metdod = post name = form1 action = "buy.jsp">
순번 : <input type = text name = num> <br>
아이디 : 
<%
try {
String sql1 = "select distinct userID from userTBL";
pstmt = conn.prepareStatement(sql1); 

ResultSet rs1 = pstmt.executeQuery(); %>
<select name = userID>
<% while( rs1.next()){ %>
<option><%=rs1.getString("userID") %></option>
<%}%>
</select>
<%
rs1.close();
}catch ( Exception ee){
	System.out.println(ee);
}
%> <br>
상품명 : <input type = text name = prodName><br>
카테고리 : <input type = text name = groupName><br>
가격 : <input type = text name = price><br>
수량 : <input type = text name = amount><br>
<input type = submit value = "물품 구매"><br>
</form>
<HR>
</center>
### 조회 결과 ###<P>
<% 
try{
	// (3) Statement 생성
	
	String sql = "select a.num, a.userID, b.name, a.prodName, a.groupName, a.price, a.amount from buyTBL a INNER JOIN userTBL b ON a.userID = b.userID";
	pstmt = conn.prepareStatement(sql);
	
	// (4) SQL문 실행 & (5) 결과 받기
 	ResultSet rs = pstmt.executeQuery(); 
	
	// rs를 사용하는 코딩
	%>
	<% while( rs.next()){%>
		<Table border = 1 width = 600 height = 50 >
		<tr>
		<td width = 50 height = 5>
		<%= rs.getString("num")%>
		</td>
		<td width = 50 height = 5>
		<%= rs.getString("userID") %>
		</td>
		<td width = 50 height = 5>
		<%= rs.getString("name") %>
		</td>
		<td width = 50 height = 5>
		<%= rs.getString("prodName")%>
		</td>
		<td width = 50 height = 5>
		<%= rs.getString("groupName")%>
		</td>
		<td width = 50 height = 5>
		<%= rs.getString("price")%>
		</td>
		<td width = 50 height = 5>
		<%= rs.getString("amount")%>
		</td>
	    </tr>
		</Table>
	<% 
	}
	
	// (6) 연결 해제
		rs.close();
		pstmt.close();
		conn.close();

} catch ( Exception e) {
	System.out.println(e);
}
%>
</body>
</html>