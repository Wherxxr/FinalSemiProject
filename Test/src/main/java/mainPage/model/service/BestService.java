package mainPage.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import mainPage.model.dao.BestDao;
import notice.model.vo.Notice;

public class BestService {
	
	public ArrayList<Board> selectBestList(){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BestDao().selectBestList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Notice> selectRecentNotice(){
		Connection conn = getConnection();
		
		ArrayList<Notice> nlist = new BestDao().selectRecentNotice(conn);
		close(conn);
		return nlist;
	}
	
	public ArrayList<Board> selectTopWriter(){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BestDao().selectTopWriter(conn);
		close(conn);
		return list;
	}
	
}
