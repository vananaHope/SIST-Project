package project.JanJan.DAO;
//project.janjan.DAO.*
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.JanJan.VO.*;
import project.JanJan.DB;

public class MemberDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Member getMemInfo(String id) {
		Member m = new Member();
		String sql = "SELECT *FROM MEMBER_info";
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
	// 잔잔 회원가입 메서드
	public void join(Member ins) {
		String sql="INSERT INTO MEMBER_INFO values(?,?,?,?,?,?)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getId());
			pstmt.setString(2, ins.getPwd());
			pstmt.setString(3, ins.getName());
			pstmt.setString(4, ins.getAddress());
			pstmt.setString(5, ins.getContact());
			pstmt.setString(6, ins.getEmail());
			int isInsert = pstmt.executeUpdate();
			if(isInsert == 1) {
				con.commit();
				System.out.println("등록성공");
			}
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("sql예외:"+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("롤백예외:"+e1.getMessage());
			}
		} catch (Exception e) {
			System.out.println("일반예외:"+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
	// 잔잔 로그인 메서드
	public Member login(String id, String pwd) {
		Member mem = null;
		String sql = "SELECT MEMID,PASSWORD\r\n"
				+ "FROM MEMBER_info\r\n"
				+ "WHERE MEMID=? AND PASSWORD=?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mem = new Member(
					rs.getString("MEMID"),
					rs.getString("PASSWORD")
				);
			}
		} catch (SQLException e) {
			System.out.println("sql예외:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반예외:"+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return mem;
	}
	// 아이디 중복확인 Dao 메서드
	public Member checkId(String id) {
		Member mem = null;
		String sql = "SELECT MEMID\r\n"
				+ "FROM MEMBER_info\r\n"
				+ "WHERE MEMID=?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mem = new Member(
					rs.getString("MEMID")
				);
			}
		} catch (SQLException e) {
			System.out.println("sql예외:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반예외:"+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return mem;
	}
	// 잔잔 로그인 메서드
	public Member schId(String id, String pwd) {
		Member mem = null;
		String sql = "SELECT MEMID,PASSWORD\r\n"
				+ "FROM MEMBER_info\r\n"
				+ "WHERE MEMID=? AND PASSWORD=?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mem = new Member(
					rs.getString("MEMID"),
					rs.getString("PASSWORD")
				);
			}
		} catch (SQLException e) {
			System.out.println("sql예외:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반예외:"+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return mem;
	}
	public static void main(String[] args) {
		// login test
		MemberDao dao = new MemberDao();
//		System.out.println(dao.login("man01", "1111"));
		// join test
		dao.join(new Member("man0101","aaaa1111","홍길동","서울시 강남역","010-0000-0000","aa@aa.aa"));
	}
}	
