<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mission01 - Gugudan table</title>
</head>
<body>
<%
String str = request.getParameter("val");
Integer val;
if (str.isBlank()) {
	val = 3;
} else {
	val = Integer.parseInt(request.getParameter("val"));
}

out.println("<table>");
for (int i = 2; i < 10; i += val) {
	for (int j = 1; j < 10; j++) {
		if (j == 1) {
			out.print("<tr>");
			for (int k = i; k < i + val; k++) {
				if (k < 10) {
					out.println("<th>" + k + "단 </th>");
				}
			}
			out.print("</tr>");
		}
		out.print("<tr>");
		for (int k = i; k < i + val; k++) {
			if (k < 10) {
				out.println("<td>" + k + " X " + j + " = " + j * i + "</td>");
			}
		}
		out.print("</tr>");
	}
}
out.println("</table>");
%>
</body>
</html>