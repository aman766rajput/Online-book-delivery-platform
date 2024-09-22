package com.net.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.net.Bean.bookorder;

public class bookOrderimpl implements bookorderDAO {

	 @Override
	public List<bookorder> getBook(String uname) {
		List<bookorder> list=new ArrayList<bookorder>();
		bookorder o=null;
		
		try {
			String sql="select username,email,address,bookname,author,price,payement,pincode,order_id from bookorder where uname=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, uname);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new bookorder();
				o.setUsername(rs.getString(1));
				o.setEmail(rs.getString(2));
				o.setFulladd(rs.getString(3));
				o.setBname(rs.getString(4));
				o.setAuthor(rs.getString(5));
				o.setPrice(rs.getInt(6));
				o.setPayment(rs.getString(7));
				o.setPincode(rs.getString(8));
				o.setOrderid(rs.getString(9));
				list.add(o);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<bookorder> getBook() {
		List<bookorder> list=new ArrayList<bookorder>();
		bookorder o=null;
		
		try {
			String sql="select username,email,address,bookname,author,price,payement,pincode,order_id,phone from bookorder ";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new bookorder();
				o.setUsername(rs.getString(1));
				o.setEmail(rs.getString(2));
				o.setFulladd(rs.getString(3));
				o.setBname(rs.getString(4));
				o.setAuthor(rs.getString(5));
				o.setPrice(rs.getInt(6));
				o.setPayment(rs.getString(7));
				o.setPincode(rs.getString(8));
				o.setOrderid(rs.getString(9));
				o.setPhno(rs.getString(10));
				list.add(o);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	private Connection con=null;
	 
	public bookOrderimpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean saveOrder(List<bookorder> blist) {
		boolean f=false;
		try {
			String sql="insert into bookorder(username,email,address,bookname,author,price,payement,pincode,order_id,uname,phone) values(?,?,?,?,?,?,?,?,?,?,?)";
		    con.setAutoCommit(f);
		    PreparedStatement ps=con.prepareStatement(sql);
		    
		    for(bookorder b:blist) {
		    	ps.setString(1, b.getUsername());
		    	ps.setString(2, b.getEmail());
		    	ps.setString(3, b.getFulladd());
		    	ps.setString(4, b.getBname());
		    	ps.setString(5, b.getAuthor());
		    	ps.setInt(6, b.getPrice());
		    	ps.setString(7, b.getPayment());
		    	ps.setString(8, b.getPincode());
		    	ps.setString(9, b.getOrderid());
		    	ps.setString(10, b.getUname());
		    	ps.setString(11, b.getPhno());
		    	ps.addBatch();
		    	
		    }
		    
		    int[] count=ps.executeBatch();
		    con.commit();
		    f=true;
		    con.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public int getOrderNo() {
		int i=1;
		try {
			String sql="select * from bookorder";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

}
