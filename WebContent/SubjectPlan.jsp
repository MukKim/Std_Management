<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<<<<<<< HEAD
<%@page import="java.sql.*" %>

<% 
	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());

	String birthmodi = request.getParameter("birth");
	String passwdmodi = request.getParameter("password");



	Connection conn = null;
	PreparedStatement pstmt = null;
	String str="";

	
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "4821";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
			
		
		String sql = "update student set birth = ?";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, birthmodi);
		pstmt.executeUpdate();
		
		
		
		String sql2 = "update student set password = ?";
		
		pstmt=conn.prepareStatement(sql2);
		pstmt.setString(1,passwdmodi );
		pstmt.executeUpdate();

		response.sendRedirect("StudentInfo.jsp");
		
	}catch(Exception e){
		e.printStackTrace();
		//str="½ÇÆÐ";
	}
		
		
		
%>
=======
>>>>>>> 7cb2100b538f39f43e660c0821667fbb8ffb4ee1
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<<<<<<< HEAD





</body>
</html>
=======
</body>
</html>
>>>>>>> 7cb2100b538f39f43e660c0821667fbb8ffb4ee1
