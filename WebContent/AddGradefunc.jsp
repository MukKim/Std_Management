<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%

	String admin_id = (String)session.getAttribute("sessionid");

	int student_id = Integer.valueOf(request.getParameter("student_id"));
	int subject_id = Integer.valueOf(request.getParameter("subject_id"));
	String student_grade = request.getParameter("student_grade");

	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	ArrayList<String> num_subject = new ArrayList<String>();
	
	try {
		
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
		String test_sql = "update student_subject set student_grade= ? where (student_id = ? and subject_id = ?)";
		pstmt=conn.prepareStatement(test_sql);

		pstmt.setString(1, student_grade);
		pstmt.setInt(2, student_id);
		pstmt.setInt(3, subject_id);
		pstmt.executeUpdate();
		
		
		response.sendRedirect("AdminMain.jsp");
		
} catch (Exception e) {
				e.printStackTrace();
}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

