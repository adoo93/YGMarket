package com.yg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.yg.dto.ProductBean;

public class ProductDao {
	
	private static final ProductDao instance = new ProductDao();
	private ProductDao() { }
	public static ProductDao getInstance() {
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database1?characterEncoding=UTF-8&serverTimezone=UTC","root","jisun");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	private void closeConnection(Connection conn, PreparedStatement pstmt, ResultSet rs) throws SQLException {
		if(rs!=null)	{	rs.close();		}
		if(pstmt!=null)	{	pstmt.close();	}
		if(conn!=null)	{	conn.close();	}
	}
	
	public List<ProductBean> productList(String type) {
		List<ProductBean> list = new ArrayList<ProductBean>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductBean pb = null;
		
		String sql = "select * from product where type=? ";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				pb = new ProductBean();
				pb.setCode(rs.getString("code"));
				pb.setImage(rs.getString("image"));
				pb.setName(rs.getString("name"));
				pb.setPrice(rs.getInt("price"));
				pb.setType(rs.getString("type"));
				
				list.add(pb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println(list.size());
		return list;
		
	}
	public ProductBean selectProduct(String code) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = getConnection();
		String sql = "select * from product where code=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, code);
		rs = pstmt.executeQuery();
		
		ProductBean pb = null;
		if(rs.next()) {
			pb = new ProductBean();
			pb.setCode(rs.getString("code"));
			pb.setImage(rs.getString("image"));
			pb.setName(rs.getString("name"));
			pb.setPrice(rs.getInt("price"));
			pb.setType(rs.getString("type"));
			pb.setUnit(rs.getString("unit"));
			pb.setOrigin(rs.getString("origin"));
			pb.setInfo1(rs.getString("info1"));
			pb.setInfo2(rs.getString("info2"));
			pb.setExdetail(rs.getString("exdetail"));
			pb.setEximage(rs.getString("eximage"));
			pb.setExtitle1(rs.getString("extitle1"));
			pb.setExtitle2(rs.getString("extitle2"));
			pb.setPoint(rs.getString("point"));
			pb.setPicktitle(rs.getString("picktitle"));
			pb.setPicksub(rs.getString("picksub"));
			pb.setTipimage(rs.getString("tipimage"));
			pb.setTiptitle1(rs.getString("tiptitle1"));
			pb.setTipsub1(rs.getString("tipsub1"));
			pb.setTiptitle2(rs.getString("tiptitle2"));
			pb.setTipsub2(rs.getString("tipsub2"));
		}
		closeConnection(conn, pstmt, rs);
		return pb;
	}
}
