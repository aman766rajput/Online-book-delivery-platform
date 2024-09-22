package com.net.servlet;

import java.io.File;
import java.io.IOException;

import com.net.Bean.AddBookBean;
import com.net.DAO.addBooksDAO;
import com.net.connection.Connect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/addBooks")
@MultipartConfig
public class BookAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookname = req.getParameter("bname");

			String author = req.getParameter("auname");
			String price = req.getParameter("bprice");
			String category = req.getParameter("bcategories");
			String status = req.getParameter("bstatus");
			Part part = req.getPart("bphoto");
			String filename = part.getSubmittedFileName();

			AddBookBean b = new AddBookBean(bookname, author, price, category, status, filename);
			addBooksDAO dao = new addBooksDAO(Connect.getConnection());

			boolean f = dao.addBook(b);

			HttpSession session = req.getSession();
			if (f) {
				String path = getServletContext().getRealPath("") + "book";
				File fle = new File(path);
				part.write(path + File.separator + filename);
				session.setAttribute("status", "Success");

			} else {
				session.setAttribute("status", "Failed");

			}
			resp.sendRedirect("admin/addBook.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
