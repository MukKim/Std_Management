<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
 <%@page import="java.util.*"%>   
<%
	//int subject_id = Integer.parseInt(session.getAttribute("subject_id").toString());
	//String Subject_id= (String) request.getSession().getAttribute("Subject_id");
	
	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	ArrayList subject_list = new ArrayList();
	try {
		
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
		//for exception
		String test_sql = "select * from student_subject where student_id = ?";
		pstmt=conn.prepareStatement(test_sql);
		pstmt.setInt(1, student_id);
		pstmt.execute();
		ResultSet test = pstmt.executeQuery();
		
		while(test.next()){
			int sd_id = test.getInt("subject_id");
			subject_list.add(sd_id);
		}
		
%>
<!DOCTYPE html>
<html>
<head>
<style>


#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	width: 100%;
	text-align: center;
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
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table id = "customers">
		<tr>
			<td style="border : 1px solid">학기</td>
			<td style="border : 1px solid">학수번호</td>
			<td style="border : 1px solid">과목명</td>
			<td style="border : 1px solid">학점</td>
			<td style="border : 1px solid">전공/교양</td>
			<td style="border : 1px solid">담당교수</td>
			<td style="border : 1px solid">시간</td>
			<td style="border : 1px solid">수강취소</td>
		</tr>
	<%
	int i=0;
	while(i<subject_list.size()){
		String subject_sql = "select * from subject where subject_id = ?";
		pstmt=conn.prepareStatement(subject_sql);
		pstmt.setInt(1, (int)subject_list.get(i));
		pstmt.execute();
		ResultSet test2 = pstmt.executeQuery();
		i++;
	
	while(test2.next()){
		String semester, id, name, score, major, prof, time;
		semester = id = name = score = major = prof = time = "";
		semester = test2.getString("subject_semester");
		id = test2.getString("subject_id");
		name = test2.getString("subject_name");
		score = test2.getString("subject_score");
		major = test2.getString("subject_major");
		prof = test2.getString("subject_prof");
		time = test2.getString("subject_time");
		
	%>
			<tr>
				<td style="border : 1px solid"><%=semester %></td>
				<td style="border : 1px solid"><%=id %></td>
				<td style="border : 1px solid"><%=name %></td>
				<td style="border : 1px solid"><%=score %></td>
				<td style="border : 1px solid"><%=major %></td>
				<td style="border : 1px solid"><%=prof %></td>
				<td style="border : 1px solid"><%=time %></td>
				<td style="border : 1px solid">
					<form action="Register_delete_result.jsp" method="post">
					<input type="hidden" name="student_id1" value="<%=student_id%>">
					<input type="hidden" name ="subject_id" value="<%=id %>" >
					<input type="submit" value = "수강취소">
					</form>
				</td>
			</tr>
		<% }
	}
	%>
	</table>
	
	
	<button onclick="popup()">강의 시간표</button>
	<a href="Register.jsp">뒤로가기</a>
	
	<script>
		function popup(){
			var url = "popup.jsp";
			var name = "popup";
			window.open(url, name, "width=300, height=300, toolbar=no status=no, location=no, scrollbars=yes, menubar=no, resizable=yes, left=50, right=50");
		}
	</script>
</body>
</html>
<%
} catch (Exception e) {
				e.printStackTrace();
}
 %>