<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>액션태그</h3>
<jsp:include page="param02.jsp"></jsp:include>

<jsp:param value='<%=java.net.URLEncoder.encode("오늘의 시간과날짜 ") %>' name="title"/>
<jsp:param value='<%= java.util.Calendar.getInstance().getTime()%>' name="date"/>

</body>
</html>