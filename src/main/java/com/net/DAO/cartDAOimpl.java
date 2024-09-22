package com.net.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.net.Bean.AddBookBean;
import com.net.Bean.Cart;


public class cartDAOimpl implements cartDAO {

	@Override
	public List<Cart> getBookByUser(String uname) {
		List<Cart> list=new ArrayList<Cart>();
		Cart c=null;
		boolean f=false;
		int total_price=0;
		try {
			String sql="select * from cart where uname=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, uname);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUname(rs.getString(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getInt(6));
				
				total_price=total_price+rs.getInt(7);
				c.setTotal_price(total_price);
				
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	private Connection con=null;
	
	public cartDAOimpl(Connection con) {
		this.con=con;
	}
	public boolean addCart(Cart c) {
		boolean f=false;
		try {
			String sql="insert into cart(bid,uname,bookName,author,price,total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setString(2, c.getUname());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setInt(5, c.getPrice());
			ps.setInt(6, c.getTotal_price());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	

}
