<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String[] fruits = request.getParameterValues("f");

if (fruits == null) {
    out.println("선택된 과일이 없습니다.");
} else {
    out.println("선택된 과일: <br>");
    for (String f : fruits) {
        out.println(f + "<br>");
    }
}



%>

</body>
</html>