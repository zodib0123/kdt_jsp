<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mission1 - Gugudan Horizontal</title>
</head>
<body>
<%
out.println("<table>");
for (int i = 2; i < 10; i++) {
	out.println("<th>" + i + "단 </th>");
}
for (int i = 2; i < 10; i++) {
	out.print("<tr>");
	for (int j = 1; j < 10; j++) {
		out.println("<td>" + i + " X " + j + " = " + j * i + "</td>");
	}	
	out.print("</tr>");
}
out.println("</table>");
%>
</body>
</html>