package qBoard.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import qBoard.model.dao.QnaDao;
import qBoard.model.vo.Qna;
import qBoard.model.vo.Qreply;
import qBoard.model.vo.Reply;

public class QnaService {

	public ArrayList<Qna> selectList() {
		Connection conn = getConnection();
		ArrayList<Qna> list = new QnaDao().selectList(conn);
		
		close(conn);
		return list;
	}

	public int insertBoard(Qna q) {
		Connection conn = getConnection();
		
		int result = new QnaDao().insertBoard(conn, q);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public int increaseCount(int qNo) {
		Connection conn = getConnection();
		
		int result = new QnaDao().increaseCount(conn, qNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public Qna selectqBoard(int qNo) {
		Connection conn = getConnection();
		
		Qna q = new QnaDao().selectqBoard(conn, qNo);
		close(conn);
		return q;
	}

	public int updateqBoard(Qna q) {
		Connection conn = getConnection();
		
		int result = new QnaDao().updateqBoard(conn, q);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteqBoard(int qNo) {
		Connection conn = getConnection();
		
		int result = new QnaDao().deleteqBoard(conn, qNo);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Qreply> selectqReplyList(int qNo) {
		Connection conn = getConnection();
		
		ArrayList<Qreply> list = new QnaDao().selectqReplyList(conn, qNo);
		
		close(conn);
		return list;
	}
	
	public int insertReply(Qreply r) {
		Connection conn = getConnection();
		
		int result = new QnaDao().insertReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}



	
	
}
