package com.net.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.net.DAO.addBooksDAO;
import com.net.connection.Connect;

@WebServlet("/delete")
public class deletebook extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            addBooksDAO dao = new addBooksDAO(Connect.getConnection());
            boolean f = dao.deleteBook(id);
            
            response.sendRedirect("admin/allBook.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



