<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
String user_name = request.getParameter("user_name");
ArrayList<String> lists = (ArrayList<String>)session.getAttribute("lists");

if (user_id == null || user_id.isBlank() || user_pw == null || user_pw.isBlank()) {
	request.getRequestDispatcher("InsertForm.jsp?errmsg=아이디 혹은 비밀번호가 비었습니다.").forward(request, response);
} 
for (String str : lists) {
	if (user_id.equals(str)) {
		request.getRequestDispatcher("InsertForm.jsp?errmsg=아이디가 중복입니다.").forward(request, response);		
	}
} 
lists.add(user_id);
session.setAttribute("lists", lists);
request.getRequestDispatcher("InsertSuccess.jsp").forward(request, response);
%>