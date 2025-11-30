<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import= "java.util.Date" %>



<html>
<head>

<title>Welcome</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</head>
<body>

<%@ include file = "menu.jsp" %>
   <%! String greeting = "도서 쇼핑몰에 오신 것을 환영합니다";
      String tagline = "Welcome to Web Market";
   %>
   
   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
  <div class="container-fluid py-5">
    <h1 class="display-5 fw-bold"><%= greeting %></h1>
    <p class="col-md-8 fs-4">BookMarket</p>
  </div>
</div>

<div class="row align-items-md-stretch text-center">
  <div class="col-md-12">
    <div class="h-100 p-5">
      <h3><%= tagline %></h3>
      <%Date day = new java.util.Date();
      String am_pm;
      int hour = day.getHours();
      int minute = day.getMinutes();
      int second = day.getSeconds();
      if (hour / 12 == 0) {
          am_pm = "AM";
      } else {
          am_pm = "PM";
          hour = hour - 12;
      }
      String CT = hour + ":" + minute + ":" + second + " " + am_pm;
      out.println("현재 접속 시각: " + CT + "\n");
      
 %>
    </div>
  </div>
</div>


   
   
   <%--<h1><%= greeting %></h1>
      <h3   ><%= tagline %></h3>--%>
   <%@ include file = "footer.jsp" %>
   
</body>
</html>