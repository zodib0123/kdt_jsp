<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mission01 - Euclidean Algorithm</title>
</head>
<body>
	<%
	String gcd = "";
	String lcm = "";
	String str1 = request.getParameter("num1");
	String str2 = request.getParameter("num2");
	
	if (str1 != null && !str1.isBlank() && str2 != null && !str2.isBlank()) {
		int num1 = Integer.parseInt(str1);
		int num2 = Integer.parseInt(str2);
		
		int gcd_val = gcd(num1, num2);
		gcd = String.valueOf(gcd_val);
		
		
		int lcm_val = (num1 * num2) / gcd_val;
		lcm = String.valueOf(lcm_val);
	}	
	%>
    <form method="post" action="Euclidean.jsp">
		<div>
			숫자1 : <input type="text" name="num1" value="<%= (request.getParameter("num1") != null) ? request.getParameter("num1") : "" %>" placeholder="숫자를 입력하세요."><br />
			숫자2 : <input type="text" name="num2"  value="<%= (request.getParameter("num2") != null) ? request.getParameter("num2") : "" %>" placeholder="숫자를 입력하세요."><br />
			최대공약수 : <input type="text" name="gcd" value="<%= gcd %>" readonly><br />
			최소공배수 : <input type="text" name="lcm" value="<%= lcm %>" readonly><br />
			<input type="submit" value="실행">
		</div>
	</form>
	<%!
	public int gcd(int p, int q) {
		if (q == 0) {
			return p;
		}
		return gcd(q, p % q);			
	}
	%>
</body>
</html>