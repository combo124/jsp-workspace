<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String userId = null;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("userID".equals(c.getName())) {
                userId = c.getValue();
                break;
            }
        }
    }

    if (userId == null) {
        response.sendRedirect("ex4.jsp");
        return;
    }
%>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h2>환영 페이지</h2>
    <b><%= userId %></b>님 반갑습니다.<br><br>

    <a href="ex4.jsp">로그아웃</a>
</body>
</html>
