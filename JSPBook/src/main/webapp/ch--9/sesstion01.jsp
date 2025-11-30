<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Enumeration"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name;
String value;

Enumeration en = session.getAttributeNames();
int i =0;

while(en.hasMoreElements()){
	i++;
	name = en.nextElement().toString();
	value = session.getAttribute(name).toString();
	out.println("설정된 세션 이름 [ " + i +"] :" + name + "<br>");
	out.println("설정된 세션 이름 [ " + i +"] :" + value + "<br>");
	
	session.removeAttribute("userID");
	
}


%>

세션 삭제

<%
en = session.getAttributeNames();
i =0;

while(en.hasMoreElements()){
	i++;
	name = en.nextElement().toString();
	value = session.getAttribute(name).toString();
	out.println("설정된 세션 이름 [ " + i +"] :" + name + "<br>");
	out.println("설정된 세션 이름 [ " + i +"] :" + value + "<br>");
	
	session.removeAttribute("userID");
	
}
%>

</body>
</html>