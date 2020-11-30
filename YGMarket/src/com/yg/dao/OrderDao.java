package com.yg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yg.dto.OrderBean;
import com.yg.dto.ProductBean;

public class OrderDao {
	private static final OrderDao instance = new OrderDao();
	private OrderDao() { }
	public static OrderDao getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Connection conn = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database1?characterEncoding=UTF-8&serverTimezone=UTC","root","jisun");
		return conn;
	}
	private void closeConnection(Connection conn, PreparedStatement pstmt, ResultSet rs) throws SQLException {
		if(rs!=null) {
			rs.close();
		}
		if(pstmt!=null) {
			pstmt.close();
		}
		if(conn!=null) {
			conn.close();
		}
	}
	
	public void insertOrder(int member_id, String code, int qty) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into database1.order(code, qty, member_id) values(?,?,?)";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setInt(2, qty);
			pstmt.setInt(3, member_id);
			pstmt.executeUpdate();
			closeConnection(conn, pstmt, null);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void plusOrder(int member_id, String code, int qty) {
		try {
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			
			String sql = "update database1.order set qty=qty+? where member_id=? and code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qty);
			pstmt.setInt(2, member_id);
			pstmt.setString(3, code);
			pstmt.executeUpdate();
			closeConnection(conn, pstmt, null);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateOrder(int member_id, String code, int qty) {
		try {
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			
			String sql = "update database1.order set qty=? where member_id=? and code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qty);
			pstmt.setInt(2, member_id);
			pstmt.setString(3, code);
			pstmt.executeUpdate();
			closeConnection(conn, pstmt, null);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean searchOrder(int member_id, String code) {
		boolean search = false;
		try {
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select count(*) from database1.order where member_id=? and code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			pstmt.setString(2, code);
			System.out.println("searchOrder:"+pstmt);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int n = rs.getInt(1);
				if(n>0) {	
					search = true;
				} else search = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return search;
	}
	
	public ArrayList<OrderBean> getOrderListFromMemberId(int member_id) throws Exception {
		ArrayList<OrderBean> listResult = new ArrayList<OrderBean>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM database1.order WHERE member_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,  member_id);
		//System.out.println("getOrderListFromMemberId:"+pstmt);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			OrderBean bean = new OrderBean();
			bean.setOrdernum(rs.getInt("ordernum"));
			bean.setMember_id(rs.getInt("member_id"));
			bean.setCode(rs.getString("code"));
			bean.setQty(rs.getInt("qty"));
			listResult.add(bean);
		}
		return listResult;
	}
	
	public void deleteOrder(int ordernum) {
		try {
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			
			String sql = "delete from database1.order where ordernum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ordernum);
			pstmt.executeUpdate();
			
			closeConnection(conn, pstmt, null);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
//	public void totalPrice(int member_id) {
//		try {
//			Connection conn = getConnection();
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			
//			String sql = "";
//			
//			closeConnection(conn, pstmt, rs);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
//	}
}












