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
		
<h1>Student Insert</h1>
	<table id="customers">
   	
   	
   	<form method="post" action="ConfirmAdd.jsp">
      	<tr><td>학번</td><td><input type="text" name="student_id" maxlength="10"></td></tr>
      	<tr><td>패스워드 </td><td><input type="password" name="password" maxlength="10"></td></tr>
      	<tr><td>학년</td><td><input type="text" name="grade" maxlength="50"></td></tr>
      	<tr><td>이름 </td><td><input type="text" name="name" maxlength="50"></td></tr>
      	<tr><td>생년월일</td><td><input type="text" name="birth" maxlength="50"></td></tr>
      	<tr><td>학교 </td><td><input type="text" name="school" maxlength="50"></td></tr>
      	<tr><td>학과</td><td><input type="text" name="major" maxlength="50"></td></tr>
 		<tr><td colspan="2"><input type="submit" value="학생 추가"></td>
  
   </form>
   </table>
   <br />
   <a href="AdminMain.jsp">뒤로가기</a>

</body>
</html>