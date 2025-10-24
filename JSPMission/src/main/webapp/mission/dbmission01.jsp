<%@page import="java.sql.DriverManager"%>
<%@page import="common.JDBConnect"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Mission 01</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String str = request.getParameter("population");
	if (str == null || str == "") {
		str = "0";
	}
	%>
	<a href="DBMissionMenu.jsp">메뉴로 돌아가기</a>
	<h2>입력받은 인구 수( <%=str %> ) 보다 많은 인구를 가진 도시 출력</h2>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/world"; 
		String id = "musthave";
		String pwd = "tiger"; 
		
		Connection con = DriverManager.getConnection(url, id, pwd);
		Statement stmt = con.createStatement();
		String sql = "SELECT name FROM city WHERE population > " + str;	
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			String name = rs.getString(1);
			out.println(name + "<br/>");
		}
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	
</body>
</html>