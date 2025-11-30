<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat" %>   
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.*" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%Locale locale= request.getLocale();
Date currentDate= new Date();
DateFormat dateFormat= DateFormat.getDateInstance(DateFormat.FULL,locale);
NumberFormat numberFormat= NumberFormat.getNumberInstance(locale);


%>

<p> 국가 : <%= locale.getDisplayCountry() %>

</body>
</html>