package com.net.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.net.Bean.AdminBean;

import com.net.connection.Connect;

public class adminDAO {
	  static Connection con = null;
	  static PreparedStatement ps = null;
	  static int rowCount = 0;
	  static ResultSet rs = null;
	  
	  public static int Login(AdminBean sb) {
		  try {
			  con = Connect.getConnection();
	        String sql = "select * from admin where admin_uname=? and admin_pass=?;";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, sb.getAuname());
			ps.setString(2, sb.getApass());
			
	    	rs = ps.executeQuery();
	    	
	    	if(rs.next())
	    		 rowCount = 1;
	    	else
	    		rowCount = 0;
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
		  return rowCount;
	  }

}
