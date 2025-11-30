<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%! private String nvl(String s){ return (s==null)?"":s; } %>

<jsp:useBean id="calc" class="ch04.com.dao.Calculator" scope="page" />

<%
request.setCharacterEncoding("UTF-8");

String num1   = nvl(request.getParameter("num1"));
String num2   = nvl(request.getParameter("num2"));
String op     = nvl(request.getParameter("op"));
String result = nvl(request.getParameter("result"));

String digit = request.getParameter("digit");
String opbtn = request.getParameter("opbtn");
String eq    = request.getParameter("resultbtn");

boolean clicked =
    (digit != null && !digit.isEmpty()) ||
    (opbtn != null && !opbtn.isEmpty()) ||
    (eq    != null && !eq.isEmpty());

if (clicked) {

    if (opbtn != null && !opbtn.isEmpty()) {
        op = opbtn;
    }

    if (digit != null && !digit.isEmpty()) {
        if (op.isEmpty()) num1 += digit;
        else              num2 += digit;
    }

    calc.setNum1(num1);
    calc.setNum2(num2);
    calc.setOp(op);

   if (eq != null && !eq.isEmpty()) {
        calc.calculate();
        result = calc.getResult();
    }

    String q = "num1="   + URLEncoder.encode(num1,   "UTF-8")
             + "&num2="  + URLEncoder.encode(num2,   "UTF-8")
             + "&op="    + URLEncoder.encode(op,     "UTF-8")
             + "&result="+ URLEncoder.encode(result, "UTF-8");

    response.sendRedirect("cal_form.jsp?" + q);
    return;
}

// --- 화면 표시용 문자열 결정 ---
String display;
if (!result.equals("")) {
    display = result;
} else if (op.equals("")) {
    display = (num1.equals("")) ? "0" : num1;
} else {
    display = (num2.equals("")) ? "0" : num2;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
</head>
<body>
<div style="border:1px solid #aaa; width:200px; height:40px; font-size:24px; text-align:right; padding:6px; margin-bottom:10px;">
  <%= display %>
</div>

<form action="cal_form.jsp" method="post">
  <input type="hidden" name="num1" value="<%= num1 %>">
  <input type="hidden" name="num2" value="<%= num2 %>">
  <input type="hidden" name="op"   value="<%= op %>">
  <input type="hidden" name="result" value="<%= result %>">

  <button type="submit" name="digit" value="7">7</button>
  <button type="submit" name="digit" value="8">8</button>
  <button type="submit" name="digit" value="9">9</button><br>
  <button type="submit" name="digit" value="4">4</button>
  <button type="submit" name="digit" value="5">5</button>
  <button type="submit" name="digit" value="6">6</button><br>
  <button type="submit" name="digit" value="1">1</button>
  <button type="submit" name="digit" value="2">2</button>
  <button type="submit" name="digit" value="3">3</button><br>
  <button type="submit" name="digit" value="0">0</button>
  <button type="submit" name="digit" value=".">.</button><br>

  <button type="submit" name="opbtn" value="add">+</button>
  <button type="submit" name="opbtn" value="sub">−</button>
  <button type="submit" name="opbtn" value="mul">×</button>
  <button type="submit" name="opbtn" value="div">÷</button>

  <button type="submit" name="resultbtn" value="result">=</button>
</form>
</body>
</html>

