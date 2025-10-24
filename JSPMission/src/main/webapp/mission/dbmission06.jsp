<%@page import="common.MyUtil"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Mission 06</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String str = request.getParameter("district");
	if (str == null || str == "") {
		str = "";
	}
	%>
	<a href="DBMissionMenu.jsp">메뉴로 돌아가기</a>
	<h2>입력받은 대한민국 지역( <%=str %> )의 모든 도시 출력</h2>
	<%
	JDBConnect jdbc = new JDBConnect();
	MyUtil util = new MyUtil();
	
	String sql = "SELECT name FROM city WHERE countryCode = 'KOR' "+
				 "AND district LIKE '" + str + "%'";
	jdbc.stmt = jdbc.con.createStatement();
	jdbc.rs = jdbc.stmt.executeQuery(sql);
	
	util.writeTableFromResultSet(out, jdbc.rs);
	
	jdbc.rs.close();
	%>
</body>
</html>