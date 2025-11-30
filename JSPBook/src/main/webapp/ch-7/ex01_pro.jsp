<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");

String name =request.getParameter("name");
String ad =request.getParameter("ad");
String email =request.getParameter("email");


%>
<%= name %>
<%= ad %>
<%= email %>

</body>
</html>