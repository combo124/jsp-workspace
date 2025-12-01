<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>

<%
    request.setCharacterEncoding("utf-8");

    // books.jsp 에서 넘어온 gameId 받기
    String gameId = request.getParameter("gameId");
    if (gameId == null || gameId.isEmpty()) {
        gameId = request.getParameter("id");   // 혹시 id 로 보냈을 때 대비
    }

    BookRepository dao = BookRepository.getInstance();
    Book game = dao.getBookById(gameId);

    if (game == null) {
        out.println("존재하지 않는 게임입니다. (gameId = " + gameId + ")");
        return;
    }

    String gameUrl = game.getGameUrl();
    if (gameUrl == null || gameUrl.isEmpty()) {
        out.println("게임 URL이 설정되어 있지 않습니다.");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>데모 플레이 - <%= game.getName() %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">데모 플레이</h2>

    <div class="row">
        <!-- 게임 이미지 -->
        <div class="col-md-4 mb-3">
        <img src="./resource/Images/<%=game.getFilename()%>" style="width: 250; height: 350" />
                 alt="<%= game.getName() %>">
        </div>

        <!-- 게임 정보 + 버튼 -->
        <div class="col-md-8">
            <h3><%= game.getName() %></h3>
            <p class="text-muted">
                게임 코드 : <strong><%= game.getBookId() %></strong>
            </p>

            <p class="mb-3">
                이 게임의 데모 버전은 외부 사이트에서 실행됩니다.<br>
                아래 <strong>데모 시작</strong> 버튼을 누르면 새 탭에서 게임이 열립니다.
            </p>

<a href="demoStart.jsp?gameId=<%= game.getBookId() %>&gameUrl=<%= game.getGameUrl() %>"
   class="btn btn-warning">
    데모 시작하기
</a>


            <a href="book.jsp?id=<%= game.getBookId() %>"
               class="btn btn-secondary">
                게임 정보로 돌아가기
            </a>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
