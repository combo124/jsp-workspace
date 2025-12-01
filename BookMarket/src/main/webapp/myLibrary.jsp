<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="dao.LibraryDao" %>

<%
    String memberId = (String) session.getAttribute("id");
    if (memberId == null) {
        out.println("<script>");
        out.println("alert('로그인 후 이용 가능한 서비스입니다.');");
        out.println("location.href='login.jsp';");
        out.println("</script>");
        return;
    }

    // 🔐 관리자 여부 체크
    String role = (String) session.getAttribute("role");
    boolean isAdmin = "ADMIN".equals(role);

    BookRepository bookDao = BookRepository.getInstance();
    LibraryDao libraryDao = LibraryDao.getInstance();

    // 🔹 1) DB에서 이 회원이 가진 게임 ID 목록 가져오기
    List<String> libraryIds = libraryDao.getBookIdsByMember(memberId);
%>

<html>
<head>
    <title>My Game Library</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="container mt-5">
    <h2>내 게임 라이브러리</h2>
    <hr/>

    <%
        if (libraryIds == null || libraryIds.isEmpty()) {
    %>
        <p>소유하신 게임이 없으세요.</p>
    <%
        } else {
    %>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>코드</th>
                <th>게임 이름</th>
                <th>가격</th>
                <th>게임 시작</th>
                <th>상세</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (String id : libraryIds) {
                    Book book = bookDao.getBookById(id);
                    if (book == null) continue;
            %>
                <tr>
                    <td><%= book.getBookId() %></td>
                    <td><%= book.getName() %></td>
                    <td><%= book.getUnitPrice() %></td>

                    <!-- ⭐ 라이브러리는 풀버전: 바로 gameUrl로 이동 (쿨타임 없음) -->
                    <td>
                        <a href="<%= book.getGameUrl() %>" 
                           target="_blank"
                           class="btn btn-sm btn-success">
                            게임 시작
                        </a>
                    </td>

                    <td>
                        <a href="book.jsp?id=<%= book.getBookId() %>" 
                           class="btn btn-sm btn-primary">
                            상세보기
                        </a>
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    <%
        }
    %>

    <a href="books.jsp" class="btn btn-secondary mt-3">← 게임 상점으로 돌아가기</a>

    <% if (isAdmin) { %>
        <!-- 🔐 관리자 전용: 게임 등록 버튼 -->
        <a href="addBook.jsp" class="btn btn-warning mt-3 ms-2">
            게임 등록 (관리자)
        </a>
    <% } %>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
