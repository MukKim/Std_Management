<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>

<% 
	String admin_id = (String)session.getAttribute("sessionid");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login ȭ��</title>
<style>
body{
	text-align:center;
	font-family: Helvetica, Arial, sans-serif;
}
</style>
</head>
<body>
	<h1>������ ������</h1>
<a href="AddStudent.jsp">���й��ο�</a> <br/>
<a href="AddGrade.jsp">�ܼ����ο�</a> <br />
<a href="AddSubject.jsp">�ܱ��������</a> <br />
<a href="Logout.jsp">�ܷα׾ƿ�</a> <br />


</body>
</html>