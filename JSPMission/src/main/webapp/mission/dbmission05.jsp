<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="common.JDBConnect"%>
<%@page import="common.MyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Mission 05</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String str = request.getParameter("surfacearea");
	if (str == null || str == "") {
		str = "0";
	}
	%>
	<a href="DBMissionMenu.jsp">메뉴로 돌아가기</a>
	<h2>입력받은 넓이( <%=str %> )보다 작은 국가의 국가명, 면적을 오름차순으로 출력</h2>
	<%
	JDBConnect jdbc = new JDBConnect();
	MyUtil util = new MyUtil();
	
	String sql = "SELECT name, surfaceArea FROM country " +
				 "WHERE surfaceArea < " + Integer.parseInt(str) + " ORDER BY surfaceArea ";
	jdbc.stmt = jdbc.con.createStatement();
	jdbc.rs = jdbc.stmt.executeQuery(sql);
	
	util.writeTableFromResultSet(out, jdbc.rs);
	
	jdbc.rs.close();
	%>
</body>
</html>