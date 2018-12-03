<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<%@page import ="java.text.*" %>


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
   String str = "";
   
   
   try {
	   
      String jdbcUrl = "jdbc:mysql://localhost:3306/std_management";
      String dbId = "root";
      String dbPass = "4821";
      
      
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
	  SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-DD");
	  java.util.Date d = transFormat.parse(birth);
	  java.sql.Date sqlDate = new java.sql.Date(d.getTime());
	  pstmt.setDate(7, sqlDate);
	  pstmt.executeUpdate();
	  
	  
	str = "Complete to insert the movie";
	
	
	} catch (Exception e) {
		e.printStackTrace();
		str = "Fail";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Movie Insert Result</title>
</head>
<body>
   <h1>Movie Insert Result</h1>
   <%=str %><br>
   <a href="AddStudent.jsp">Back</a>
</body>
</html>