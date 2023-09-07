package mainPage.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Board;
import notice.model.vo.Notice;

public class BestDao {
	
	private Properties prop = new Properties();
	private Properties prop1 = new Properties();
	
	public BestDao() {
		try {
			prop.loadFromXML(new FileInputStream(BestDao.class.getResource("/db/sql/board-mapper.xml").getPath()));
			prop1.loadFromXML(new FileInputStream(BestDao.class.getResource("/db/sql/notice-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Board> selectBestList(Connection conn){
		
		ArrayList<Board> list = new ArrayList<Board>(); // []
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_no"),
									rset.getString("board_title"),
									rset.getInt("count")
									));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	return list;
	}
	
	public ArrayList<Notice> selectRecentNotice(Connection conn){
		
		ArrayList<Notice> nlist = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop1.getProperty("selectRecentNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				nlist.add(new Notice(rset.getString("notice_no"),
									rset.getString("notice_title"),
									rset.getDate("create_date")
									));
			}
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return nlist;
	}
	
	public ArrayList<Board> selectTopWriter(Connection conn){
		
		ArrayList<Board> list = new ArrayList<Board>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectTopWriter");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("count"),
									rset.getString("user_id")
								   
									));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		}
		
	}
	


