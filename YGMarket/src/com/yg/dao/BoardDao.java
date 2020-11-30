package com.yg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yg.dto.BoardBean;


public class BoardDao {
	private static final BoardDao instance = new BoardDao();//instance역할??

	public BoardDao() {
	}

	public static BoardDao getInstance() {
		return instance;
	}

	private Connection getConnection() throws Exception {
		Connection conn = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/database1?characterEncoding=UTF-8"
						+ "&serverTimezone=UTC", "root", "jisun");
		return conn;
	}

	private void closeConnection(Connection conn, PreparedStatement pstmt, ResultSet rs) throws SQLException {
		if(rs !=null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
	}

	//게시판 글 등록 8/27 지선씨
	public int insertBoard(BoardBean bBean) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = getConnection();
		String sql = "INSERT INTO board(title,content,writer,ref,step,level) VALUES(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bBean.getTitle());
		pstmt.setString(2, bBean.getContent());
		pstmt.setString(3, bBean.getWriter());
		pstmt.setInt(4, bBean.getRef());
		pstmt.setInt(5, bBean.getStep());
		pstmt.setInt(6, bBean.getLevel());

		pstmt.executeUpdate();

		sql = "select bno from board order by bno desc limit 1";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		int bno = -1;
				if(rs.next()) {
					bno = rs.getInt(1);
				}
				
		sql = "UPDATE board SET ref=? WHERE bno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);
		pstmt.setInt(2, bno);
		pstmt.executeUpdate();
		
		closeConnection(conn, pstmt, rs);
		return bno;
	}


	public int getMaxPageNum(int pageSize) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = getConnection();
		String sql = "SELECT count(*) FROM board";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		int count = 0;
		if(rs.next()) {
			count = rs.getInt(1);
		}
		
		int numOfPages = count / pageSize + ((count % pageSize > 0) ? 1 : 0);
		// count : 110 --> numOfPages : 11
		// count : 111 --> numOfPages : 12
		
		closeConnection(conn, pstmt, rs);
		return numOfPages;
	}
	
	//게시글 상세 조회 8/26 조회수 hitcount(x)
	public BoardBean selectBoard(int bno) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = getConnection();
		String sql = "select * from board where bno=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);
		
		sql = "UPDATE board set hitcount=hitcount+1 where bno=" + bno;
		pstmt.executeUpdate(sql);
		rs = pstmt.executeQuery();
		
		BoardBean bBean = null;

		if(rs.next()) {
			bBean = new BoardBean();
			bBean.setBno(rs.getInt("bno"));
			bBean.setContent(rs.getString("content"));
			bBean.setHitcount(rs.getInt("hitcount"));
			bBean.setTitle(rs.getString("title"));
			bBean.setWritedate(rs.getString("writedate"));
			bBean.setWriter(rs.getString("writer"));
		}
		closeConnection(conn, pstmt, rs);
		return bBean;
	}



	//전체 게시글 조회 08/26 OK
	public ArrayList<BoardBean> selectList(int pageNum) throws Exception {
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		BoardBean bBean = null;

		int sizeOfPage =10;
		//int pageNum=1;
		String sql ="SELECT * FROM board ORDER BY ref desc, step asc limit " + sizeOfPage + " offset " + (sizeOfPage*(pageNum-1));
System.out.println("selectList:sql="+sql); 
		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while(rs.next()){
			bBean = new BoardBean();
			bBean.setBno(rs.getInt("bno"));
			bBean.setTitle(rs.getString("title"));
			bBean.setWriter(rs.getString("writer"));
			bBean.setWritedate(rs.getString("writedate"));
			bBean.setHitcount(rs.getInt("hitcount"));
			bBean.setRef(rs.getInt("ref"));
			bBean.setLevel(rs.getInt("level"));
			bBean.setStep(rs.getInt("step"));
			list.add(bBean);
		}
		closeConnection(conn,pstmt,rs);
		return list; 
	}
	
	
	//update 글 수정
	public void updateBoard(int bno, String title, String content) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = getConnection();
		String sql = "update board set title=?, content=? where bno=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setInt(3, bno);
		
		pstmt.executeUpdate();
		
		closeConnection(conn, pstmt, null);
	}
	
	
	//글 삭제- writer을 담아서 삭제해야 할 것 같음
	public void deleteBoard(int bno) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = getConnection();
		String sql = "delete from board where bno=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);
		
		pstmt.executeUpdate();
		
		closeConnection(conn, pstmt, null);
	}

	public void updateHitcount(int bno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update board set hitcount=hitcount+1 where bno=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				closeConnection(conn, pstmt, null);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void insertComment(int bno, String commentTitle, String comment,String loginId) throws Exception {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int level = 1;
		int ref = -1;
		int step = -1;
		String sql3 = "select level,ref,step from board where bno=?";
		pstmt = conn.prepareStatement(sql3);
		pstmt.setInt(1, bno);
		rs = pstmt.executeQuery();
		int n = 0;
		if(rs.next()) {
			n = rs.getInt(1);
			ref = rs.getInt(2);
			step = rs.getInt(3);
		}
		if(n==1) {
			level=2;
		}		
			
		String sql = "UPDATE board SET step=step+1 where ref=? and step>"+step;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, ref);
		pstmt.executeUpdate();
		
		String sql2 = "INSERT INTO board(title,content,writer,ref,level,step) VALUES(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1,commentTitle);
		pstmt.setString(2, comment);
		pstmt.setString(3,loginId);
		pstmt.setInt(4, ref);   // bno);
		pstmt.setInt(5, level);
		pstmt.setInt(6, step+1);
		pstmt.executeUpdate();
		
		closeConnection(conn, pstmt, null);
		
	}
}