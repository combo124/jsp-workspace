<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.Enumeration" %>

<%
    request.setCharacterEncoding("UTF-8");
//파일 업로드 처리 변수 설정
String filename = "";
//실제 업로드될 경로 (현재 BookMarket 프로젝트가 생성된 위치 기준)
String realFolder = "/Users/jeongheon-yong/Documents/코딩/자바/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/BookMarket/resource/Images";
//혹은 아래처럼 웹 경로로 동적으로 설정하는 게 더 좋음
//String realFolder = application.getRealPath("/resources/images");

int maxSize = 5 * 1024 * 1024;   // 업로드 파일 최대 크기: 5MB
String encType = "utf-8";        // 인코딩 유형

//MultipartRequest 객체 생성 (파일 업로드 처리 핵심)
MultipartRequest multi = new MultipartRequest(
     request, 
     realFolder, 
     maxSize, 
     encType, 
     new DefaultFileRenamePolicy()   // 동일 파일명 업로드 시 자동 이름 변경
);

//▶ 일반 입력 값(텍스트 폼 데이터) 가져오기
String bookId = multi.getParameter("bookId");
String name = multi.getParameter("name");
String unitPrice = multi.getParameter("unitPrice");
String author = multi.getParameter("author");
String publisher = multi.getParameter("publisher");
String releaseDate = multi.getParameter("releaseDate");
String description = multi.getParameter("description");
String category = multi.getParameter("category");
String unitsInStock = multi.getParameter("unitsInStock");
String condition = multi.getParameter("condition");

//▶ 파일 업로드 처리 (파일 이름 가져오기)
Enumeration files = multi.getFileNames();     // 업로드된 파일 name 속성들
String fname = (String) files.nextElement();  // <input type="file" name="???">
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
    newBook.setFilename(filename);

    dao.addBook(newBook);
    response.sendRedirect("books.jsp");
%>
