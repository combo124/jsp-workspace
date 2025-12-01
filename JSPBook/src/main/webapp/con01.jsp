<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;

try{
	String url = "jdbc:mysql://localhost:3306/JSPBookDB";
	String user="root";
	String password = "lkshift52@";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url,user,password);
	out.println("성공!");
	
}catch (SQLException ex){
	out.println("실패!");
	out.println("SQLException:" + ex.getMessage());


}finally{
	if (conn!= null)
		conn.close();
}


%>

</body>
</html>