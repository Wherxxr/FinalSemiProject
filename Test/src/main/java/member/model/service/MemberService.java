package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;
import java.util.ArrayList;

import board.model.vo.Board;
import member.model.vo.Attachment;
import member.model.dao.MemberDao;
import member.model.vo.Member;
import today.model.vo.Today;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		return m;
		}
		
		public int idCheck(String checkId) {
			Connection conn = getConnection();
			
			int count = new MemberDao().idCheck(conn, checkId);
			
			close(conn);
			
			return count;
		}
		
		public int nickCheck(String checkNick) {
			Connection conn = getConnection();
			
			int count = new MemberDao().nickCheck(conn, checkNick);
			
			close(conn);
			
			return count;
		}
		
		public int insertMember(Member m) {
			Connection conn = getConnection();
			
			int result = new MemberDao().insertMember(conn, m);
			
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result;
		}
		
		public String findId(String email) {
			Connection conn = getConnection();
			
			String id = new MemberDao().findId(conn, email);
			
			close(conn);
			
			return id;
			
		}
		
		public String findPwd(String email) {
			Connection conn = getConnection();
			
			String pwd = new MemberDao().findPwd(conn, email);
			
			close(conn);
			
			return pwd;
		}
		
	public Member updateProfile(Member m, String userId) {
		Connection conn = getConnection();

		int result = new MemberDao().updateProfile(conn, m);
		
		Member updateMem = null;
		
		if (result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, userId);
		} else {
			rollback(conn);
		}
		close(conn);

		return updateMem;
	}

	public Member updatePwd(String userId, String userPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePwd(conn, userId, userPwd);

		Member updateMem = null;

		if (result > 0) { // 성공
			commit(conn);

			// 갱신된 회원 객체 다시 조회 해오기
			updateMem = new MemberDao().selectMember(conn, userId);

		} else {
			rollback(conn);
		}
		close(conn);

		return updateMem;
	}

	public Member updateEmail(String userId, String email) {
		Connection conn = getConnection();
		int result = new MemberDao().updateEmail(conn, userId, email);

		Member updateMem = null;

		if (result > 0) { // 성공
			commit(conn);

			// 갱신된 회원 객체 다시 조회 해오기
			updateMem = new MemberDao().selectMember(conn, userId);

		} else {
			rollback(conn);
		}
		close(conn);

		return updateMem;
	}

	public Member updatePhone(String userId, String phone) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePhone(conn, userId, phone);

		Member updateMem = null;

		if (result > 0) { // 성공
			commit(conn);

			// 갱신된 회원 객체 다시 조회 해오기
			updateMem = new MemberDao().selectMember(conn, userId);

		} else {
			rollback(conn);
		}
		close(conn);

		return updateMem;
	}
	

	public int deleteMember(String userId, String userPwd) {
		Connection conn = getConnection();

		int result = new MemberDao().deleteMember(conn, userId, userPwd);

		if (result > 0) { // 성공
			commit(conn);

		} else {
			rollback(conn);
		}
		close(conn);

		return result;

	}

	public Board selectMpBoard(int userNo) {
		Connection conn = getConnection();
		
		Board b = new MemberDao().selectMpBoard(conn, userNo);
		
		close(conn);
		
		return b;
	}

	public ArrayList<Today> selectMpList(int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Today> list = new MemberDao().selectMpList(conn, userNo);
		
		close(conn);
		
		return list;
	}

	public int selectMpListCount(int userNo) {
		Connection conn = getConnection();
		
		int result = new MemberDao().selectMpListCount(conn, userNo);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Today> selectBookmark(int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Today> list = new MemberDao().selectBookmark(conn, userNo);
		
		close(conn);
		
		return list;
	}

	public Member selectProfile(int userNo) {
		Connection conn = getConnection();
		Member m = new MemberDao().selectProfile(conn, userNo);
		
		close(conn);
		return m;
	}

	public ArrayList<Attachment> selectProfileImg(String userNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> list= new MemberDao().selectProfileImg(conn, userNo);
		
		close(conn);
		return list;
	}
	
	public Member updateCompleteMt(String mtlist, String userId) {
		Connection conn = getConnection();

		int result = new MemberDao().updateCompleteMt(conn, mtlist, userId);
		
		Member updateMem = null;
		if (result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, userId);
		} else {
			rollback(conn);
		}
		close(conn);

		return updateMem;
	}



	public int updatePostImg(ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePostImg(conn, list);
		
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int getImageCount(String userNo) {
		Connection conn = getConnection();
		
		int result = new MemberDao().getImageCount(conn, userNo);
		
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int insertPostImg(ArrayList<Attachment> list) {
		Connection conn = getConnection();
		

		
		int result = new MemberDao().insertPostImg(conn,list);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Member selectProImg(int userNo) {
	    Connection conn = getConnection();
	    Member m = new MemberDao().selectProImg(conn, userNo);
	    close(conn);
	    return m;
	}

	public ArrayList<Member> selectTopUser() {
		Connection conn = getConnection();
		ArrayList<Member> list= new MemberDao().selectTopUser(conn);
		
		close(conn);
		return list;
	}
	

	

}
