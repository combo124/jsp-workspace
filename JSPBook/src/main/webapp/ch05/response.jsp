<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Calendar" %>
<%
    response.setHeader("Refresh", "5");              
    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    Calendar now = Calendar.getInstance();
    String time = String.format("%1$tF %1$tT", now); 
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>response.jsp</title></head>
<body>
  <h3>현재 시각: <%= time %></h3>
  <a href="response_data.jsp">redirect 테스트</a>
</body>
</html>
