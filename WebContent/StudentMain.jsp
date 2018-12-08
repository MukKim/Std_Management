<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>



<% 
	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	String name ="";
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
			
		String sql = "select * from student where student_id = ?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, student_id);
		pstmt.execute();
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		name = rs.getString("name");
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style>
body {
	
}

h1 {
	font-family: Helvetica, Arial, sans-serif;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	background-color: white;
	line-height: 200%;
}

li a {
	display: block;
	width: 170px;
	font-family: Helvetica, Arial, sans-serif;
	letter-spacing: 10px;
	text-decoration: none;
	color: #424242;
}

li a:hover {
	color: #0040FF;
}

#naveli{
	font-family : Helvetica, sans-serif;
}

</style>
<title>login ȭ��</title>
</head>
<body>
	<h2>�л� ������</h2>
		<ul>
			<li id="naveli">�й� : <%=student_id %> �̸� : <%=name %></li>
		</ul>
	<hr style="width: 400px; float:left;">
	<ul>
		<li><a href="StudentInfo.jsp">������</a></li>
		<li><a href="Register.jsp">�ܼ��� ��û</a></li>
		<li><a href="Scholar.jsp">�����л� ��Ȳ</a></li>
		<li><a href="Grading.jsp">�ܼ���ǥ</a></li>
		<li><a href="Subject.jsp">�ܱ�����</a></li>
		<li><a href="Logout.jsp">�ܷα׾ƿ�</a></li>
	</ul>
</body>
</html>