<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>request_process.jsp</title></head>
<body>
  <h3>요청 원문 쿼리스트링</h3>
  <pre><%= request.getQueryString() %></pre>

  <h3>파라미터 값</h3>
  <ul>
    <li>id = <%= request.getParameter("id") %></li>
    <li>pw = <%= request.getParameter("pw") %></li>
  </ul>

  <h4>전체 파라미터 나열</h4>
  <%
    java.util.Enumeration<String> names = request.getParameterNames();
    while (names.hasMoreElements()) {
      String name = names.nextElement();
      String[] vals = request.getParameterValues(name);
  %>
      <div><b><%= name %></b> = <%= java.util.Arrays.toString(vals) %></div>
  <%
    }
  %>
</body>
</html>
