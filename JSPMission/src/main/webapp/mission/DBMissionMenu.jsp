<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Mission Menu</title>
<style>
	input {
		margin: 10px;
		padding: 10px;
	}
</style>
</head>
<body>
	<form method="post" action="DBMissionProc.jsp">
		<input type="radio" name="sel" value="1" checked="checked">1번 문제 : 인구수 입력해서 도시 검색<br />
		<input type="radio" name="sel" value="2">2번 문제 : 국가코드 입력해서 국가 검색<br />
		<input type="radio" name="sel" value="3">3번 문제 : 국가명 일부 입력해서 국가 정보 검색<br />
		<input type="radio" name="sel" value="4">4번 문제 : 대륙 입력해서 해당 대륙의 국가 검색<br />
		<input type="radio" name="sel" value="5">5번 문제 : 국가넓이 입력해서 값보다 큰 국가 검색<br />
		<input type="radio" name="sel" value="6">6번 문제 : 대한민국 지역 입력해서 해당 지역 도시 검색<br />
		<input type="radio" name="sel" value="7">7번 문제 : 언어 입력해서 해당 공식언어 국가코드 검색<br />
		<input type="radio" name="sel" value="8">8번 문제 : 언어 입력해서 해당 공식언어 국가명 검색<br />
		<input type="radio" name="sel" value="9">9번 문제 : 언어 사용비율 입력해서 해당 국가 검색<br />
		&emsp;입력 값 = <input type="text" name="val" autofocus><br />
		<input type="submit" value="이동">
	</form>
</body>
</html>