<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p> 기본 로케일

<fmt:setLocale value="ko"/>
<fmt:setBundle basename="ch09.com.bundle.myBundle" var="rb"/>

기본 로케일 제목: <fmt:message key="title" bundle="${rb}"/>
이름: <fmt:message key="username" bundle="${rb}"/>

<p/>
<fmt:setLocale value="en"/>
<fmt:setBundle basename="ch09.com.bundle.myBundle" var="rb"/>
영문 로케일 제목: <fmt:message key="title" bundle="${rb}"/>
이름: <fmt:message key="username" bundle="${rb}"/>



</body>
</html>