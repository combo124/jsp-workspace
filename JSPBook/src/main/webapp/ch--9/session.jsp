<%@page import="java.util.Enumeration"%>
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
String user_id = request.getParameter("user_id"); 
String user_pw = request.getParameter("user_pw"); 
out.println("설정된 세션 이름 userID :" + user_id + "<br>");
out.println("설정된 세션 이름 userpw :" + user_pw + "<br>");

if(request.isRequestedSessionIdValid()== true){
	
	out.print("세션 유효");
}else{
	out.print("세션 불유효");

}

session.invalidate();

int time = session.getMaxInactiveInterval() / 60;
out.println("세션유효시간: " +time + "분 br>");

%>

세션 삭제 

<%
user_id = (String) session.getAttribute("userID");
user_pw = (String) session.getAttribute("userPW");

out.println("설정된 세션 이름 userID :" + user_id + "<br>");
out.println("설정된 세션 이름 userpw :" + user_pw + "<br>");

if(request.isRequestedSessionIdValid()== true){
	
	out.print("세션 유효");
}else{
	out.print("세션 불유효");

}

%>

%>

</body>
</html>