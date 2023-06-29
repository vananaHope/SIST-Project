package project.JanJan.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.JanJan.VO.Alcohol;
import project.JanJan.DB;

public class ItemDao {
   private Connection con;
   private PreparedStatement pstmt;
   private ResultSet rs;

   public List<Alcohol> alList(String alcohol_Name){
	     List<Alcohol> allist = new ArrayList<Alcohol>();
	      String sql = "SELECT * FROM ALCOHOL\r\n"
	            + "WHERE ALCOHOL_NAME = ?";
	      
	         try {
	               con = DB.con();
	               pstmt = con.prepareStatement(sql);
	               pstmt.setString(1, alcohol_Name);
	               rs = pstmt.executeQuery();
	               while (rs.next()) {
	                  allist.add(new Alcohol(
	                        rs.getString("alcohol_name"),
	                        rs.getString("type_name"),
	                        rs.getInt("alcohol_Deg"),
	                        rs.getInt("alcohol_price"),
	                        rs.getInt("alcohol_vol"),
	                        rs.getString("expdate"),
	                        rs.getString("storage_way"),
	                        rs.getString("alcohol_img"),
	                        rs.getString("alcohol_des"),
	                        rs.getString("sale_yn")
	                        
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
	      return allist;
	   }
   
   
}   