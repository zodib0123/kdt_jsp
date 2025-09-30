<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
form {
	border: 1px solid black;
	padding: 5px;
	width: 240px;
	margin: 0
}

ol {
	padding: 0;
}

#submitBtn {
	width: 100%;
}
</style>
<body>
<%
String errmsg = request.getParameter("errmsg");
ArrayList<String> lists = (ArrayList<String>)session.getAttribute("lists");
if (lists == null) {
	lists = new ArrayList<String>();
	session.setAttribute("lists", lists);
}

if (errmsg != null && !errmsg.isBlank()) {
	String script = "" + "<script>" + "		alert('" + errmsg + "');" + "		history.back();" + "</script>";
	out.println(script);
}
%>
	<form method="post" action="InsertProcess.jsp">
		<ul style="margin: 0; padding: 0;">
			<ol>
				아이디 :&nbsp;
				<input type="text" name="user_id" value="">
			</ol>
			<ol>
				암호 :&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="user_pw" value="">
			</ol>
			<ol>
				이름 :&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="user_name" value="">
			</ol>
			<input type="submit" name="입력" id="submitBtn">
		</ul>
	</form>
</body>
</html>