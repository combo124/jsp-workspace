<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String fileuploadPath = "/Users/jeongheon-yong/Downloads/ch07_Sample Pictures";

DiskFileUpload upload = new DiskFileUpload();

upload.setSizeMax(1000000);
upload.setSizeThreshold(4096);
upload.setRepositoryPath(fileuploadPath);

List item = upload.parseRequest(request);


Iterator params= item.iterator();

while(params.hasNext()){
	FileItem fileItem = (FileItem) params.next();
	
if(fileItem.isFormField()){
	
String fileName = fileItem.getName();
fileName = fileName.substring(fileName.lastIndexOf("\\"+1));
File file = new File(fileuploadPath + "/" + fileName);
fileItem.write(file);
	
}




}





%>

</body>
</html>