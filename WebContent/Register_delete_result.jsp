<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%
	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());
	String subject_id = request.getParameter("subject_id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	try {

		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
		//for exception
		String test_sql = "select * from student_subject where student_id=?";
		pstmt = conn.prepareStatement(test_sql);
		pstmt.setInt(1, student_id);
		pstmt.execute();
		ResultSet test = pstmt.executeQuery();
		int temp = 0;
		while (test.next()) {
			String sb_id = test.getString("subject_id");
			if (Integer.parseInt(subject_id) == Integer.parseInt(sb_id)) {
				temp = Integer.parseInt(sb_id);
			}
		}
		String delete_sql = "delete from student_subject where (student_id=? and subject_id=?)";
		pstmt = conn.prepareStatement(delete_sql);
		pstmt.setInt(1, student_id);
		pstmt.setInt(2, temp);
		pstmt.execute();
%>

	<script>
		alert("수강 취소되었습니다.");
		history.go(-2);
	</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
<%
	
	} catch (Exception e) {
		e.printStackTrace();
		str = "실패";
	}
%>