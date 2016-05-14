<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	String sql = "INSERT INTO userTBL VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("userID"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("birthYear"));
	pstmt.setString(4, request.getParameter("addr"));
	pstmt.setString(5, request.getParameter("mobile1"));
	pstmt.setString(6, request.getParameter("mobile2"));
	pstmt.setString(7, request.getParameter("height"));
	pstmt.setString(8, request.getParameter("mDate"));
	
	// (4) SQL문 전송
	if (request.getParameter("userID") != null){
		pstmt.executeUpdate();
	}

} catch ( Exception e) {
	System.out.println(e);
}

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 조회 화면</title>
</head>
<body>
<center></center>
<h1>회원 조회</h1>
<form method = post name = form1 action = "event.jsp">
아이디 : <input type = text name = userID> <br>
이름 : <input type = text name = name><br>
생년 : <input type = text name = birthYear><br>
주소 : <input type = text name = addr><br>
국번 : <input type = text name = mobile1><br>
나머지번호 : <input type = text name = mobile2><br>
키 : <input type = text name = height><br>
가입일 : <input type = text name = mDate><br>
<input type = submit value = "회원가입"><br>
</form>
<HR>
</center>
### 조회 결과 ###<P>
<% 
try{
	// (3) Statement 생성
	
	String sql = "select userID, name, birthYear, addr, mobile1, mobile2, height, mDate from userTBL";
	pstmt = conn.prepareStatement(sql);
	
	// (4) SQL문 실행 & (5) 결과 받기
 	ResultSet rs = pstmt.executeQuery(); 
	
	// rs를 사용하는 코딩
	%>
	<% while( rs.next()){%>
		<Table border=1 width=700 height = 50 >
		<tr>
		<td width = 50 height = 5>
		<%= rs.getString("userID")%>
		</td>
		<td width = 50 height = 5>
		<%= rs.getString("name") %>
		</td>
		<td width = 50 height = 5>
		<%= rs.getString("birthYear")%>
		</td>
		<td width = 50 height = 5>
		<%= rs.getString("addr")%>
		</td>
		<td width = 50 height = 5>
		<%= rs.getString("mobile1")%>
		</td>
		<td width = 50 height = 5>
		<%= rs.getString("mobile2")%>
		</td>
		<td width = 50 height = 5>
		<%= rs.getString("height")%>
		</td>
		<td width = 50 height = 5>
		<%= rs.getString("mDate")%>
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