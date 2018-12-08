<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style>
body{
	text-align:center;
	font-family: Helvetica, Arial, sans-serif;
}
form{
	text-align:center;
	width: 380px;
	margin: 4em auto;
	padding: 3em 2em 2em 2em;
	background: #fafafa;
	border: 1px solid #ebebeb;
	box-shadow: rgba(0,0,0,0.14902) 0px 1px 1px 0px,rgba(0,0,0,0.09804) 0px 1px 2px 0px;
}
input {
	text-align : center;
	font-size: 15px;
	padding: 10px 10px 10px 5px;
	-webkit-appearance: none;
	display: block;
	background: #fafafa;
	color: #636363;
	width: 100%;
	border: none;
	border-radius: 0;
	border-bottom: 1px solid #757575;
}
span{
	font-family: Helvetica, Arial, sans-serif;
	left : 20px;
}
#login{
	left : 270px;
	position : relative;
	text-align : center;
	width : 70px;
	cursor : pointer;
	margin-left: 50px;
}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<h2>로그인폼</h2>
	<form method="post" action="Loginfunc.jsp"> 
		<span>아이디</span> <input type="text" name="id" maxlength="12" placeholder="학번을 입력하세요."><br/> 
		<span>패스워드</span> <input type="password" name="passwd" maxlength="12" placeholder="초기 비밀번호는 학번"><br/>
		<input type="submit" id="login" value="로그인"> 
	</form>
</body>
</html>