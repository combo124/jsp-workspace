<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="dao.DBUtil" %>
<%@ page import="java.io.PrintWriter" %>


<html>
<head><title>DB Test</title></head>
<body>
<%
    try {
        Connection conn = DBUtil.getConnection();
        out.println("<h3>DB 연결 성공 </h3>");
        if (conn != null) {
            out.println("<p>conn 객체: " + conn.toString() + "</p>");
            conn.close();
        }
    } catch (Exception e) {
        out.println("<h3>DB 연결 실패 ❌</h3>");
        out.println("<pre>");
        e.printStackTrace(new PrintWriter(out));  // JspWriter → PrintWriter 래핑
        out.println("</pre>");
    }
%>
</body>
</html>
