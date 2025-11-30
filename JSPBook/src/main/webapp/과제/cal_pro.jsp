<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<jsp:useBean id="sq" class="ch04.com.dao.SquareBean" scope="page"></jsp:useBean>
<!-- 2️⃣ 값 설정 (number = 5) -->
<jsp:setProperty name="sq" property="number" value="5" />

<!-- 3️⃣ 자바 코드로 calculate() 호출 -->
<%
    sq.calculate();
%>

<!-- 4️⃣ 결과 출력 -->
<p>입력값: <jsp:getProperty name="sq" property="number" /></p>
<p>제곱 결과: <jsp:getProperty name="sq" property="result" /></p>







</body>
</html>