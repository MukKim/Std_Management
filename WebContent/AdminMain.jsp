<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<<<<<<< HEAD
<%@page import="java.sql.*" %>

<% 
	String admin_id = (String)session.getAttribute("sessionid");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str="";
	
	try{
		
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "4821";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
			
	;
	}catch(Exception e){
		e.printStackTrace();
		str="실패";
	}
%>
=======
>>>>>>> 7cb2100b538f39f43e660c0821667fbb8ffb4ee1
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<<<<<<< HEAD
<title>login 화면</title>
</head>
<body>
	<%=str %>
<a href="AddStudent.jsp">학번부여</a>
=======
<title>Insert title here</title>
</head>
<body>
>>>>>>> 7cb2100b538f39f43e660c0821667fbb8ffb4ee1

</body>
</html>