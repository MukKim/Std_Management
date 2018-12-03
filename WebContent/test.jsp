<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>1부터 10까지 순서대로</h3>
 <%
	for(int i = 1; i <= 10; i++){
		out.print(i + "<BR>");
	}
 
 	Connection conn = null;
 	
 	try{
 		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
 		String dbId = "root";
 		String dbPass = "lim0515";
 		Class.forName("com.mysql.jdbc.Driver");
 		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
 		out.print("goood");
 	}catch(Exception e){
 		e.printStackTrace();
 	}
 %>
</body>
</html>