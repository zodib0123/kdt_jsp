<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - UseBean</title>
</head>
<body>
<%
	//String id = request.getParameter("id");
	//String pass = request.getParameter("pass");
	//String name = request.getParameter("name");
	//String regidate = request.getParameter("regidate");
%>
	<h3>Member setProperty</h3>
	<jsp:useBean id="member" class="membership.MemberDTO" />
	<jsp:setProperty property="*" name="member"/>
	
	<h3>Member getProperty</h3>
	<ul>
		<li>ID : <jsp:getProperty property="id" name="member"/></li><br />
		<li>PW : <jsp:getProperty property="pass" name="member"/></li><br />
		<li>이름 : <jsp:getProperty property="name" name="member"/></li><br />
		<li>가입일자 : <jsp:getProperty property="regidate" name="member"/></li><br />
	</ul>
</body>
</html>