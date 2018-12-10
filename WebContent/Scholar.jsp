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
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
			
		String sql = "select * from scholar where student_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,student_id);
		pstmt.execute();
		str=student_id+" ����";
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
	<h2>���л� ��Ȳ</h2>
	�й� : <%=student_id %>
	<table style="border : 1px solid; border-collapse:collapse;">
		<tr style="width=100px; height:60px;">
		<td style="border : 1px solid">����</td>
		<td style="border : 1px solid">���бݸ�</td>
		<td style="border : 1px solid">�����б�</td>
		<td style="border : 1px solid">���бݾ�</td>
		</tr>
	
	<%
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
		<td>�Ѿ�</td>
		<td colspan="3"><%=sum %></td>
		</tr>
		
	</table>
		<%
		

	%>
	<a href="StudentMain.jsp">�ڷ� ����</a>
</body>
</html>
<% }catch(Exception e){
		e.printStackTrace();
	}
%>