<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dao.DemoUseDao" %>

<%
    request.setCharacterEncoding("utf-8");

    // 1) 로그인 체크
    String memberId = (String) session.getAttribute("id");
    if (memberId == null) {
        out.println("<script>");
        out.println("alert('로그인 후 데모를 이용할 수 있습니다.');");
        out.println("location.href='login.jsp';");
        out.println("</script>");
        return;
    }

    // 2) 파라미터 받기 (goDemo.jsp 에서 gameId, gameUrl 넘겨줬다고 가정)
    String gameId  = request.getParameter("gameId");   // = b_id (ISBN)
    String gameUrl = request.getParameter("gameUrl");  // 실제 게임 URL

    if (gameId == null || gameId.isEmpty()) {
        out.println("<script>");
        out.println("alert('게임 정보가 없습니다.');");
        out.println("history.back();");
        out.println("</script>");
        return;
    }

    // 3) DAO 호출해서 쿨타임 체크
    DemoUseDao dao = DemoUseDao.getInstance();
    DemoUseDao.DemoResult result = dao.checkAndUseDemo(memberId, gameId);

    if (result.canUse) {
        // ✅ 성공: 게임 새 탭으로 열기 + 안내 → 다시 goDemo 로
        out.println("<script>");
        if (gameUrl != null && !gameUrl.isEmpty()) {
            out.println("window.open('" + gameUrl + "', '_blank');");
        }
        out.println("alert('데모 사용 시작! 60초 뒤에 다시 이용할 수 있어요.');");
        out.println("location.href='goDemo.jsp?gameId=" + gameId + "';");
        out.println("</script>");
    } else {
        // ❌ 실패: 남은 쿨타임만 보여주고 뒤로가기
        out.println("<script>");
        out.println("alert('아직 " + result.remainSec +
                    "초 남았습니다. 나중에 다시 시도해 주세요.');");
        out.println("history.back();");
        out.println("</script>");
    }
%>
