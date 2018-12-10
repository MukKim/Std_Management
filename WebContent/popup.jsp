<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


<%
	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());

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
		String test_sql2 = "select * from student_subject where student_id = ?";
		pstmt = conn.prepareStatement(test_sql2);
		pstmt.setInt(1, student_id);
		pstmt.execute();
		ResultSet rs2 = pstmt.executeQuery();

		
%>

<!DOCTYPE html>
<html>
<head>
<style>
table{
	border: 1px solid red;
}
td, tr {
	border: 1px solid;
	text-align: center;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>과목명</td>
			<td>시간(월~금)</td>
			<td>담당교수</td>
		</tr>
		<%
		String sub = "";
		while (rs2.next()) {
			sub = rs2.getString("subject_id");
			String subject_name, subject_time, subject_prof;
			subject_name = subject_time = subject_prof=  "";
			String sql2 = "select subject_name, subject_time, subject_prof from subject where subject_id = ?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, sub);
			pstmt.execute();
			ResultSet rs3 = pstmt.executeQuery();
			
			
			while (rs3.next()) {
						subject_name = rs3.getString("subject_name");
						subject_time = rs3.getString("subject_time");
						subject_prof = rs3.getString("subject_prof");
			}
		%>



		<tr>
			<td><%=subject_name%></td>
			<td><%=subject_time%></td>
			<td><%=subject_prof%></td>
		</tr>

		<%
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	</table>
	
	<script>
	function popdown(){
		window.close();
	}
	document.onkeydown = function(event) { //esc 누르면 닫기 효과
		  if (event.keyCode == 27) {
			  popdown();
		  }
	}
	</script>
</body>
</html>