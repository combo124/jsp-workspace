<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dao.MemberDao" %>

<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    MemberDao dao = MemberDao.getInstance();
    int result = dao.insertMember(id, passwd, name, email);

    if (result == 1) {
        out.println("<script>");
        out.println("alert('회원가입이 완료되었습니다. 로그인해주세요.');");
        out.println("location.href='login.jsp';");
        out.println("</script>");
    } else {
        out.println("<script>");
        out.println("alert('회원가입에 실패했습니다. (아이디 중복 등)');");
        out.println("history.back();");
        out.println("</script>");
    }
%>
