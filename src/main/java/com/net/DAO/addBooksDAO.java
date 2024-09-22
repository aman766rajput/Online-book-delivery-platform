package com.net.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.net.Bean.AddBookBean;

public class addBooksDAO implements bookDAO {

	@Override
	public List<AddBookBean> getAlloldBook() {
		List<AddBookBean> list = new ArrayList<AddBookBean>();
		AddBookBean b = null;
		try {
			String sql = "select * from books where book_categories=? and book_status=? order by book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new AddBookBean();
				b.setBid(rs.getInt(1));
				b.setBname(rs.getString(2));
				b.setAuname(rs.getString(3));
				b.setBprice(rs.getString(4));
				b.setBcategories(rs.getString(5));
				b.setBstatus(rs.getString(6));
				b.setBphoto(rs.getString(7));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<AddBookBean> getAllRecentBook() {
		List<AddBookBean> list = new ArrayList<AddBookBean>();
		AddBookBean b = null;
		try {
			String sql = "select * from books where  book_status=? order by book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new AddBookBean();
				b.setBid(rs.getInt(1));
				b.setBname(rs.getString(2));
				b.setAuname(rs.getString(3));
				b.setBprice(rs.getString(4));
				b.setBcategories(rs.getString(5));
				b.setBstatus(rs.getString(6));
				b.setBphoto(rs.getString(7));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<AddBookBean> getAllNewBook() {
		List<AddBookBean> list = new ArrayList<AddBookBean>();
		AddBookBean b = null;
		try {
			String sql = "select * from books where book_categories=? and book_status=? order by book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new AddBookBean();
				b.setBid(rs.getInt(1));
				b.setBname(rs.getString(2));
				b.setAuname(rs.getString(3));
				b.setBprice(rs.getString(4));
				b.setBcategories(rs.getString(5));
				b.setBstatus(rs.getString(6));
				b.setBphoto(rs.getString(7));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<AddBookBean> getNewBook() {
		List<AddBookBean> list = new ArrayList<AddBookBean>();
		AddBookBean b = null;
		try {
			String sql = "select * from books where book_categories=? and book_status=? order by book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 3) {
				b = new AddBookBean();
				b.setBid(rs.getInt(1));
				b.setBname(rs.getString(2));
				b.setAuname(rs.getString(3));
				b.setBprice(rs.getString(4));
				b.setBcategories(rs.getString(5));
				b.setBstatus(rs.getString(6));
				b.setBphoto(rs.getString(7));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<AddBookBean> getRecBook() {
		List<AddBookBean> list = new ArrayList<AddBookBean>();
		AddBookBean b = null;
		try {
			String sql = "select * from books where  book_status=? order by book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 3) {
				b = new AddBookBean();
				b.setBid(rs.getInt(1));
				b.setBname(rs.getString(2));
				b.setAuname(rs.getString(3));
				b.setBprice(rs.getString(4));
				b.setBcategories(rs.getString(5));
				b.setBstatus(rs.getString(6));
				b.setBphoto(rs.getString(7));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<AddBookBean> getOldBook() {
		List<AddBookBean> list = new ArrayList<AddBookBean>();
		AddBookBean b = null;
		try {
			String sql = "select * from books where book_categories=? and book_status=? order by book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 3) {
				b = new AddBookBean();
				b.setBid(rs.getInt(1));
				b.setBname(rs.getString(2));
				b.setAuname(rs.getString(3));
				b.setBprice(rs.getString(4));
				b.setBcategories(rs.getString(5));
				b.setBstatus(rs.getString(6));
				b.setBphoto(rs.getString(7));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	private Connection conn;

	public addBooksDAO(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean deleteBook(int id) {
		boolean f = false;
		try {
			String sql = "delete from books where book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteCart(int id) {
		boolean f = false;
		try {
			String sql = "delete from cart where cid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public AddBookBean getBookID(int id) {
		AddBookBean b = null;
		try {
			String sql = "SELECT * FROM books WHERE book_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				b = new AddBookBean();
				b.setBid(rs.getInt(1));
				b.setBname(rs.getString(2));
				b.setAuname(rs.getString(3));
				b.setBprice(rs.getString(4));
				b.setBcategories(rs.getString(5));
				b.setBstatus(rs.getString(6));
				b.setBphoto(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public List<AddBookBean> getAllbook() {
		List<AddBookBean> list = new ArrayList<AddBookBean>();
		try {
			String sql = "SELECT * FROM books";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AddBookBean b = new AddBookBean();
				b.setBid(rs.getInt(1));
				b.setBname(rs.getString(2));
				b.setAuname(rs.getString(3));
				b.setBprice(rs.getString(4));
				b.setBcategories(rs.getString(5));
				b.setBstatus(rs.getString(6));
				b.setBphoto(rs.getString(7));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean addBook(AddBookBean b) {
		boolean f = false;
		try {
			String sql = "INSERT INTO books(book_name, author_name, price, book_categories, book_status, book_photo) VALUES(?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBname());
			ps.setString(2, b.getAuname());
			ps.setString(3, b.getBprice());
			ps.setString(4, b.getBcategories());
			ps.setString(5, b.getBstatus());
			ps.setString(6, b.getBphoto());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean updateEditbook(AddBookBean b) {
		boolean f = false;
		try {

			String sql = "update books set book_name=?,author_name=?,price=?,book_status=? where book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBname());
			ps.setString(2, b.getAuname());
			ps.setString(3, b.getBprice());
			ps.setString(4, b.getBstatus());
			ps.setInt(5, b.getBid());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
