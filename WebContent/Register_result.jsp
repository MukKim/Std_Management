<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
 <%@page import="java.util.*"%>   
<%
	
	
	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());
	
	String subject_id = request.getParameter("subject_id");
	
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
		//for exception
		String test_sql = "select * from student_subject";
		pstmt=conn.prepareStatement(test_sql);
		pstmt.execute();
		ResultSet test = pstmt.executeQuery();
		while(test.next()){
			int sb_id = test.getInt("subject_id");
			int st_id = test.getInt("student_id");
			if(student_id == st_id && Integer.parseInt(subject_id)==sb_id){
				%>
				<script>
				alert("이미 수강된 과목입니다.");
				history.go(-1);
				</script>
				<%
			}
			
		}
		
		// insert data
		String insert_sql = "insert into student_subject values (?, ?, ?)";
		pstmt = conn.prepareStatement(insert_sql);
		pstmt.setInt(1, student_id);
		pstmt.setInt(2, Integer.parseInt(subject_id));
		pstmt.setString(3, " ");
		pstmt.execute();
		
		String sql = "select * from student_subject where student_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, student_id);
		pstmt.execute();
	
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			String subject_id1 = rs.getString("subject_id");
			num_subject.add(subject_id1);
		}
		
		
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
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
	while(i<num_subject.size()){
		String sql1 = "select * from subject where subject_id=?";
		pstmt = conn.prepareStatement(sql1);
		pstmt.setInt(1, Integer.parseInt((String)num_subject.get(i)));
		pstmt.execute();
		ResultSet rs1 = pstmt.executeQuery();
		String semester, id, name, score, major, prof, time;
		semester = id = name = score = major = prof = time = "";
		while(rs1.next()){
			semester = rs1.getString("subject_semester");
			id = rs1.getString("subject_id");
			name = rs1.getString("subject_name");
			score = rs1.getString("subject_score");
			major = rs1.getString("subject_major");
			prof = rs1.getString("subject_prof");
			time = rs1.getString("subject_time");
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
					<input type="hidden" name ="subject_id" value="<%=id %>" >
					<input type="submit" value = "수강취소">
					</form>
				</td>
			</tr>
		<%} 
		i++;
	}
	%>
	</table>
	
	<a href="Register.jsp">뒤로가기</button>
</body>
</html>
<%
} catch (Exception e) {
				e.printStackTrace();
				str = "실패";
}
 %>