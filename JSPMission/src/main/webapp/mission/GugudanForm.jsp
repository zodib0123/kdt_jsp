<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mission01 - Gugudan indexPage</title>
</head>
<body>
	<form method="post" action="GugudanProc.jsp">
		<input type="radio" name="sel" value="1" checked="checked">Type1: 세로<br />
		<input type="radio" name="sel" value="2">Type2: 세로<br />
		<input type="radio" name="sel" value="3">Type3: 하나만 출력<br />
		<input type="radio" name="sel" value="4">Type4: 여러개씩 묶어서 출력<br />
		<input type="text" name="val">단수/열수<br />
		<input type="submit" value="선택">
	</form>
</body>
</html>