<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>request.jsp</title></head>
<body>
  <h3>GET 폼 전송</h3>
  <form action="request_process.jsp" method="get">
    아이디: <input type="text" name="id"><br>
    비밀번호: <input type="text" name="pw"><br>
    <button type="submit">전송</button>
  </form>
</body>
</html>
