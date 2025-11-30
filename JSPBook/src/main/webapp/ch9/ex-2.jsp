<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<html>
<head>
    <title>File Upload</title>
</head>
<body>

<%
    String path = "/Users/jeongheon-yong/Downloads/ch07_Sample Pictures";   
    DiskFileUpload upload = new DiskFileUpload();

    upload.setSizeMax(10000000);       
    upload.setSizeThreshold(4096);     
    upload.setRepositoryPath(path);    

    List items = upload.parseRequest(request);
    Iterator params = items.iterator();

    while (params.hasNext()) {
        FileItem item = (FileItem) params.next();

        if (!item.isFormField()) {   
            String fileFieldName = item.getFieldName();   
            String fileName = item.getName();             
            String contentType = item.getContentType();   
            long fileSize = item.getSize();               

            if (fileName != null) {
                fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
            }

            File file = new File(path + "/" + fileName);
            item.write(file); // 

            // ✅ 파일 정보 출력
            out.println("-----------------------------------------<br>");
            out.println("요청 파라미터 이름 : " + fileFieldName + "<br>");
            out.println("실제 파일 이름 : " + fileName + "<br>");
            out.println("파일 콘텐츠 유형 : " + contentType + "<br>");
            out.println("파일 크기 : " + fileSize + " Byte<br>");
        }
    }
%>

</body>
</html>
