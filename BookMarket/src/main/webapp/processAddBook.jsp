<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.Enumeration" %>

<%
    // 🔐 여기에도 관리자 체크 넣어도 좋음 (원하면)
    String memberId = (String) session.getAttribute("id");
    String role = (String) session.getAttribute("role");
    if (memberId == null || role == null || !"ADMIN".equals(role)) {
        out.println("<script>");
        out.println("alert('관리자만 게임을 등록할 수 있습니다.');");
        out.println("location.href='welcome.jsp';");
        out.println("</script>");
        return;
    }

    request.setCharacterEncoding("UTF-8");

    // 파일 업로드 처리 변수 설정
    String filename = "";
    String realFolder = "/Users/jeongheon-yong/Documents/코딩/자바/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/BookMarket/resource/Images";
    int maxSize = 5 * 1024 * 1024;
    String encType = "utf-8";

    MultipartRequest multi = new MultipartRequest(
        request,
        realFolder,
        maxSize,
        encType,
        new DefaultFileRenamePolicy()
    );

    // ▶ 일반 입력 값(텍스트 폼 데이터) 가져오기
    String bookId      = multi.getParameter("bookId");
    String name        = multi.getParameter("name");
    String unitPrice   = multi.getParameter("unitPrice");
    String author      = multi.getParameter("author");
    String publisher   = multi.getParameter("publisher");
    String releaseDate = multi.getParameter("releaseDate");
    String description = multi.getParameter("description");
    String category    = multi.getParameter("category");
    String unitsInStock= multi.getParameter("unitsInStock");
    String condition   = multi.getParameter("condition");

    // 🔥 여기! 게임 URL 읽기
    String gameUrl     = multi.getParameter("gameUrl");

    // ▶ 파일 업로드 처리 (파일 이름 가져오기)
    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);  // 실제 서버에 저장된 파일 이름

    Integer price;
    if (unitPrice == null || unitPrice.isEmpty())
        price = 0;
    else
        price = Integer.valueOf(unitPrice);

    long stock;
    if (unitsInStock == null || unitsInStock.isEmpty())
        stock = 0;
    else
        stock = Long.valueOf(unitsInStock);

    BookRepository dao = BookRepository.getInstance();

    Book newBook = new Book();
    newBook.setBookId(bookId);
    newBook.setName(name);
    newBook.setUnitPrice(price);
    newBook.setAuthor(author);
    newBook.setPublisher(publisher);
    newBook.setReleaseDate(releaseDate);
    newBook.setDescription(description);
    newBook.setCategory(category);
    newBook.setUnitsInStock(stock);
    newBook.setCondition(condition);

    // 🔥 게임 URL 세팅
    newBook.setGameUrl(gameUrl);

    // 🔥 이미지 파일명 세팅 (filename 말고 fileName 써야 실제 업로드된 이름 들어감)
    newBook.setFilename(fileName);

    dao.addBook(newBook);
    response.sendRedirect("books.jsp");
%>
