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
String sessin_id=session.getId();

long last_time = session.getLastAccessedTime();

long start_time = session.getCreationTime();

long used_time = (last_time - start_time) / 60000;




%>

</body>
</html>