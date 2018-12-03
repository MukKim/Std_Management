<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>



<% 
	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());
	Connection conn = null;
	PreparedStatement pstmt = null;
<<<<<<< HEAD
	String str="";
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "4821";
=======
	String str = "";
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "lim0515";
>>>>>>> 7cb2100b538f39f43e660c0821667fbb8ffb4ee1
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
			
		String sql = "select * from student where student_id = ?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, student_id);
		pstmt.execute();
<<<<<<< HEAD
		str=student_id+" 성공";
	}catch(Exception e){
		e.printStackTrace();
		str="실패";
=======
	}catch(Exception e){
		e.printStackTrace();
>>>>>>> 7cb2100b538f39f43e660c0821667fbb8ffb4ee1
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login 화면</title>
</head>
<body>
<<<<<<< HEAD
	<%=str %>
<a href="StudentInfo.jsp">학적</a>
   <a href="Register.jsp">수강 신청</a>
   <a href="Scholar.jsp">장학생 현황</a>
   <a href="Grading.jsp">성적표</a>
   <a href="Subject.jsp">교과목</a>
   <a href="SubjectPlan.jsp">강의계획서</a>
   <a href="scholar_main.jsp">강의계획서</a>
=======
	<a href="StudentInfo.jsp">학적</a><br/>
	<a href="Register.jsp">수강 신청</a><br/>
	<a href="Scholar.jsp">장학생 현황</a><br/>
	<a href="Grading.jsp">성적표</a><br/>
	<a href="Subject.jsp">교과목</a><br/>
	<a href="SubjectPlan.jsp">강의계획서</a><br/>
	<a href="Logout.jsp">로그아웃</a><br/>
>>>>>>> 7cb2100b538f39f43e660c0821667fbb8ffb4ee1
</body>
</html>