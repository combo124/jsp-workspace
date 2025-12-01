<%@ page contentType="text/html; charset=utf-8" %>
<%
    session.invalidate();
    out.println("<script>");
    out.println("alert('로그아웃 되었습니다.');");
    out.println("location.href='welcome.jsp';");
    out.println("</script>");
%>
