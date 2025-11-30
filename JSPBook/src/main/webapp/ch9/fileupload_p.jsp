<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.oreilly.servlet.*" %>    
<%@ page import="com.oreilly.servlet.multipart.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<% MultipartRequest muti= new MultipartRequest(request, "/Users/jeongheon-yong/Downloads/ch07_Sample Pictures",5 * 1024 *1024, "utf-8", new DefaultFileRenamePolicy());

Enumeration params = muti.getParameterNames();


while (params.hasMoreElements()){
	
	String name = (String) params.nextElement();
	String value = muti.getParameter(name);
	out.println(name + "="+ value + "<br>");
	
}

out.println("-----------------------<br>");



Enumeration files = muti.getFileNames();

while(files.hasMoreElements()){
	String name = (String) files.nextElement();
	String filename= muti.getFilesystemName(name);
	String original= muti.getOriginalFileName(name);
	String type= muti.getContentType(name);
	File file= muti.getFile(name);
	
	out.println("요청 파라미터 이름" + name + "<br>");
	out.println("실제 파일 이름" + original + "<br>");
	out.println("저장 파일 이름" + filename + "<br>");
	out.println("파일 콘첸츠 유형" + type + "<br>");

	if(file!= null){
		out.println("파일 크기 : " + file.length());
		out.println("<br>");
		
	}
	
	
}



%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>