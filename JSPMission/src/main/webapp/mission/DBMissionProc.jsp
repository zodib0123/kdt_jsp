<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String sel = request.getParameter("sel");
String val = request.getParameter("val");

switch(sel) {
case "1":
	request.getRequestDispatcher("dbmission01.jsp?population=" + val).forward(request, response);	
	break;
case "2":
	request.getRequestDispatcher("dbmission02.jsp?code=" + val).forward(request, response);
	break;
case "3":
	request.getRequestDispatcher("dbmission03.jsp?name=" + val).forward(request, response);
	break;
case "4":
	request.getRequestDispatcher("dbmission04.jsp?continent=" + val).forward(request, response);
	break;
case "5":
	request.getRequestDispatcher("dbmission05.jsp?surfacearea=" + val).forward(request, response);
	break;
case "6":
	request.getRequestDispatcher("dbmission06.jsp?district=" + val).forward(request, response);
	break;
case "7":
	request.getRequestDispatcher("dbmission07.jsp?language=" + val).forward(request, response);
	break;
case "8":
	request.getRequestDispatcher("dbmission08.jsp?language=" + val).forward(request, response);
	break;
case "9":
	request.getRequestDispatcher("dbmission09.jsp?percentage=" + val).forward(request, response);
	break;
default:
	response.sendRedirect("DBMissionMenu.jsp");
	break;
}
%>