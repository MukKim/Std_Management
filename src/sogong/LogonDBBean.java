package sogong;

import java.sql.*;

public class LogonDBBean {
	private static LogonDBBean instance = new LogonDBBean();

	public static LogonDBBean getInstance() {
		return instance;
	}

	private LogonDBBean() {
	}

	private Connection getConnection() throws Exception{
		Connection conn = null;
		
		String jdbUrl = "jdbc:mysql://localhost:3306/std_management";
 		String dbId = "root";
 		String dbPass = "4821";
 		
 		Class.forName("com.mysql.jdbc.Driver");
 		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
 		return conn;
	}
 		public void insertMember(LogonDataBean member) throws Exception {
 			Connection conn = null;
 			PreparedStatement pstmt = null;
 			
 			try {
 				conn = getConnection();
 				
 				pstmt = conn.prepareStatement("insert into MEMBER values (?, ?, ?, ?)");
 				pstmt.setString(1, member.getId());
 				pstmt.setString(2, member.getPasswd());
 				pstmt.setString(3, member.getName());
 				pstmt.setTimestamp(4, member.getReg_date());
 				pstmt.executeUpdate();
 			}catch(Exception ex) {
 				ex.printStackTrace();
 			}finally {
 				if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
 		 		if(conn != null)try{conn.close();}catch(SQLException ex){}
 			}
 		}
 		
 		public int userCheck(String id, String passwd) throws Exception{
 			Connection conn = null;
 			PreparedStatement pstmt = null;
 			ResultSet rs = null;
 			String dbpasswd = "";
 			int x = -1;
 			try {
 				conn = getConnection();
 				pstmt = conn.prepareStatement("select password from student where student_id = ?");
 				pstmt.setString(1, id);
 				rs = pstmt.executeQuery();
 				
 				if(rs.next()) {
 					dbpasswd = rs.getString("password");
 					if(dbpasswd.equals(passwd))
 						x = 1;
 					else
 						x = 0;
 				} else
 					x = -1;
 			}catch(Exception ex) {
 				ex.printStackTrace();
 			}finally {
 				if(rs != null)try {rs.close();}catch(SQLException ex){}
 				if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
 		 		if(conn != null)try{conn.close();}catch(SQLException ex){}
 			}
 			return x;
 		}
 		
 		
 		
 		public int adminCheck(String id, String passwd) throws Exception{
 			Connection conn = null;
 			PreparedStatement pstmt = null;
 			ResultSet rs = null;
 			String dbpasswd = "";
 			int x = -2;
 			try {
 				conn = getConnection();
 				pstmt = conn.prepareStatement("select admin_password from admin where admin_id = ?");
 				pstmt.setString(1, id);
 				rs = pstmt.executeQuery();
 				
 				if(rs.next()) {
 					dbpasswd = rs.getString("admin_password");
 					if(dbpasswd.equals(passwd))
 						x = 1;
 					else
 						x = 0;
 				} else
 					x = -1;
 			}catch(Exception ex) {
 				ex.printStackTrace();
 			}finally {
 				if(rs != null)try {rs.close();}catch(SQLException ex){}
 				if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
 		 		if(conn != null)try{conn.close();}catch(SQLException ex){}
 			}
 			return x;
 		}
 		
	}

