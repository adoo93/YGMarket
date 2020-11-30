package com.yg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.yg.dto.MemberBean;

public class MemberDao {
	
	private static final MemberDao instance = new MemberDao();
	
	public MemberDao() {
	}
	public static MemberDao getInstance() {
		return instance;
	}
	private Connection getConnection() throws Exception {
		Connection conn=null;
		 Class.forName("com.mysql.cj.jdbc.Driver");
		 conn = DriverManager.getConnection(
				 "jdbc:mysql://localhost:3306/database1?characterEncoding=UTF-8"
				 + "&serverTimezone=UTC", "root", "jisun");
		return conn;
	}
	private void closeConnection(Connection conn, PreparedStatement pstmt, ResultSet rs) throws SQLException {
		if(rs != null) { 
			rs.close();
		}
		if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
	}
	
	//회원등록
	public void insertMember(MemberBean memberBean) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = getConnection();
		String sql = "INSERT INTO member(name, ID, PW, email, phone, address) VALUES (?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberBean.getName());
		pstmt.setString(2, memberBean.getID());
		pstmt.setString(3, memberBean.getPW());
		pstmt.setString(4, memberBean.getEmail());
		pstmt.setString(5, memberBean.getPhone());
		pstmt.setString(6, memberBean.getAddress());
		pstmt.executeUpdate();
		closeConnection(conn,pstmt,null);
		System.out.println(sql);
		/*
		Connection conn = null;
		Statement st = null;
		
		conn=getConnection();
		String sql = "insert into member(name, ID, PW, email, tel, adress) values('"+memberBean.getName()+"','"+memberBean.getID()+"','"+
																					memberBean.getPW()+"','"+memberBean.getEmail()+"','"+
																					memberBean.getTel()+"','"+memberBean.getAdress()+"')";
		st = conn.createStatement();
		st.execute(sql);
		
		
		closeConnection(conn, null, null);
		 */
		
	}
	//회원조회
	public MemberBean selectMember(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = getConnection();
		String sql = "SELECT * FROM member WHERE ID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		MemberBean mb = null;
		if(rs.next()) {
			mb = new MemberBean();
			mb.setAddress(rs.getString("address"));
			mb.setEmail(rs.getString("email"));
			mb.setID(rs.getString("ID"));
			mb.setName(rs.getString("name"));
			mb.setPW(rs.getString("PW"));
			mb.setPhone(rs.getString("phone"));
		}
		closeConnection(conn, pstmt, rs);
		return mb;
	}
	
	//member 로그인
	public boolean login(String id, String pw) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean login = false;
		
		try {
			conn = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		String sql = "SELECT COUNT(*) FROM MEMBER WHERE ID=? and PW=?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
	    pstmt.setString(2, pw);
	    rs = pstmt.executeQuery();
	    
	    int n = 0;
		if(rs.next()) {
			n = rs.getInt(1);
		}
		
		if(n==1){
			login=true;
				}
		return login;
	}
	
	public boolean idCheck(String id) throws Exception {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean idCheck = true; //중복된 아이디 없다고 가정
		
		String sql = "SELECT COUNT(*) FROM MEMBER WHERE ID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		int n = 0;
		if(rs.next()) {
			n = rs.getInt(1);
		}
		if(n>=1) {
			idCheck=false;
		}
		return idCheck;					
	}
//		//admin 로그인
//		public boolean loginAdmin(String id, String pw) throws SQLException {
//			Connection conn = null;
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			boolean login = false;
//			
//			try {
//				conn = getConnection();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			
//			String sql = "SELECT COUNT(*) FROM MEMBER WHERE id=? and pw=?";
//			
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setString(1,id);
//			pstmt.setString(2, pw);
//			rs = pstmt.executeQuery();
//			
//			int n = 0;
//			if(rs.next()) {
//				n = rs.getInt(1);
//			}
//			
//			if(n==1){
//				login=true;
//			}
//			return login;
//		}
	
	//id찾기
	   public String findId(String name, String email) throws SQLException  {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try {
	         conn = getConnection();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      String sql = "SELECT ID FROM member WHERE name= ? AND email= ?";
	      
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, name);
	         pstmt.setString(2, email);
	         rs = pstmt.executeQuery();
	         
	         String id ="";
	         if(rs.next()) id= rs.getString(1);
	         
	         closeConnection(conn, pstmt, rs);
	         return id;
	      }
	   
	   //Pw찾기
	      public String findPw(String name, String id, String email) throws SQLException  {
	         Connection conn = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         
	         try {
	            conn = getConnection();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         
	         String sql = "SELECT PW FROM member WHERE name= ? and ID= ? and email= ?";
	         
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, name);
	            pstmt.setString(2, id);
	            pstmt.setString(3, email);
	            rs = pstmt.executeQuery();
	            
	            String pw ="";
	            if(rs.next()) pw= rs.getString(1);
	            
	            closeConnection(conn, pstmt, rs);
	            return pw;
	         }

	
	public int getMemberIdFromId(String id) throws Exception {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select member_id FROM member WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			int member_id = rs.getInt(1);
			return member_id;
		}
		return -1;
	}
}
