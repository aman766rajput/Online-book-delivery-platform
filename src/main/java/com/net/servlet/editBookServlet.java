package com.net.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.net.Bean.AddBookBean;
import com.net.DAO.addBooksDAO;
import com.net.connection.Connect;

@WebServlet("/editBooks")

public class editBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.trim().isEmpty()) {
                int id = Integer.parseInt(idParam);
                String bookname = request.getParameter("bname");
                String author = request.getParameter("auname");
                String price = request.getParameter("bprice");
                String status = request.getParameter("bstatus");

                AddBookBean b = new AddBookBean();
                b.setBid(id);
                b.setBname(bookname);
                b.setAuname(author);
                b.setBprice(price);
                b.setBstatus(status);

                addBooksDAO dao = new addBooksDAO(Connect.getConnection());
                boolean f = dao.updateEditbook(b);

                if (f) {
                    session.setAttribute("status", "Success");
                } else {
                    session.setAttribute("status", "Failed");
                }
                response.sendRedirect("admin/allBook.jsp"); // Redirect with ID to maintain the context
            } else {
                session.setAttribute("status", "Failed");
                response.sendRedirect("admin/editBook.jsp?id=" + idParam);
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("status", "Failed");
            response.sendRedirect("admin/editBook.jsp?id=" + request.getParameter("id"));
        }
    }
}
