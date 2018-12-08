<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>


<% 
	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());
	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
			
		String sql = "select * from subject";
		pstmt=conn.prepareStatement(sql);
		pstmt.execute();
		
		ResultSet rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
table, tr, td {
	border: 1px solid #444444;
	text-align: center;
}

#plan{
	border: 1px solid #444444;
	text-align: center;
	display: none;
}
#plan_close{
	float: right;
	
}
.dead{
	display: none;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td>학기</td>
			<td>학수번호</td>
			<td>과목명</td>
			<td>학점</td>
			<td>전공/교양</td>
			<td>담당교수</td>
			<td>시간</td>
			<td>강의계획서</td>
		</tr>
	<%
	String semester, id, name, score, major, prof, time;
	semester = id = name = score = major = prof = time = "";
	int i = 1;
	while(rs.next()){
		semester = rs.getString("subject_semester");
		id = rs.getString("subject_id");
		name = rs.getString("subject_name");
		score = rs.getString("subject_score");
		major = rs.getString("subject_major");
		prof = rs.getString("subject_prof");
		time = rs.getString("subject_time");
		i++;
	%>

		<tr>
			<td><%=semester %></td>
			<td><%=id %></td>
			<td><%=name %></td>
			<td><%=score %></td>
			<td><%=major %></td>
			<td><%=prof %></td>
			<td><%=time %></td>
			<td onclick = plan_open(<%=i%>)>클릭</td>
		</tr>
<% }}catch(Exception e){
	e.printStackTrace();
}
	
%>
	
	</table>
	
	<div id = "plan">
		<button id="plan_close" onclick="plan_close()" onkeypress="if(event.keyCode==27){plan_close();}">닫기</button>
	<table>
	
			<tr>
			<td>강의정보</td>
			<td>선행과목</td>
			<td>수업 방법</td>
			<td>교과 목표</td>
			<td>수업운영</td>
			<td>학습 및 평가활동</td>
			<td>수업규정</td>
			<td>참고문헌</td>
			<td>주차별 강의계획</td>
			<td>참고사항</td>
			<td>장애학생 편의사항</td>
			<td>학수번호</td>
			</tr>
	
	<% 
		String sql = "select * from subject_plan";
		
		pstmt = conn.prepareStatement(sql);
		//pstmt.setInt(1, subject_id);
		pstmt.execute(); 
		ResultSet rs = pstmt.executeQuery();
		String info, prelearn, howteach, howscore, object, operate, activate, rule, refbook, weekplan, ref, handi, id;
		
		info = prelearn = howteach = howscore = object = operate = activate = rule = refbook = weekplan
				= ref = handi = id = "";
		
		
		int i = 1;
		
		while(rs.next()){
			info = rs.getString("plan_info");
			prelearn = rs.getString("plan_prelearn");
			howteach = rs.getString("plan_howteach");
			howscore = rs.getString("plan_howscore");
			object = rs.getString("plan_object");
			operate = rs.getString("plan_operate");
			activate = rs.getString("plan_activate");
			rule = rs.getString("plan_rule");
			refbook = rs.getString("plan_refbook");
			weekplan = rs.getString("plan_weekplan");
			ref = rs.getString("plan_ref");
			handi = rs.getString("plan_handi");
			id = rs.getString("plan_id");
			i++;
			
		%>
		
			
			<tr id ="row<%=i%>" class = "dead">
			<td><%=info %></td>
			<td><%=prelearn %></td>
			<td><%=howteach %></td>
			<td><%=object %></td>
			<td><%=operate %></td>
			<td><%=activate %></td>
			<td><%=rule %></td>
			<td><%=refbook %></td>
			<td><%=weekplan %></td>
			<td><%=ref %></td>
			<td><%=handi %></td>
			<td><%=id %></td>
			</tr>

		
	<%
	
		}
	
	%>
	</table>
	
	
	</div>
	<a href="StudentMain.jsp">뒤로 가기</a>
<script>
	function plan_open(id) { //입력창 띄움
		var a = "row";
		a = a + id;
		document.getElementById('plan').style.display = 'block';
		document.getElementById(a).style.display = 'table-row';
	}
	function plan_close() { //입력창 내림
		  document.getElementById('plan').style.display = 'none';
		  var b = document.getElementsByClassName('dead');
		 
		  for(var i in b) {
			  b[i].style.display = 'none';
		  }
	}
	document.onkeydown = function(event) { //esc 누르면 닫기 효과
		  if (event.keyCode == 27) {
			  plan_close();
		  }
	}
</script>
</body>
</html>


