package today.model.dao;

import static common.JDBCTemplate.*;

import java.io.*;
import java.sql.*;
import java.util.*;


import today.model.vo.Attachment;
import today.model.vo.Reply;
import today.model.vo.Today;

public class TodayDao {
	
private Properties prop = new Properties();
	
	public TodayDao() {
		try {
			prop.loadFromXML(new FileInputStream(TodayDao.class.getResource("/db/sql/today-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) {
		// select문 => ResultSet (한개) => int
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Today> selectTodayList(Connection conn) {
		
		
		ArrayList<Today> list = new ArrayList<Today>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTodayList");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Today(rset.getString("today_no"),
								   rset.getString("today_title"),
								   rset.getString("today_content"),
								   rset.getInt("count"),
								   rset.getString("titleimg"),
								   rset.getInt("LIKE_COUNT")
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

	public int increaseCount(Connection conn, String todayNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("toincreaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, todayNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Today selectToday(Connection conn, String todayNo) {
		Today t = new Today();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectToday");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, todayNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				t = new Today(rset.getInt("user_no"),
							  rset.getString("today_no"),
							  rset.getString("today_title"),
							  rset.getString("today_content"),
							  rset.getString("NICKNAME"),
							  rset.getString("today_tip"),
							  rset.getString("hashtag"),
							  rset.getString("today_name"),
							  rset.getString("today_date"),
							  rset.getString("today_time"),
							  rset.getString("today_course"),
							  rset.getString("lev"),
							  rset.getString("today_vehicle"),
							  rset.getInt("count"),
							  rset.getString("create_date"),
							  rset.getInt("reply_count"),
							  rset.getInt("LIKE_COUNT"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return t;
	}

	public Attachment selectAttachment(Connection conn, String todayNo) {
		Attachment at = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, todayNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}

	public int insertToday(Connection conn, Today t) {
		// insert문 => 처리된 행수 => 트랜젝션 처리
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertToday");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, t.getTodayTitle());
			pstmt.setString(2, t.getTodayContent());
			pstmt.setString(3, t.getTodayTip());
			pstmt.setString(4, t.getHashtag());
			pstmt.setString(5, t.getTodayName());
			pstmt.setString(6, t.getTodayDate());
			pstmt.setString(7, t.getTodayTime());
			pstmt.setString(8, t.getTodayCourse());
			pstmt.setString(9, t.getLev());
			pstmt.setString(10, t.getTodayVehicle());
			pstmt.setInt(11, Integer.parseInt(t.getTodayWriter()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateToday(Connection conn, Today t) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateToday");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, t.getTodayTitle());
			pstmt.setString(2, t.getTodayContent());
			pstmt.setString(3, t.getTodayTip());
			pstmt.setString(4, t.getHashtag());
			pstmt.setString(5, t.getTodayName());
			pstmt.setString(6, t.getTodayDate());
			pstmt.setString(7, t.getTodayTime());
			pstmt.setString(8, t.getTodayCourse());
			pstmt.setString(9, t.getLev());
			pstmt.setString(10, t.getTodayVehicle());
			pstmt.setString(11, t.getTodayNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		return result;
	}

	public int updateAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int insertNewAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getRefNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int deleteToday(Connection conn, String todayNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteToday");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, todayNo);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Today> searchTodayTiCon(Connection conn, String keyword) {
		ArrayList<Today> list = new ArrayList<Today>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchTodayTiCon");
	
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Today(rset.getString("today_no"),
								   rset.getString("today_title"),
								   rset.getString("today_content"),
								   rset.getInt("count"),
								   rset.getString("titleimg"),
								   rset.getInt("LIKE_COUNT")
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
	public ArrayList<Today> searchTodayTi(Connection conn, String keyword) {
		ArrayList<Today> list = new ArrayList<Today>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchTodayTi");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+keyword+"%");
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Today(rset.getString("today_no"),
						rset.getString("today_title"),
						rset.getString("today_content"),
						rset.getInt("count"),
						rset.getString("titleimg"),
						   rset.getInt("LIKE_COUNT")
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
	public ArrayList<Today> searchTodayWri(Connection conn, String keyword) {
		ArrayList<Today> list = new ArrayList<Today>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchTodayWri");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+keyword+"%");
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Today(rset.getString("today_no"),
						rset.getString("today_title"),
						rset.getString("today_content"),
						rset.getInt("count"),
						rset.getString("titleimg"),
						   rset.getInt("LIKE_COUNT")
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
	public ArrayList<Today> searchTodayRep(Connection conn, String keyword) {
		ArrayList<Today> list = new ArrayList<Today>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchTodayRep");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+keyword+"%");
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Today(rset.getString("today_no"),
						rset.getString("today_title"),
						rset.getString("today_content"),
						rset.getInt("count"),
						rset.getString("titleimg"),
						   rset.getInt("LIKE_COUNT")
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

	public int todayBookmark(Connection conn, int userNo, String boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBookmark");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, boardNo);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Reply> selectReplyList(Connection conn, String todayNo) {
		ArrayList<Reply> list = new ArrayList<Reply>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String spl = prop.getProperty("selectReplyList");
		try {
			pstmt=conn.prepareStatement(spl);
			
			pstmt.setString(1, todayNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Reply(rset.getInt("reply_no"),
									rset.getString("reply_content"),
									rset.getString("create_date"),
									rset.getString("NICKNAME"),
									rset.getInt("user_no")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getReplyContent());
			pstmt.setString(2, r.getRefBoardNo());
			pstmt.setString(3, r.getReplyWriter());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Today> sortDate(Connection conn) {
		ArrayList<Today> list = new ArrayList<Today>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("sortDate");
		
		
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Today(rset.getString("today_no"),
						rset.getString("today_title"),
						rset.getString("today_content"),
						rset.getInt("count"),
						rset.getString("titleimg"),
						   rset.getInt("LIKE_COUNT")
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

	public ArrayList<Today> sortLike(Connection conn) {
		ArrayList<Today> list = new ArrayList<Today>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("sortLike");
		
		
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Today(rset.getString("today_no"),
						rset.getString("today_title"),
						rset.getString("today_content"),
						rset.getInt("count"),
						rset.getString("titleimg"),
						   rset.getInt("LIKE_COUNT")
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

	public ArrayList<Today> sortReply(Connection conn) {
		ArrayList<Today> list = new ArrayList<Today>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("sortReply");
		
		
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Today(rset.getString("today_no"),
						rset.getString("today_title"),
						rset.getString("today_content"),
						rset.getInt("count"),
						rset.getString("titleimg"),
						   rset.getInt("LIKE_COUNT")
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

	public ArrayList<Today> sortCount(Connection conn) {
		ArrayList<Today> list = new ArrayList<Today>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("sortCount");
		
		
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Today(rset.getString("today_no"),
						rset.getString("today_title"),
						rset.getString("today_content"),
						rset.getInt("count"),
						rset.getString("titleimg"),
						   rset.getInt("LIKE_COUNT")
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
	
public int insertLike(Connection conn, int userNo, String todayNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, todayNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteLike(Connection conn, int userNo, String todayNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, todayNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public int checkLike(Connection conn, int userNo, String todayNo) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, todayNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
		
	}
	
public ArrayList<Today> selectTogetherList(Connection conn){
		
		ArrayList<Today> list = new ArrayList<Today>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Today(rset.getString("today_no"),
								   rset.getString("today_title"),
								   rset.getString("today_name"),
								   rset.getString("today_time"),
								   rset.getString("nickname"),
								   rset.getInt("mem_count"),
								   rset.getString("lev"),
								   rset.getString("today_date")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	

	public Today selectTogether(Connection conn, String tno) {
		
		Today t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTogether");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, tno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				t = new Today(rset.getString("today_no"),
						      rset.getString("today_title"), 
						      rset.getString("today_content"), 
						      rset.getString("today_name"), 
						      rset.getString("today_date"), 
						      rset.getString("today_time"), 
						      rset.getString("today_course"),
						      rset.getString("lev"), 
						      rset.getString("today_vehicle"), 
						      rset.getString("nickname"), 
						      rset.getString("create_date"), 
						      rset.getInt("mem_count"), 
						      rset.getInt("reply_count"),
						      rset.getInt("user_no"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return t;
	}
	
	public int insertTogether(Connection conn, Today t) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTogether");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, t.getTodayTitle());
			pstmt.setString(2, t.getTodayContent());
			pstmt.setString(3, t.getTodayName());
			pstmt.setString(4, t.getTodayDate());
			pstmt.setString(5, t.getTodayTime());
			pstmt.setString(6, t.getTodayCourse());
			pstmt.setString(7, t.getTodayVehicle());
			pstmt.setInt(8, Integer.parseInt(t.getTodayWriter()));
			pstmt.setString(9, t.getLev());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public int deleteTogether(Connection conn, String tno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteTogether");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int enrollTogether(Connection conn, int uno, String tno){
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("enrollTogether");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			pstmt.setInt(2, uno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int togetherCount(Connection conn, String tno) {
		
		int result = 0;
		PreparedStatement pstmt= null;
		String sql = prop.getProperty("togetherCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteReply(Connection conn, int replyNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int countReply(Connection conn, String todayNo) {
		int result = -1;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, todayNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Integer> togetherMemList(Connection conn, String boardNo){
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("togetherMemList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(rset.getInt("mem_no"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int insertEnrollTogether(Connection conn, int uno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEnrollTogether");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, uno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
public int insertBook(Connection conn, int userNo, String todayNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, todayNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}
	
	
	public int deleteBook(Connection conn, int userNo, String todayNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, todayNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int checkBook(Connection conn, int userNo, String todayNo) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, todayNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}

	public ArrayList<Today> selectWeekClimb(Connection conn) {
		ArrayList<Today> list = new ArrayList<Today>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWeekClimb");
		
		try { 
			pstmt = conn.prepareStatement(sql);
			
				
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Today(rset.getString("today_no"),
						rset.getString("weekclimb")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public int togetherDropOut(Connection conn, int uno, String tno) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("togetherDropOut");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			pstmt.setString(2, tno);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int countDecrease(Connection conn, String tno) {

		int result = 0;
		PreparedStatement pstmt= null;
		String sql = prop.getProperty("countDecrease");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	public int updateTogether(Connection conn, Today t) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateTogether");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTodayTitle());
			pstmt.setString(2, t.getTodayContent());
			pstmt.setString(3, t.getTodayName());
			pstmt.setString(4, t.getTodayDate());
			pstmt.setString(5, t.getTodayTime());
			pstmt.setString(6, t.getTodayCourse());
			pstmt.setString(7, t.getLev());
			pstmt.setString(8, t.getTodayVehicle());
			pstmt.setString(9, t.getTodayNo());

			result = pstmt.executeUpdate();


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
}

