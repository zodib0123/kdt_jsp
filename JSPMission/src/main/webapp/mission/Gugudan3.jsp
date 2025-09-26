<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mission01 - Gugudan request value</title>
</head>
<body>
<%
String str = request.getParameter("val");
if (str.isBlank()) {
	str = "2";
} else {
	str = request.getParameter("val");
}
int val = Integer.parseInt(str);
out.println("<table>");
out.println("<th>" + val + "단 </th>");
for (int j = 1; j < 10; j++) {
	out.println("<tr><td>" + val + " X " + j + " = " + j * val + "</td></tr>");
}	
out.println("</table>");
%>
</body>
</html>