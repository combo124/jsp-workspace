<%@page import="java.util.Locale"%>
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
Locale locale =request.getLocale();

String lan = locale.getLanguage();
String co  = locale.getCountry();
%>
언어 : <%= lan %>
<br>
국가 <%= co %>

</body>
</html>