<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>

<%
	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);

		String sql = "select * from student_subject where student_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, student_id);
		pstmt.execute();
		ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body{
	text-align:center;
	font-family: Helvetica, Arial, sans-serif;
}
table, tr, td {
	border: 1px solid #444444;
	text-align: center;
}
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #EFFBFB;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>
	<table id="customers">
		<tr>
			<td>학생</td>
			<td>과목명</td>
			<td>성적</td>
		</tr>
		<%
			int subject_id = 0; 
			String grade = "";
				while (rs.next()) {
					subject_id = rs.getInt("subject_id");
					String subject_name = "";
					String sql2 = "select subject_name from subject where subject_id = ?";
					pstmt = conn.prepareStatement(sql2);
					pstmt.setInt(1, subject_id);
					pstmt.execute();
					ResultSet rs2 = pstmt.executeQuery();
					while(rs2.next()){
						subject_name = rs2.getString("subject_name");
					}
					grade = rs.getString("student_grade");
		%>
				<tr>
					<td><%=student_id%></td>
					<td><%=subject_name%></td>
					<td><%=grade%></td>
				</tr>

		<%
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>

	<a href="StudentMain.jsp">뒤로 가기</a>

</body>
</html>