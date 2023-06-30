package project.JanJan.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.JanJan.DB;
import project.JanJan.VO.Admin;
import project.JanJan.VO.Alcohol;

public class AdminDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public List<Admin> getAdminList (String title, int refno){
		List<Admin> alist = new ArrayList<Admin>();
		String sql = "SELECT * \r\n"
				+ "FROM PRD_CODE\r\n"
				+ "WHERE TITLE LIKE ?\r\n"
				+ "START WITH REFNO = ?\r\n"
				+ "CONNECT BY PRIOR PRDNO=REFNO";
		
		try {
	         con = DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1,'%'+title+"%");
	         pstmt.setInt(2, refno);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	        	 alist.add(new Admin(
	        			 rs.getInt(1),
	        			 rs.getString(2),
	        			 rs.getString(3),
	        			 rs.getInt(4),
	        			 rs.getInt(5)
	        	));
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
		
		
		return alist;
	}
	
	public void insertSnack (Admin adm) {
		String sql = "INSERT INTO PRD_CODE VALUES (snack_seq.nextval,?,?,?,?)";
		
		try {
	        con = DB.con();
	        con.setAutoCommit(false);
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, adm.getTitle());
	        pstmt.setString(2, adm.getVal());
	        pstmt.setInt(3, adm.getRefno());
	        pstmt.setInt(4, adm.getOrdno());
	        int result = pstmt.executeUpdate();
	        if (result == 1) {
	            con.commit();
	            System.out.println("등록 성공");
	        }
	    } catch (SQLException e) {
	        System.out.println("DB 오류: " + e.getMessage());
	        DB.rollback(con);
	    } catch (Exception e) {
	        System.out.println("일반 오류: " + e.getMessage());
	    } finally {
	        DB.close(rs, pstmt, con);
	    }	
	}

	public void insertAlcohol (Admin adm) {
		String sql = "INSERT INTO PRD_CODE VALUES (alcohol_seq.nextval,?,?,?,?)";
		
		try {
	        con = DB.con();
	        con.setAutoCommit(false);
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, adm.getTitle());
	        pstmt.setString(2, adm.getVal());
	        pstmt.setInt(3, adm.getRefno());
	        pstmt.setInt(4, adm.getOrdno());
	        int result = pstmt.executeUpdate();
	        if (result == 1) {
	            con.commit();
	            System.out.println("등록 성공");
	        }
	    } catch (SQLException e) {
	        System.out.println("DB 오류: " + e.getMessage());
	        DB.rollback(con);
	    } catch (Exception e) {
	        System.out.println("일반 오류: " + e.getMessage());
	    } finally {
	        DB.close(rs, pstmt, con);
	    }	
	}
	
}
