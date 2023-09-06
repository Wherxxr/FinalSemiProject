package mtinfo.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import mtinfo.model.dao.MtinfoDao;
import mtinfo.model.vo.Mtinfo;
import static common.JDBCTemplate.*;

public class MtinfoService {

	public Mtinfo selectList(String mtName) {
			Connection conn = getConnection();
					
			Mtinfo mt = new MtinfoDao().selectList(conn, mtName);
			close(conn);
			
			return mt;
		}

	public ArrayList<Mtinfo> selectCountry(String mtc) {
		Connection conn = getConnection();
		
		ArrayList<Mtinfo> country = new MtinfoDao().selectCountry(conn, mtc);

		close(conn);
		
		return country;
	}
	

}
