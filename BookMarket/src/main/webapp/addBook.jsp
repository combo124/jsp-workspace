<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%
    // 🔐 관리자 체크
    String memberId = (String) session.getAttribute("id");
    String role = (String) session.getAttribute("role");

    if (memberId == null || role == null || !"ADMIN".equals(role)) {
        out.println("<script>");
        out.println("alert('관리자만 접근 가능한 페이지입니다.');");
        out.println("location.href='welcome.jsp';");
        out.println("</script>");
        return;
    }
%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel ="stylesheet" href=".resource/css/bootstrap.min.css" />
<script type="text/javascript" src="./resource/js/validation.js"></script>
<title>게임 등록</title>
</head>
<body>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message">
<div class="container py-4">
    <%@ include file="menu.jsp" %>

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold"><fmt:message key="title"></fmt:message></h1>
            <p class="col-md-8 fs-4">Game Addition</p>
        </div>
    </div>
 
    <div class="row align-items-md-stretch">
    	<div class="text-end">
    	    <a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
    	</div>

        <form name="newBook" action="./processAddBook.jsp"
              class="form-horizontal" method="post" enctype="multipart/form-data">

            <div class="mb-3 row">
                <label class="col-sm-2"><fmt:message key="bookId"></fmt:message></label>
                <div class="col-sm-3">
                    <input type="text" id="productId" name="bookId" class="form-control">
                </div>
            </div>

            <!-- 🔧 name 라벨에서 ??? 안 뜨게: i18n 빼고 한글로 / 또는 비워두기 -->
            <div class="mb-3 row">
<label class="col-sm-2"><fmt:message key="gameName" /></label>
                <div class="col-sm-3">
                    <input type="text" id="name" name="name" class="form-control">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2"><fmt:message key="unitPrice"></fmt:message></label>
                <div class="col-sm-3">
                    <input type="text" id="unitPrice" name="unitPrice" class="form-control">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2"><fmt:message key="author"></fmt:message></label>
                <div class="col-sm-3">
                    <input type="text" name="author" class="form-control">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2"><fmt:message key="publisher"></fmt:message></label>
                <div class="col-sm-3">
                    <input type="text" name="publisher" class="form-control">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2"><fmt:message key="releaseDate"></fmt:message></label>
                <div class="col-sm-3">
                    <input type="text" name="releaseDate" class="form-control">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2"><fmt:message key="description"></fmt:message></label>
                <div class="col-sm-5">
                    <textarea name="description" id="description" cols="50" rows="2"
                        class="form-control" placeholder="100자 이상 적어주세요"></textarea>
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2"><fmt:message key="category"></fmt:message></label>
                <div class="col-sm-3">
                    <input type="text" name="category" class="form-control">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2"><fmt:message key="unitsInStock"></fmt:message></label>
                <div class="col-sm-3">
                    <input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
                </div>
            </div>

            <!-- 🔥 게임 URL 입력칸 -->
            <div class="mb-3 row">
<label class="col-sm-2"><fmt:message key="gameUrl" /></label>
                <div class="col-sm-5">
                    <input type="text" name="gameUrl" class="form-control"
                           placeholder="https://... 실제 게임 실행 주소">
                </div>
            </div>

            <!-- 상태(컨디션) 안 쓸 거면 이렇게 통째로 숨기기 -->
            <%-- 
            <div class="mb-3 row">
                <label class="col-sm-2"><fmt:message key="condition"></fmt:message></label>
                <div class="col-sm-5">
                    <input type="radio" name="condition" value="New"> <fmt:message key="New"></fmt:message>
                    <input type="radio" name="condition" value="Old"> <fmt:message key="Old"></fmt:message>
                    <input type="radio" name="condition" value="EBook"> <fmt:message key="EBook"></fmt:message>
                </div>
            </div>
            --%>

            <!-- BookImage 라벨만 한글/공백으로 바꾸기 (??? 제거) -->
            <div class="mb-3 row">
<label class="col-sm-2"><fmt:message key="image" /></label>
                <div class="col-sm-5">
            	    <input type="file" name="BookImage" class="form-control">
                </div>
            </div>

            <div class="mb-3 row">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="button" class="btn btn-primary" value="등록"
                           onclick="CheckAddProduct()">
                </div>
            </div>

        </form>
    </div>

    <jsp:include page="footer.jsp" />
</div>
</fmt:bundle>
</body>
</html>
