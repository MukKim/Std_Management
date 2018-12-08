<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>


<%

	String admin_id = (String)session.getAttribute("sessionid");

	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	try {
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);

		String sql = "select * from student_subject";
		pstmt = conn.prepareStatement(sql);
		pstmt.execute();

		ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

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
#plan {
	border: 1px solid #444444;
	text-align: center;
	display: none;
}

.dead {
	display: none;
}
</style>
</head>
<body>
	<table id="customers">
		<tr>
			<td>학생</td>
			<td>과목번호</td>
			<td>학점</td>
			<td>학점부여</td>
		</tr>
		<%
			String student_id;
			String subject_id;
			String student_grade;
			
			student_id = subject_id = student_grade = "";
				while (rs.next()) {
					student_id = rs.getString("student_id");
					subject_id = rs.getString("subject_id");
					student_grade = rs.getString("student_grade");
		%>

		<form action="AddGradefunc.jsp" method="post">
			<tr>
				<td><input type="text" name="student_id"
					value="<%=student_id%>" readonly></td>
				<td><input type="text" name="subject_id"
					value="<%=subject_id%>" readonly></td>
				<td><input type="text" name="student_grade"
					value="<%=student_grade%>"></td>
				<td><input type="submit" value="학점부여" onclick="submit_click()"></td>
			</tr>
		</form>
		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>

	</table>

	<a href="AdminMain.jsp">뒤로 가기</a>

<script>
function submit_click() {
	alert("학점을 부여합니다.");
	//window.location.href = "StudentMain.jsp";
}
</script>		

</body>
</html>

