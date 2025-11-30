<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.oreilly.servlet.*" %>    
<%@ page import="com.oreilly.servlet.multipart.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<% MultipartRequest muti= new MultipartRequest(request, "/Users/jeongheon-yong/Downloads/ch07_Sample Pictures",5 * 1024 *1024, "utf-8", new DefaultFileRenamePolicy());

String name1 = muti.getParameter("name1");
String subject1= muti.getParameter("subject1");

String name2 = muti.getParameter("name2");
String subject2= muti.getParameter("subject2");


String name3 = muti.getParameter("name3");
String subject3= muti.getParameter("subject3");

Enumeration files = muti.getFileNames();

String file3 = (String) files.nextElement();
String filename3 = muti.getFilesystemName(file3);

String file2 = (String) files.nextElement();
String filename2 = muti.getFilesystemName(file2);

String file1 = (String) files.nextElement();
String filename1 = muti.getFilesystemName(file1);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">

<tr>
	<th width="100">이름
	<th width="100">제목
	<th width="100">파일
	
	





</table>



</body>
</html>