
<%@ page import ="java.util.Enumeration" %>
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

Enumeration en = request.getParameterNames();

StringBuffer sb = new StringBuffer();

while(en.hasMoreElements()){
	
String paramname = (String) en.nextElement();
String paramv = request.getParameter(paramname);
	
sb.append(paramname)
.append(" : ")
.append(paramv)
.append("<br>");



}

out.print(sb.toString());
%>





</body>
</html>