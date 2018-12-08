<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>

<% 
	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());

	String birthmodi = request.getParameter("birth");
	String passwdmodi = request.getParameter("password");

	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
		
		String sql = "update student set birth = ? where student_id= ?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, birthmodi);
		pstmt.setInt(2, student_id);
		pstmt.executeUpdate();
	
		String sql2 = "update student set password = ? where student_id= ?";	
		pstmt=conn.prepareStatement(sql2);
		pstmt.setString(1, passwdmodi);
		pstmt.setInt(2, student_id);
		pstmt.executeUpdate();
		response.sendRedirect("StudentMain.jsp");
	}catch(Exception e){
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
