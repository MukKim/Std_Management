<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
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

		String sql = "select * from subject";
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
body {
	font-family: Helvetica, Arial, sans-serif;
}

table {
	border-collapse: collapse;
	border: 2px;
}

table, tr, td {
	border: 1px solid #444444;
	text-align: center;
}

tr {
	height: 40px;
}

#plan {
	border: 1px solid #444444;
	text-align: center;
	display: none;
}

.dead {
	display: none;
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
#form{
	background :transparent;
	width : 100%;
	height : 100%;
}
#form input {
	cursor : pointer;
	width : 100%;
	height : 100%;
}

#view{
	text-decoration : none;
	color : #2E2E2E;
	cursor : pointer;
	float : right;
	margin : 10px;
}
#view:hover{
	font-weight : bold;
	color : #4B088A;
}
</style>
</head>
<body>
	<h2>수강신청 페이지</h2>
	
	<a href="Register_result_list.jsp" id="view">수강중인 과목보기</a>
	<table id="customers">
		<tr>
			<td>학기</td>
			<td>학수번호</td>
			<td>과목명</td>
			<td>학점</td>
			<td>전공/교양</td>
			<td>담당교수</td>
			<td>시간</td>
			<td>강의계획서</td>
			<td>수강신청</td>
		</tr>
		<%
			String semester, id, name, score, major, prof, time;
				semester = id = name = score = major = prof = time = "";
				int i = 1;
				while (rs.next()) {
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
			<td><%=semester%></td>
			<td><%=id%></td>
			<td><%=name%></td>
			<td><%=score%></td>
			<td><%=major%></td>
			<td><%=prof%></td>
			<td><%=time%></td>
			<td onclick=plan_open(<%=i%>)>클릭</td>
			<td>
				<form action="Register_result.jsp" id="form" method="post">
					<input type="hidden" name="subject_id" value="<%=id%>"> <input
						type="submit" value="신청">
				</form>
		</tr>
		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
				str = "실패";
			}
		%>

	</table>

	<div id="plan">
		<button id="plan_close" onclick="plan_close()"
			onkeypress="if(event.keyCode==27){plan_close();}">닫기</button>
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
				String info, prelearn, howteach, howscore, object, operate, activate, rule, refbook, weekplan, ref, handi,
						id;

				info = prelearn = howteach = howscore = object = operate = activate = rule = refbook = weekplan = ref = handi = id = "";

				int i = 1;

				while (rs.next()) {
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


			<tr id="row<%=i%>" class="dead">
				<td><%=info%></td>
				<td><%=prelearn%></td>
				<td><%=howteach%></td>
				<td><%=object%></td>
				<td><%=operate%></td>
				<td><%=activate%></td>
				<td><%=rule%></td>
				<td><%=refbook%></td>
				<td><%=weekplan%></td>
				<td><%=ref%></td>
				<td><%=handi%></td>
				<td><%=id%></td>
			</tr>


			<%
				}
			%>
		</table>


	</div>
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
	function register(id){
		
	}
	document.onkeydown = function(event) { //esc 누르면 닫기 효과
		  if (event.keyCode == 27) {
			  plan_close();
		  }
	}
</script>
</body>
</html>
