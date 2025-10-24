<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Mission 02</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String str = request.getParameter("code");
	if (str == null || str == "") {
		str = "";
	}
	%>
	<a href="DBMissionMenu.jsp">메뉴로 돌아가기</a>
	<h2>입력받은 국가코드( <%=str %> )에 해당하는 국가의 코드, 도시명, 도시인구수 출력</h2>
	<%
	JDBConnect jdbc = new JDBConnect();
	
	String sql = "SELECT B.code, A.name, A.population FROM city A " +
			 	 "INNER JOIN country B ON A.CountryCode = B.Code " + "WHERE B.code = '" + str + "'";
	jdbc.stmt = jdbc.con.createStatement();
	jdbc.rs = jdbc.stmt.executeQuery(sql);
	
	ResultSetMetaData meta = jdbc.rs.getMetaData();
	int fields = meta.getColumnCount();
	
	while(jdbc.rs.next()) {
		for (int i = 1; i <= fields; i++) {
			if (i != 1) {
				out.print(", ");
			}
				out.print(jdbc.rs.getString(i));
		}
		out.println("<br/>");
	}
	jdbc.rs.close();
	%>
</body>
</html>