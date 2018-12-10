<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>

<%
	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";

	String rpassword = "";
	String rschool = "";
	String rmajor = "";
	String rstudent_id = "";
	String rname = "";
	String rgrade = "";
	String rbirth = "";

	try {
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);

		String sql = "select * from student where student_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, student_id);

		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {

			rpassword = rs.getString("password");
			rschool = rs.getString("school");
			rmajor = rs.getString("major");
			rstudent_id = rs.getString("student_id");
			rname = rs.getString("name");
			rgrade = rs.getString("grade");
			rbirth = rs.getString("birth");
		}
		
		if(session.getAttribute("sessionid").toString().equals(rpassword)){
		%>
			<script>
				alert("비밀번호를 변경하세요.");
			</script>
		<%
		}
	} catch (Exception e) {
		e.printStackTrace();

	}
%>
<!DOCTYPE html>
<html>
<head>
<style>
body{
	font-family: Helvetica, Arial, sans-serif;
}
table{
	border-collapse: collapse;
}
.left_tr{
	width : 130px;
	height : 50px;
	text-align : center;
}
.right_tr{
	text-align : center;
	width : 200px;
	
}
#submit {
	text-align : center;
	border : none;
	background-color : white;
	font-family: Helvetica, Arial, sans-serif;
	width : 80px;
	height : 40px;
	cursor : pointer;
	left:40px;
	
}
#submit_col{
	text-align : center;
}
#back{
	text-decoration : none;
	
}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>학적 정보/수정 페이지</h2>
	
	<form method="post" action="StudentRevise.jsp">
		<table border=2>
			<tr>
				<td>학번</td>
				<td><%=rstudent_id%></td>
			</tr>
			<tr>
				<td>전공</td>
				<td><%=rmajor%></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=rname%></td>
			</tr>
			<tr>
				<td>학년</td>
				<td><%=rgrade%></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="birth" value="<%=rbirth%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"
					value="<%=rpassword%>"></td>
			</tr>
			<tr><td colspan="2" id="submit_col"><input type="submit" value="수정하기" id="submit"
				onclick="submit_click()"></td></tr>
	
		
	</form>
	</table>

	<a href="StudentMain.jsp" id="back">뒤로가기</a>

	<script>
		function submit_click() {
			alert("수정완료");
		}
	</script>
</body>
</html>
