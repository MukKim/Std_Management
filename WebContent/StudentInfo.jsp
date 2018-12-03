<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>

<% 

	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str="";
	
	
	String rpassword = "";
	String rschool = "";
	String rmajor  = "";
	String rstudent_id  = "";
	String rname  = "";
	String rgrade  = "";
	String rbirth  = ""; 
	
	
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "4821";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
			
		
		
		String sql = "select * from student where student_id = ?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, student_id);
		//pstmt.execute();
		//str=student_id+" 성공";
		
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			
			 rpassword = rs.getString("password");
			 rschool = rs.getString("school");
			 rmajor = rs.getString("major");
			 rstudent_id = rs.getString("student_id");
			 rname = rs.getString("name");
			 rgrade = rs.getString("grade");
			 rbirth = rs.getString("birth");
		}
		
	}catch(Exception e){
		e.printStackTrace();
		//str="실패";
	}
		
		
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="StudentRevise.jsp">


<table border="2">
<tr>
	<td>학번</td>
	<td><%=rstudent_id %></td> 
</tr>
<tr>
	<td>전공</td>
	 <td><%=rmajor %></td> 
</tr>
<tr>
	<td>이름</td> 
	<td><%=rname %></td> 
</tr>
<tr>
	<td>학년</td>
	 <td><%=rgrade %></td> 
</tr>
<tr>
	<td>생년월일</td> 
	<td><input type="text" name="birth" value="<%=rbirth%>"></td> 
</tr>
<tr>
	<td>비밀번호</td>
	 <td><input type="password" name="password" value="<%=rpassword%>"></td> 
</tr>
<input type="submit" value="수정하기" id="submit" onclick="submit_click()">
</form>

<script>
function submit_click() {
	alert("수정을 합니다!");
}
</script>

<!-- 
     테이블 적용 전의 양식
	<%out.println("학교 " + rschool);%><br/>
	<%out.println("전공 " + rmajor);%><br/>
	<%out.println("이름 " + rname);%><br/>
	<%out.println("학년 " + rgrade);%><br/>
	<%out.println("생년월일 " + rbirth);%><br/>
	<%out.println("비밀번호 " + rpassword);%><br/>
	 -->
</table>

</body>
</html>
