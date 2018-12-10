<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<title>Insert title here</title>
</head>
<body>
		
<h1>Subject Insert</h1>
	<table id="customers">
   	
   	
   	<form method="post" action="ConfirmAddSubject.jsp">
      	<tr><td>학기</td><td><input type="text" name="subject_semester" maxlength="10" required></td></tr>
      	<tr><td>교과목 번호 </td><td><input type="text" name="subject_id" maxlength="10" required></td></tr>
      	<tr><td>교과목 이름</td><td><input type="text" name="subject_name" maxlength="50" required></td></tr>
      	<tr><td>교과목 학점 </td><td><input type="text" name="subject_score" maxlength="50" required></td></tr>
      	<tr><td>교과목 이수구분</td><td><input type="text" name="subject_major" maxlength="50" required></td></tr>
      	<tr><td>교과목 교수명</td><td><input type="text" name="subject_prof" maxlength="50" required></td></tr>
      	<tr><td>교과목 시간</td><td><input type="text" name="subject_time" maxlength="50" required></td></tr>
 		<tr><td colspan="2"><input type="submit" value="교과목 추가"></td>
  
   </form>
   </table>
   <br />
   <a href="AdminMain.jsp">뒤로가기</a>

</body>
</html>