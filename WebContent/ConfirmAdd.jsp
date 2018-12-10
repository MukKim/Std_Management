<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>


<%
	String student_id = request.getParameter("student_id");
	String password = request.getParameter("password");
	String grade = request.getParameter("grade");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String school = request.getParameter("school");
	String major = request.getParameter("major");
	

	
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {

		String jdbcUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql2 = "insert into student values(?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, password);
		pstmt.setString(2, school);
		pstmt.setString(3, major);
		pstmt.setInt(4, Integer.valueOf(student_id));
		pstmt.setString(5, name);
		pstmt.setInt(6, Integer.valueOf(grade));
		SimpleDateFormat transFormat = new SimpleDateFormat("yy-MM-dd");
		java.util.Date d = transFormat.parse(birth);
		java.sql.Date sqlDate = new java.sql.Date(d.getTime());
		pstmt.setDate(7, sqlDate);

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
	alert("학생 정보 입력이 성공하였습니다.");
	window.onlocation("AddStudent.jsp");
</script>

<%
	} catch (Exception e) {
		e.printStackTrace();
%>
<script>
	alert("학생 정보 입력이 실패하였습니다.");
	history.go(-1);
</script>
<%
	}
%>

</body>
</html>