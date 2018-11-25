<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = "";
	try {
		id = (String) session.getAttribute("id");
		if (id == null || id.equals("")) {
			response.sendRedirect("sessionLoginForm.jsp");
		} else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세션을 사용한 간단한 회원인증</title>
</head>
<body>
	<b><%=id%></b>님이 로그인 하셨습니다.
	<form method="post" action="sessionLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
</body>
</html>
<%
	}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>