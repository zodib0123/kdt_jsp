<%@page import="common.MyUtil"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Mission 03</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String str = request.getParameter("name");
	if (str == null || str == "") {
		str = "";
	}
	%>
	<a href="DBMissionMenu.jsp">메뉴로 돌아가기</a>
	<h2>입력받은 국가명( <%=str %> )이 들어가는 국가의 코드, 도시명, 도시인구수 출력</h2>
	<%
	JDBConnect jdbc = new JDBConnect();
	MyUtil util = new MyUtil();
	
	String sql = "SELECT B.code, A.name, A.population FROM city A "
			   + "INNER JOIN country B ON A.CountryCode = B.Code "
			   + "WHERE B.name LIKE '%" + str +"%'";
	jdbc.stmt = jdbc.con.createStatement();
	jdbc.rs = jdbc.stmt.executeQuery(sql);
	
	ResultSetMetaData meta = jdbc.rs.getMetaData();
	int fields = meta.getColumnCount();

	util.writeTableFromResultSet(out, jdbc.rs);
	
	jdbc.rs.close();
	%>
</body>
</html>