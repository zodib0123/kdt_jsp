<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mission01 - Gugudan Vertical</title>
</head>
<body>
<%
out.println("<table>");
for (int i = 2; i < 10; i++) {
	out.println("<th>" + i + "단 </th>");
	for (int j = 1; j < 10; j++) {
		out.println("<tr><td>" + i + " X " + j + " = " + j * i + "</td></tr>");
	}	
}
out.println("</table>");
%>
</body>
</html>