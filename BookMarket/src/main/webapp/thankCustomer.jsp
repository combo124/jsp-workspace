<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.LibraryDao" %>
<%@ page import="java.net.URLDecoder" %>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 완료</title>
</head>
<body>
<%
    String shipping_cartId="";
    String shipping_name="";
    String shipping_shippingDate="";
    String shipping_country="";
    String shipping_zipCode="";
    String shipping_addressName="";

    Cookie[] cookies=request.getCookies();

    if (cookies!=null) {
        for (int i=0; i < cookies.length; i++) {
            Cookie thisCookie=cookies[i];
            String n=thisCookie.getName();
            if (n.equals("Shipping_cartId"))
                shipping_cartId=URLDecoder.decode((thisCookie.getValue()), "utf-8");
            if (n.equals("Shipping_shippingDate"))
                shipping_shippingDate=URLDecoder.decode((thisCookie.getValue()), "utf-8");
        }
    }
%>

<div class="container py-4">
<%@ include file="menu.jsp" %>

<div class="p-5 mb-4 bg-body-tertiary rounded-3">
    <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">주문 완료</h1>
        <p class="col-md-8 fs-4">Order Completed</p>
    </div>
</div>

<div class="row align-items-md-stretch">
    <h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
    <p> 주문은 <% out.println(shipping_shippingDate); %> 날짜에 배송될 예정입니다!
        <br> 주문번호 : <% out.println(shipping_cartId); %> </p>
</div>
<div class="container">
    <p> <a href="./books.jsp" class="btn btn-secondary">&laquo;게임 목록</a>
    </p>
<%@ include file="footer.jsp" %>
</div>
</div>
</body>
</html>
<%
    // ✅ 1. 결제된 상품들을 라이브러리에 등록
    String memberId = (String) session.getAttribute("id");  // 로그인한 회원 ID

    if (memberId != null) {
        // 장바구니에 담았던 도서 목록 (ArrayList<Book> 형태라고 가정)
        Object obj = session.getAttribute("cartlist");
        ArrayList<Book> cartList = null;

        if (obj instanceof ArrayList<?>) {
            try {
                cartList = (ArrayList<Book>) obj;
            } catch (ClassCastException e) {
                // 타입이 다르면 그냥 라이브러리 등록은 스킵
                e.printStackTrace();
            }
        }

        if (cartList != null && !cartList.isEmpty()) {
            LibraryDao libDao = LibraryDao.getInstance();   // 🔹 new 말고 싱글톤 사용

            for (Book b : cartList) {
                if (b == null) continue;

                String bookId = b.getBookId();  // Book DTO의 PK
                if (bookId == null || bookId.isEmpty()) continue;

                // 라이브러리에 구매한 도서 등록
                libDao.addToLibrary(memberId, bookId);
                // 또는 libDao.addGame(memberId, bookId); 둘 다 가능 (둘 다 만들어놨으니까)
            }
        }
    }

    // ✅ 2. 세션/쿠키 정리 로직
    //    👉 주문 후 자동 로그아웃 하고 싶으면 session.invalidate() 유지
    //    👉 로그인은 유지하고 장바구니만 비우고 싶으면 아래 한 줄로 바꾸기
    // session.invalidate();
    session.removeAttribute("cartlist");   // 장바구니만 비우기

    for (int i = 0; i < cookies.length; i++) {
        Cookie thisCookie = cookies[i];
        String n = thisCookie.getName();
        if (n.equals("Shipping_cartId"))
            thisCookie.setMaxAge(0);
        if (n.equals("Shipping_name"))
            thisCookie.setMaxAge(0);
        if (n.equals("Shipping_shippingDate"))
            thisCookie.setMaxAge(0);
        if (n.equals("Shipping_country"))
            thisCookie.setMaxAge(0);
        if (n.equals("Shipping_zipCode"))
            thisCookie.setMaxAge(0);
        if (n.equals("Shipping_addressName"))
            thisCookie.setMaxAge(0);

        response.addCookie(thisCookie);
    }
%>
