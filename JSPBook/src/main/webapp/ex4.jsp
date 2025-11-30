<%@ page contentType="text/html; charset=UTF-8" %>
\<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            c.setMaxAge(0);   
            c.setPath("/");  
            response.addCookie(c);
        }
    }

    // 다시 로그인 페이지로
    response.sendRedirect("ex1.jsp");
%>
