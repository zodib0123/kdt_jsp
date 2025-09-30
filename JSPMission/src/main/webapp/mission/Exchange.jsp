<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mission01 - Money To Exchange</title>
</head>
<style>
form {
	border: 1px solid black;
	padding: 5px;
	width: 250px;
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
	request.setCharacterEncoding("UTF-8");
	String str = request.getParameter("amount");
	String discount = "";
	String val1 = "";
	String val2 = "";
	String val3 = "";
	String val4 = "";

	if (str != null && !str.isBlank()) {
		int amount = Integer.parseInt(str);
		int remain = amount;
		int num1 = remain / 50000; remain %= 50000; val1 = String.valueOf(num1);
		int num2 = remain / 10000; remain %= 10000; val2 = String.valueOf(num2);
		int num3 = remain / 5000; remain %= 5000; val3 = String.valueOf(num3);
		int num4 = remain / 1000; remain %= 1000; val4 = String.valueOf(num4);
		int dis = amount - remain; discount = String.valueOf(dis); 
	}
	%>
	<form method="post" action="Exchange.jsp">
		<ul style="margin: 0; padding: 0;">
			<ol>
				지불금액 :
				<input type="text" name="amount" value="<%= (request.getParameter("amount") != null) ? request.getParameter("amount") : "" %>">
			</ol>
			<ol>
				할인금액 :
				<input type="text" name="discount" value="<%= discount %>" readonly>
			</ol>
			<ol>
				오만원권 :
				<input type="text" name="val1" value="<%= val1 %>" readonly>
			</ol>
			<ol>
				일만원권 :
				<input type="text" name="val2" value="<%= val2 %>" readonly>
			</ol>
			<ol>
				오천원권 :
				<input type="text" name="val3" value="<%= val3 %>" readonly>
			</ol>
			<ol>
				일천원권 :
				<input type="text" name="val4" value="<%= val4 %>" readonly>
			</ol>
			<input type="submit" name="실행" id="submitBtn">
		</ul>
	</form>
</body>
</html>