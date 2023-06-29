package project.JanJan.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.JanJan.DB;
import project.JanJan.VO.*;

public class MemberDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Member getMemInfo(String id) {
		Member m = new Member();
		String sql = "";
		
	      try {
		         con = DB.con();
		         pstmt = con.prepareStatement(sql);
		         rs = pstmt.executeQuery();
		         while (rs.next()) {
		        	 
		         }
		         rs.close();
		         pstmt.close();
		         con.close();
		      } catch (SQLException e) {
		         System.out.println("DB예외 발생 : " + e.getMessage());
		         DB.rollback(con);
		      } catch (Exception e) {
		         System.out.println("일반 예외 처리 : " + e.getMessage());
		      } finally {
		         DB.close(rs, pstmt, con);
		      }		
		return m;
	}
	
}	
