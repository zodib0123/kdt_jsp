<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String sel = request.getParameter("sel");
String val = request.getParameter("val");

switch(sel) {
case "1":
	request.getRequestDispatcher("Gugudan1.jsp").forward(request, response);	
	break;
case "2":
	request.getRequestDispatcher("Gugudan2.jsp").forward(request, response);
	break;
case "3":
	request.getRequestDispatcher("Gugudan3.jsp").forward(request, response);
	break;
case "4":
	request.getRequestDispatcher("Gugudan4.jsp").forward(request, response);
	break;
default:
	response.sendRedirect("GugudanForm.jsp");
	break;
}
%>