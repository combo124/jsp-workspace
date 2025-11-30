<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head><meta charset="UTF-8"></head>
<body>

<a href="jstl_fmt.jsp?language=ko"></a> 
<a href="jstl_fmt.jsp?language=en"></a>

<fmt:setLocale value="ko" />
<fmt:setBundle basename="ch09.com.bundle.myBundle" />

<form method="get" action="#">
    <label><fmt:message key="id"/></label>
    <input type="text" name="id"><br>

    <label><fmt:message key="password"/></label>
    <input type="password" name="passwd"><br>

    <input type="submit" value="<fmt:message key='button'/>">
</form>

</body>
</html>
    