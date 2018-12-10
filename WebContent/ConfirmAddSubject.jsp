<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>


<%

	String subject_semester = request.getParameter("subject_semester");
	String subject_id = request.getParameter("subject_id");
	String subject_name = request.getParameter("subject_name");
	String subject_score = request.getParameter("subject_score");
	String subject_major = request.getParameter("subject_major");
	String subject_prof = request.getParameter("subject_prof");
	String subject_time = request.getParameter("subject_time");
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {

		String jdbcUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql3 = "insert into subject values(?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql3);
		
		pstmt.setInt(1, Integer.valueOf(subject_semester));
		pstmt.setInt(2, Integer.valueOf(subject_id));
		
		pstmt.setString(3, subject_name);
		pstmt.setString(4, subject_score);
		pstmt.setString(5, subject_major);
		pstmt.setString(6, subject_prof);
		pstmt.setString(7, subject_time);

		pstmt.executeUpdate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
<script>
	alert("교과목 정보 입력이 성공하였습니다.");
	//window.onlocation("AdminMain.jsp");
	window.history.back();
	
</script>

<%
	//response.sendRedirect("AddSubject.jsp");
	
	} catch (Exception e) {
		e.printStackTrace();
%>
<script>
	alert("교과목 정보 입력이 실패하였습니다.");
	history.go(-1);
</script>
<%
	}
%>

</body>
</html>