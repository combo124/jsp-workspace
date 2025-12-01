<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>

<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel ="stylesheet" href=".resource/css/bootstrap.min.css" />


<title>게임 정보</title>
<script type="text/javascript">
function addToCart() {
	if (confirm("게임를 장바구니에 추가하시겠습니까?")) {
		document.addForm.submit();
	}
	else {
		document.addForm.reset();
	}
}

</script>
</head>
<body>
<div class="container py-4">
  <%@ include file="menu.jsp" %>

  <div class="p-5 mb-4 bg-body-tertiary rounded-3">
    <div class="container-fluid py-5">
      <h1 class="display-5 fw-bold">게임정보</h1>
      <p class="col-md-8 fs-4">GameInfo</p>
    </div>
  </div>

  <%
    String id = request.getParameter("id");
    BookRepository dao =BookRepository.getInstance();
    Book book = dao.getBookById(id);
  %>

  <div class="row align-items-md-stretch">
  <div class="col-md-5">
        <img src="./resource/Images/<%=book.getFilename()%>" style="width: 70%" />
  
  </div>
    <div class="col-md-6">
      <h3><b><%= book.getName() %></b></h3>
      <p><%= book.getDescription() %></p>
      <p><b>게임코드 :</b> <span class="badge text-bg-danger"><%= book.getBookId() %></span></p>
      <p><b>개발자 :</b> <%= book.getAuthor() %></p>
      <p><b>유통사 :</b> <%= book.getPublisher() %></p>
      <p><b>출판일 :</b> <%= book.getReleaseDate() %></p>
      <p><b>분류 :</b> <%= book.getCategory() %></p>
      <p><b>재고수량 :</b> <%= book.getUnitsInStock() %></p>
      <h4><%= book.getUnitPrice() %>원</h4>
	  <p><p>
    <!-- 게임주문: 장바구니에 넣으면서 이동 -->
    <a href="addCart.jsp?id=<%= book.getBookId() %>"
       class="btn btn-info">
        게임주문 &raquo;
    </a>

    <!-- 장바구니 보기 -->
    <a href="cart.jsp"
       class="btn btn-warning">
        장바구니 &raquo;
    </a>

    <!-- 게임 목록으로 -->
    <a href="books.jsp"
       class="btn btn-secondary">
        게임목록 &raquo;
    </a>

    <td>
        <form action="goDemo.jsp" method="get" target="_blank" style="display:inline;">
            <input type="hidden" name="gameId" value="<%= book.getBookId() %>">
            <input type="hidden" name="mode"   value="demo">
            <button type="submit" class="btn btn-sm btn-outline-warning">
                데모 플레이
            </button>
        </form>
    </td>
</p>
    </div>
  </div>

  <jsp:include page="footer.jsp" />
</div>
</body>
</html>
