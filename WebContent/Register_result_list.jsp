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
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table style="border : 1px solid">
		<tr>
			<td style="border : 1px solid">�б�</td>
			<td style="border : 1px solid">�м���ȣ</td>
			<td style="border : 1px solid">�����</td>
			<td style="border : 1px solid">����</td>
			<td style="border : 1px solid">����/����</td>
			<td style="border : 1px solid">��米��</td>
			<td style="border : 1px solid">�ð�</td>
			<td style="border : 1px solid">�������</td>
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
					<input type="submit" value = "�������">
					</form>
				</td>
			</tr>
		<% }
	}
	%>
	</table>
	
	<a href="Register.jsp">�ڷΰ���</button>
</body>
</html>
<%
} catch (Exception e) {
				e.printStackTrace();
				str = "����";
}
 %>