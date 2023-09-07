package qBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.Member;

import static common.JDBCTemplate.*;

import qBoard.model.vo.Qna;
import qBoard.model.vo.Qreply;
import qBoard.model.vo.Reply;

public class QnaDao {
	
	private Properties prop = new Properties();

	public QnaDao() { 
		try {
			prop.loadFromXML(new FileInputStream(QnaDao.class.getResource("/db/sql/qBoard-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Qna> selectList(Connection conn) {
		ArrayList<Qna> list = new ArrayList<Qna>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("qSelectList"); 
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new Qna(rset.getInt("Q_NO"),
									rset.getString("Q_TITLE"),
									rset.getString("Q_CONTENT"),
									rset.getInt("Q_WRITER"),
									rset.getString("QNA_DATE"),
									rset.getString("STATUS")
									));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertBoard(Connection conn, Qna q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, q.getqTitle());
			pstmt.setString(2, q.getqContent());
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int increaseCount(Connection conn, int qNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qNo);
			
			result =  pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Qna selectqBoard(Connection conn, int qNo) {
		Qna q = null;
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectqBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qNo);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new Qna(rset.getInt("Q_NO"),
							rset.getString("Q_TITLE"),
							rset.getString("Q_CONTENT"),
							rset.getString("QNA_DATE"),
							rset.getInt("COUNT")
							);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return q;
	}

	public int deleteqBoard(Connection conn, int qNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteqBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateqBoard(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateqBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, q.getqTitle());
			pstmt.setString(2, q.getqContent());
			pstmt.setInt(3, q.getqNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Qreply> selectqReplyList(Connection conn, int qNo) {
	ArrayList<Qreply> list = new ArrayList<Qreply>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectqReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Qreply(rset.getInt("QREPLY_NO"),
								   rset.getString("QREPLY_CONTENT"),
								   rset.getString("USER_ID"),
								   rset.getString("CREATE_DATE")
								   ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertReply(Connection conn, Qreply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getqReplyContent());
			pstmt.setInt(2, r.getRefQNo());
			pstmt.setInt(3, r.getqReplyWriter());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
}


