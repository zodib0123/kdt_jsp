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
<title>JDBC</title>
<style>
	table {
		border-collapse: collapse;
		padding: 5px;
	}
	
	tr, td, th {
		border: 1px solid black;
		padding: 8px;
  		text-align: center;
	}
	
	th {
		background-color: gray;
	}	
</style>
</head>
<body>
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
	<%
	// DB에 연결
	JDBConnect jdbc = new JDBConnect();
	
	// 쿼리문 생성
	String sql = "SELECT id, pass, name, regidate FROM member";
	jdbc.stmt = jdbc.con.createStatement();
	
	// 쿼리 수행
	jdbc.rs = jdbc.stmt.executeQuery(sql);
	
	// 결과 확인(웹 페이지에 출력)
	out.println("<table>");
	out.println("	<thead>");
	out.println("		<tr>");
	out.println("			<th>ID</th>");
	out.println("			<th>비밀번호</th>");
	out.println("			<th>이름</th>");
	out.println("			<th>가입일자</th>");
	out.println("		</tr>");
	out.println("	</thead>");
	out.println("	<tbody>");
	while (jdbc.rs.next()) {
		String id = jdbc.rs.getString(1);
		String pw = jdbc.rs.getString(2);
		String name = jdbc.rs.getString("name");
		java.sql.Date regidate = jdbc.rs.getDate("regidate");
		
		//out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br/>");
		out.println("		<tr>");
		out.println("			<td>" + id + "</td>");
		out.println("			<td>" + pw + "</td>");
		out.println("			<td>" + name + "</td>");
		out.println("			<td>" + regidate + "</td>");
		out.println("		</tr>");
	}
	out.println("	</tbody>");
	out.println("</table>");
	
	// 연결 닫기
	jdbc.close();
	%>
</body>
</html>