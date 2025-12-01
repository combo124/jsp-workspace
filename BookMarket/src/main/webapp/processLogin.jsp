<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dao.MemberDao" %>

<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");

    MemberDao dao = MemberDao.getInstance();
    int result = dao.login(id, passwd);

    if (result == 1) {
        // ⭐ 로그인 성공 → role까지 가져오기
        String role = dao.getRoleById(id);   // MemberDao에 만든 메서드

        // 세션에 로그인 정보 저장
        session.setAttribute("id", id);
        session.setAttribute("role", role);  // ADMIN / USER 등

        out.println("<script>");
        out.println("alert('로그인 성공!');");
        out.println("location.href='welcome.jsp';"); // 홈으로 이동
        out.println("</script>");

    } else if (result == 0) {
        out.println("<script>");
        out.println("alert('비밀번호가 틀렸습니다.');");
        out.println("history.back();");
        out.println("</script>");
    } else if (result == -1) {
        out.println("<script>");
        out.println("alert('존재하지 않는 아이디입니다.');");
        out.println("history.back();");
        out.println("</script>");
    } else {
        out.println("<script>");
        out.println("alert('로그인 중 오류가 발생했습니다.');");
        out.println("history.back();");
        out.println("</script>");
    }
%>
