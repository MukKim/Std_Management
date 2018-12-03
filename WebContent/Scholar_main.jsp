<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>



<% 
	int student_id = Integer.parseInt(session.getAttribute("sessionid").toString());
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str="";
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
		String dbId = "root";
		String dbPass = "4821";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
			
		String sql = "select * from scholar where student_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,student_id);
		pstmt.execute();
		str=student_id+" 성공";
		ResultSet rs = pstmt.executeQuery();
		String name="";
		int semester=0;
		int price=0;
		int sum=0;
		int cnt=1;
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scholar main</title>
</head>
<body>
	
	Student_id : <%=student_id %>
	<table style="border : 1px solid; border-collapse:collapse;">
		<tr>
		<td style="border : 1px solid">구분</td>
		<td style="border : 1px solid">장학금명</td>
		<td style="border : 1px solid">장학학기</td>
		<td style="border : 1px solid">장학금액</td>
		</tr>
	
	<%
		System.out.println("this");
		while(rs.next()){
			name = rs.getString("scholar_name");
			semester= rs.getInt("scholar_semester");
			price = rs.getInt("scholar_price");
			sum += price;
			System.out.println("is");
			%>
			<tr>
			<td style="border : 1px solid"><%=cnt %></td>
			<td style="border : 1px solid"><%=name %></td>
			<td style="border : 1px solid"><%=semester %></td>
			<td style="border : 1px solid"><%=price %></td>
			</tr>
			<%
			cnt+=1;	
		}%>
		<tr>
		<td>총액</td>
		<td colspan="3"><%=sum %></td>
		</tr>
		
	</table>
		<%
		

	%>
</body>
</html>
<% }catch(Exception e){
		e.printStackTrace();
		str="실패";
	}
%>