package member.model.dao;

import java.io.*;
import java.sql.*;
import java.util.*;

import board.model.vo.Board;
import member.model.vo.Attachment;

import static common.JDBCTemplate.*;
import member.model.vo.Member;
import today.model.vo.Today;


public class MemberDao {
	private Properties prop = new Properties();

	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public Member selectMember(Connection conn, String userId) {
		// select문 => 한행 => ResultSet객체 => Memver객체
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("user_no"),
						rset.getString("user_id"),
						rset.getString("user_pwd"),
						rset.getString("user_name"),
						rset.getString("nickname"),
						rset.getString("email"),
						rset.getString("gender"),
						rset.getString("phone"),
						rset.getString("description"),
						rset.getString("PROFILE_IMG"),
						rset.getInt("GRADE_NO"),
						rset.getString("STATUS"),
						rset.getString("COMPLETE_MT"),
						rset.getString("insta_id")
						);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
		
	}
	public int updateProfile(Connection conn, Member m) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProfile");

		try {
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1, m.getNickname());
			pstmt.setString(2, m.getDescription());
			pstmt.setString(3, m.getInstaId());
			pstmt.setString(4, m.getProfileImg());
			pstmt.setInt(5, m.getGradeNo());
			pstmt.setInt(6, m.getUserNo());
		
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int updatePwd(Connection conn, String userId, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userPwd);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	

	public int updateEmail(Connection conn, String userId,  String email) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateEmail");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int updatePhone(Connection conn, String userId, String phone) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePhone");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, phone);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int deleteMember(Connection conn, String userId, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public Member loginMember(Connection conn, String userId, String userPwd){
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("user_no"),
								rset.getString("user_id"),
								rset.getString("user_pwd"),
								rset.getString("user_name"),
								rset.getString("nickname"),
								rset.getString("email"),
								rset.getString("gender"),
								rset.getString("phone"),
								rset.getString("description"),
								rset.getString("profile_img"),
								rset.getInt("grade_no"),
								rset.getString("status"),
								rset.getString("complete_mt"),
								rset.getString("insta_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
			
	public int idCheck(Connection conn, String checkId)	{	
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return count;
		
	}
		
		public int insertMember(Connection conn, Member m) {
			int result = 0;
			
			PreparedStatement pstmt = null;
			String spl = prop.getProperty("insertMember");
			
			try {
				pstmt = conn.prepareStatement(spl);
				
				pstmt.setString(1, m.getUserId());
				pstmt.setString(2, m.getUserPwd());
				pstmt.setString(3, m.getUserName());
				pstmt.setString(4, m.getNickname());
				pstmt.setString(5, m.getEmail());
				pstmt.setString(6, m.getGender());
				pstmt.setString(7, m.getPhone());
				pstmt.setString(8, m.getDescription());
				pstmt.setString(9, m.getProfileImg());
				pstmt.setInt(10, m.getGradeNo());
				pstmt.setString(11, m.getInstaId());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			 return result;
		}
		
		public int nickCheck(Connection conn, String checkNick) {
			int count = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("nickCheck");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, checkNick);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					count = rset.getInt("count");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return count;
		}
		
		public ArrayList<Today> selectMpList(Connection conn, int userNo) {
			ArrayList<Today> list = new ArrayList<Today>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectMpList");
			
			try { 
				pstmt = conn.prepareStatement(sql);
				
				
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, userNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Today(rset.getString("today_no"),
									   rset.getString("today_title"),
									   rset.getString("today_content"),
									   rset.getString("nickname"),
									   rset.getString("create_date"),
									   rset.getString("profile_img"),
									   rset.getString("titleimg"),
									   rset.getInt("COUNT"),
									   rset.getInt("like_count"),
									   rset.getInt("file_level")
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

		public int selectMpListCount(Connection conn, int userNo) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectMpListCount");
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				
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
		public Board selectMpBoard(Connection conn, int userNo) {
			Board b = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectMpBoard");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					b = new Board(
								  rset.getString("board_title"),
								  rset.getString("board_content"),
								  rset.getString("nickname"),
								  rset.getString("create_date"),
								  rset.getInt("count"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return b;
			
		}


		public ArrayList<Today> selectBookmark(Connection conn, int userNo) {
		ArrayList<Today> list = new ArrayList<Today>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBookmark");
		
		try { 
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo);
				
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Today(rset.getString("today_no"),
								   rset.getString("today_title"),
								   rset.getString("today_content"),
								   rset.getString("nickname"),
								   rset.getString("create_date"),
								   rset.getString("profile_img"),
								   rset.getString("titleimg"),
								   rset.getInt("COUNT"),
								   rset.getInt("like_count"),
								   rset.getInt("file_level")
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
					
					t = new Today(rset.getString("today_no"),
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
								  rset.getString("create_date"),
								  rset.getInt("count"),
								  rset.getInt("REPLY_COUNT"));
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return t;
		}

		public Member selectProfile(Connection conn, int userNo2) {
			Member m = new Member();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectProfile");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo2);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
			 m = new Member(rset.getInt("user_no"),
							rset.getString("user_id"),
							rset.getString("user_pwd"),
							rset.getString("user_name"),
							rset.getString("nickname"),
							rset.getString("email"),
							rset.getString("gender"),
							rset.getString("phone"),
							rset.getString("description"),
							rset.getString("PROFILE_IMG"),
							rset.getInt("GRADE_NO"),
							rset.getString("STATUS"),
							rset.getString("COMPLETE_MT"),
							rset.getString("insta_id"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return m;		
			}
	
		
		public ArrayList<Attachment> selectProfileImg(Connection conn, String userNo) {
			ArrayList<Attachment> list = new ArrayList<Attachment>();
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectProfileImg");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Attachment(rset.getInt("file_no"),
											rset.getString("origin_name"),
											rset.getString("change_name"),
											rset.getString("file_path")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		}


		public int updateCompleteMt(Connection conn, String mtlist, String userId) {
			int result = 0;
			
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateCompleteMt");

			try {
				pstmt = conn.prepareStatement(sql); // 미완성된 쿼리
				
				pstmt.setString(1, mtlist);
				pstmt.setString(2, userId);			
				result = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}


		public int updatePostImg(Connection conn, ArrayList<Attachment> list) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("updatePostImg");
			
			try {
				
				for(Attachment at : list) {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, at.getOriginName());
					pstmt.setString(2, at.getChangeName());
					pstmt.setString(3, at.getFilePath());
					pstmt.setInt(4, at.getFileNo());

					result += pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			
			return result;
		}

		public int getImageCount(Connection conn, String userNo) {
	        int imageCount = 0;
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;

	        String sql = prop.getProperty("getImageCount");

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userNo);

	            rset = pstmt.executeQuery();

	            if (rset.next()) {
	                imageCount = rset.getInt("COUNT");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return imageCount;
	    }


		public int insertPostImg(Connection conn, ArrayList<Attachment> list) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("insertPostImg");
			
			try {
				
				for(Attachment at : list) {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, at.getRefNo());
					pstmt.setString(2, at.getOriginName());
					pstmt.setString(3, at.getChangeName());
					pstmt.setString(4, at.getFilePath());

					result = pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			
			return result;
		}
		public String findId(Connection conn, String email) {
			String id = "";
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("findId");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, email);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					id = rset.getString("user_id");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return id;
		}

		public String findPwd(Connection conn, String email) {
			String pwd = "";
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("findPwd");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, email);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					pwd = rset.getString("user_pwd");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return pwd;
			
		}
		public Member selectProImg(Connection conn, int userNo) {
		    Member m = null;
		    PreparedStatement pstmt = null;
		    ResultSet rset = null;

		    String sql = prop.getProperty("selectProImg");

		    try {
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, userNo);
		        rset = pstmt.executeQuery();

		        if (rset.next()) {
		            m = new Member();
		            m.setProfileImg(rset.getString("PROFILE_IMG"));
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        close(rset);
		        close(pstmt);
		    }

		    return m;
		}


		public ArrayList<Member> selectTopUser(Connection conn) {
			ArrayList<Member> list = new ArrayList<Member>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectTopUser");
			
			try { 
				pstmt = conn.prepareStatement(sql);
				
					
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Member(rset.getString("NICKNAME"),
										rset.getString("PROFILE_IMG")
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


	
}
