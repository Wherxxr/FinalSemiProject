package today.model.service;


import java.sql.*;
import java.util.*;

import board.model.dao.BoardDao;
import today.model.dao.TodayDao;
import today.model.vo.Attachment;
import today.model.vo.Reply;
import today.model.vo.Today;
import common.model.vo.PageInfo;
import member.model.dao.MemberDao;
import member.model.vo.Member;

import static common.JDBCTemplate.*;

public class TodayService {

	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new TodayDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Today> selectTodayList() {
		Connection conn = getConnection();
		ArrayList<Today> list = new TodayDao().selectTodayList(conn);
		close(conn);
		return list;
	}

	public int increaseCount(String todayNo) {
		Connection conn = getConnection();
		int result = new TodayDao().increaseCount(conn, todayNo);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public Today selectToday(String todayNo) {
		Connection conn = getConnection();
		Today t = new TodayDao().selectToday(conn, todayNo);
		
		close(conn);
		return t;
	}

	public Attachment selectAttachment(String todayNo) {
		Connection conn = getConnection();
		Attachment at = new TodayDao().selectAttachment(conn, todayNo);
		
		close(conn);
		return at;
	}

	public int insertToday(Today t, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new TodayDao().insertToday(conn, t);
		int result2 = 1;
		
		if(at != null) {
			result2 = new TodayDao().insertAttachment(conn, at);
		}
		
		if(result1 >0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}

	public int updateToday(Today t, Attachment at) {
		Connection conn = getConnection();
		int result1 = new TodayDao().updateToday(conn, t);
		int result2 = 1;
		
		if(at != null) { // 새로운 첨부파일이 있었을 경우
			
			if(at.getFileNo() != 0) { // 기존에 첨부파일이 있었을 경우
				result2 = new TodayDao().updateAttachment(conn, at);

			} else { // 기존첨부파일이 없는 경우 = >Attachment Insert
				result2 = new TodayDao().insertNewAttachment(conn, at);
				
			}
		}
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}

	public static int deleteToday(String todayNo) {
		Connection conn = getConnection();
		
		int result = new TodayDao().deleteToday(conn, todayNo);
		
		if(result > 0) { // 성공
			 commit(conn);
			 
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	

	public ArrayList<Today> searchTodayTiCon(String keyword) {
		Connection conn = getConnection();
		ArrayList<Today> list = new TodayDao().searchTodayTiCon(conn, keyword);
		close(conn);
		return list;
	}
	public ArrayList<Today> searchTodayTi(String keyword) {
		Connection conn = getConnection();
		ArrayList<Today> list = new TodayDao().searchTodayTi(conn, keyword);
		close(conn);
		return list;
	}
	public ArrayList<Today> searchTodayWri(String keyword) {
		Connection conn = getConnection();
		ArrayList<Today> list = new TodayDao().searchTodayWri(conn, keyword);
		close(conn);
		return list;
	}
	public ArrayList<Today> searchTodayRep(String keyword) {
		Connection conn = getConnection();
		ArrayList<Today> list = new TodayDao().searchTodayRep(conn, keyword);
		close(conn);
		return list;
	}

	public int todayBookmark(int userNo, String boardNo) {
		Connection conn = getConnection();
		
		int result = new TodayDao().todayBookmark(conn, userNo,boardNo);
		
		if(result > 0) { 
			 commit(conn);
			 
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<Reply> selectReplyList(String todayNo) {
		Connection conn = getConnection();
		ArrayList<Reply> list = new TodayDao().selectReplyList(conn, todayNo);
		close(conn);
		
		return list;
	}

	public int insertReply(Reply r) {
		Connection conn = getConnection();
		int result = new TodayDao().insertReply(conn,r);
		
		close(conn);		
		return result;
	}

	public ArrayList<Today> sortDate() {
		Connection conn = getConnection();
		ArrayList<Today> list = new TodayDao().sortDate(conn);
		close(conn);
		
		return list;
	}

	public ArrayList<Today> sortLike() {
		Connection conn = getConnection();
		ArrayList<Today> list = new TodayDao().sortLike(conn);
		close(conn);
		
		return list;
	}

	public ArrayList<Today> sortReply() {
		Connection conn = getConnection();
		ArrayList<Today> list = new TodayDao().sortReply(conn);
		close(conn);
		
		return list;
	}

	public ArrayList<Today> sortCount() {
		Connection conn = getConnection();
		ArrayList<Today> list = new TodayDao().sortCount(conn);
		close(conn);
		
		return list;
	}
public int insertLike(int userNo, String todayNo) {
		
		Connection conn = getConnection();
		
		int result = new TodayDao().insertLike(conn, userNo, todayNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int deleteLike(int userNo, String todayNo) {
		
		Connection conn = getConnection();
		
		int result = new TodayDao().deleteLike(conn, userNo, todayNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int checkLike(int userNo, String todayNo) {
		
		Connection conn = getConnection();
		
		int count = new TodayDao().checkLike(conn, userNo, todayNo);
		
		close(conn);
		
		return count;
		
		
	}
		
		public ArrayList<Today> selectTogetherList(){
			
			Connection conn = getConnection();
			
			ArrayList<Today> list = new TodayDao().selectTogetherList(conn);
			
			close(conn);
			
			return list;
		}

		public Today selectTogether(String tno) {
			
			Connection conn = getConnection();
			
			Today t = new TodayDao().selectTogether(conn, tno);
			
			close(conn);
			
			return t;
		}
		
	   public int insertTogether(Today t) {
		      
		      Connection conn = getConnection();
		      
		      int result = new TodayDao().insertTogether(conn, t);
		      int result2 = 0;
		      
		      if(result > 0) {
		         int uno = Integer.parseInt(t.getTodayWriter());
		         result2 = new TodayDao().insertEnrollTogether(conn, uno);         
		      }
		      
		      
		      if(result > 0 && result2 > 0) {
		         commit(conn);
		      }else {
		         rollback(conn);
		      }
		      
		      close(conn);
		      
		      return result;
		      
		   }
		
		public int deleteTogether(String tno) {
			
			Connection conn = getConnection();
			
			int result = new TodayDao().deleteTogether(conn, tno);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		
		}
		
		

		public int deleteReply(int replyNo) {
		
		Connection conn = getConnection();
		
		int result = new TodayDao().deleteReply(conn, replyNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			close(conn);
		}
		
		close(conn);
		
		return result;
		
	}

		public int countReply(String todayNo) {
			Connection conn = getConnection();
			
			int result = new TodayDao().countReply(conn, todayNo);
			
			close(conn);
			
			return result;
		}
		
		public int enrollTogether(int uno, String tno) {
			
			Connection conn = getConnection();
			
			int result1 = new TodayDao().enrollTogether(conn, uno, tno);
			int result2 = 0;
			if(result1 > 0) {
				result2 = new TodayDao().togetherCount(conn, tno);
			}
			
			if(result1 > 0 && result2 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			
			return result1 * result2;
		}
		
		public ArrayList<Integer> togetherMemList(String boardNo){
			
			Connection conn = getConnection();
			
			ArrayList<Integer> list = new TodayDao().togetherMemList(conn, boardNo);
			
			close(conn);
			
			return list;
		}

		public int insertBook(int userNo, String todayNo) {
			
			Connection conn = getConnection();
			
			int result = new TodayDao().insertBook(conn, userNo, todayNo);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}
		
		public int deleteBook(int userNo, String todayNo) {
			Connection conn = getConnection();
			
			int result = new TodayDao().deleteBook(conn, userNo, todayNo);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}
		
		public int checkBook(int userNo, String todayNo) {
			
			Connection conn = getConnection();
			
			int count = new TodayDao().checkBook(conn, userNo, todayNo);
			
			close(conn);
			
			return count;
			
		}

		public ArrayList<Today> selectWeekClimb() {
			Connection conn = getConnection();
			ArrayList<Today> list= new TodayDao().selectWeekClimb(conn);
			
			close(conn);
			return list;
		}
		public int togetherDropOut(int uno, String tno) {

			Connection conn = getConnection();

			int result1 = new TodayDao().togetherDropOut(conn, uno, tno);

			int result2 = 0;
			if(result1 > 0) {
				result2 = new TodayDao().countDecrease(conn, tno);
			}

			if(result1 > 0 && result2 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}

			close(conn);

			return result1 * result2;
		}

		public int updateTogether(Today t) {

			Connection conn = getConnection();

			int result = new TodayDao().updateTogether(conn, t);

			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}

			close(conn);

			return result;
		}
}
