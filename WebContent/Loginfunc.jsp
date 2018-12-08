<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sogong.LogonDBBean"%>


<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.userCheck(id, passwd);
	int admincheck = logon.adminCheck(id, passwd);
	if (admincheck == 1) {
		session.setAttribute("sessionid", id);
		session.setAttribute("sessionpw", passwd);
		response.sendRedirect("AdminMain.jsp");
	} else if (admincheck == 0) {
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 기능 구현</title>
</head>
<body>

	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
		} else if (admincheck == -1) {
			if (check == 1) {
				session.setAttribute("sessionid", id);
				session.setAttribute("sessionpw", passwd);
				response.sendRedirect("StudentMain.jsp");
			} else if (check == 0) {
	%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
		} else {
	%>
	<script>
		alert("아이디가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
		}
		}
	%>

</body>
</html>