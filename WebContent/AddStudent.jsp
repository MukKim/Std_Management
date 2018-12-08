<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		
<h1>Student Insert</h1>
   <form method="post" action="ConfirmAdd.jsp">
      	학번 : <input type="text" name="student_id" maxlength="10"><br/>
      	패스워드 : <input type="password" name="password" maxlength="10"><br/>
      	학년 : <input type="text" name="grade" maxlength="50"><br/>
      	이름 : <input type="text" name="name" maxlength="50"><br/>
      	생년월일 : <input type="text" name="birth" maxlength="50"><br/>
      	학교 : <input type="text" name="school" maxlength="50"><br/>
      	학과 : <input type="text" name="major" maxlength="50"><br/>
   <input type="submit" value="학생 추가">
   
   </form>
   
   <br />
   <a href="AdminMain.jsp">뒤로가기</a>

</body>
</html>