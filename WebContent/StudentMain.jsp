<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>



<% 
	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str="";
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "lim0515";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
			
		String sql = "select * from student where student_id = ?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, student_id);
		pstmt.execute();
		str=student_id+" 성공";
	}catch(Exception e){
		e.printStackTrace();
		str="실패";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login 화면</title>
</head>
<body>
	<%=str %>
	<a href="StudentInfo.jsp?">학적</a>
	<a href="">수강 내역</a>
	장학생 현황
	성적표
	교과목
	강의시간표
</body>
</html>