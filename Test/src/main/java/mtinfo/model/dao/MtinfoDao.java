package mtinfo.model.dao;

import static common.JDBCTemplate.*;

import java.io.*;
import java.sql.*;
import java.util.*;

import mtinfo.model.vo.Mtinfo;

public class MtinfoDao {
private Properties prop = new Properties();
	
	public MtinfoDao() {
		try {
			prop.loadFromXML(new FileInputStream(MtinfoDao.class.getResource("/db/sql/mtinfo-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public Mtinfo selectList(Connection conn, String mtName) {
		Mtinfo mt = new Mtinfo();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mtName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
					mt = new Mtinfo(rset.getString("mt_name"),
								    rset.getString("mt_address"),
								    rset.getString("mt_phone"),
								    rset.getString("mt_page"),
								    rset.getString("mt_course"),
								    rset.getString("mt_vehicle"),
								    rset.getString("mt_detailinfo"),
								    rset.getString("mt_detailaddress"),
								    rset.getString("mt_wt")
								    
								   );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mt;
	}


	public ArrayList<Mtinfo> selectCountry(Connection conn, String mtc) {
		ArrayList<Mtinfo> country = new ArrayList<Mtinfo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCountry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mtc + "%");
			
			rset = pstmt.executeQuery();
			

			while(rset.next()) {
				country.add(new Mtinfo(rset.getString("mt_name"),
								    rset.getString("mt_detailaddress")
								   ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return country;
	}

}