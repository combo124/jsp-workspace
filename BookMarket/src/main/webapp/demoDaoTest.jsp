<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dao.DemoUseDao" %>

<html>
<head><title>DemoUseDao 테스트</title></head>
<body>
<%
    String mId = "testUser";
    String bId = "TESTGAME";

    DemoUseDao dao = DemoUseDao.getInstance();
    DemoUseDao.DemoResult result = dao.checkAndUseDemo(mId, bId);

    out.println("<h3>DemoUseDao 테스트</h3>");
    out.println("<p>mId = " + mId + "</p>");
    out.println("<p>bId = " + bId + "</p>");
    out.println("<p>canUse = " + result.canUse + "</p>");
    out.println("<p>remainSec = " + result.remainSec + "</p>");
%>
</body>
</html>
