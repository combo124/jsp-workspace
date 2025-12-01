<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dao.MemberDao" %>

<html>
<head><title>MemberDao 테스트</title></head>
<body>
<pre>
<%
    MemberDao dao = MemberDao.getInstance();

int res1 = dao.login("test", "1234");
out.println("login(\"test\", \"1234\") = " + res1);

out.println();
out.println("=== 2) login(test, 9999) (비번 틀린 경우) ===");
int res2 = dao.login("test", "9999");
out.println("login(\"test\", \"9999\") = " + res2);

out.println();
out.println("=== 3) insertMember(newuser, ...) 테스트 ===");
int inserted = dao.insertMember("newuser", "pass", "뉴유저", "new@example.com");
out.println("insertMember(...) 리턴값 = " + inserted);

out.println();
out.println("=== 4) login(newuser, pass) 다시 확인 ===");
int res3 = dao.login("newuser", "pass");
out.println("login(\"newuser\", \"pass\") = " + res3);
%>
</pre>
</body>
</html>
