<%@ page contentType="text/html; charset=UTF-8" %>




<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    if ("admin".equals(id) && "admin1234".equals(pw)) {

        Cookie c = new Cookie("userID", id);
        c.setMaxAge(60 * 60);   
        response.addCookie(c);

        response.sendRedirect("ex3.jsp");
    } else {
        response.sendRedirect("ex1.jsp");
    }
%>
