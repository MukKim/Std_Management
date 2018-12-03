<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sogong.LogonDBBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세션 속성 설정 및 사용</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.userCheck(id, passwd);
<<<<<<< HEAD
	int admincheck = logon.adminCheck(id, passwd);
	if(admincheck == 1) {
		session.setAttribute("sessionid", id);
		session.setAttribute("sessionpw", passwd);
		response.sendRedirect("AdminMain.jsp");
	}else if(admincheck == 0){%>
	<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%	}else if(admincheck ==-1){	
	if(check == 1){
	session.setAttribute("sessionid", id);
	session.setAttribute("sessionpw", passwd);
	response.sendRedirect("StudentMain.jsp");
}else if(check == 0){%>
<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%	}else{%>
<script>
	alert("아이디가 맞지 않습니다.");
	history.go(-1);
</script>
<% }%>
<%}
%>


=======
	
	if(check == 1){
		session.setAttribute("sessionid", id);
		session.setAttribute("sessionpw", passwd);
		response.sendRedirect("StudentMain.jsp");
	}else if(check == 0){%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<%	}else{%>
	<script>
		alert("아이디가 맞지 않습니다.");
		history.go(-1);
	</script>
<% }%>
>>>>>>> 7cb2100b538f39f43e660c0821667fbb8ffb4ee1
</body>
</html>