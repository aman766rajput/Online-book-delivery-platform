package com.net.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.net.Bean.AddBookBean;
import com.net.Bean.Cart;
import com.net.DAO.addBooksDAO;
import com.net.DAO.cartDAOimpl;
import com.net.connection.Connect;

@WebServlet("/cart")
public class cartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(request.getParameter("bid"));
            String uname = request.getParameter("uname");
            
            addBooksDAO dao = new addBooksDAO(Connect.getConnection());
            AddBookBean b = dao.getBookID(bid);
            
            Cart c = new Cart();
            c.setBid(bid);
            c.setUname(uname);
            c.setBookName(b.getBname());
            c.setAuthor(b.getAuname());
            c.setPrice(Integer.parseInt(b.getBprice()));
            c.setTotal_price(Integer.parseInt(b.getBprice()));
            
            cartDAOimpl dao2 = new cartDAOimpl(Connect.getConnection());
            
            HttpSession session = request.getSession();
            boolean f = dao2.addCart(c);
            if (f) {
                session.setAttribute("addcart", "success");
            } else {
                session.setAttribute("addcart", "fail");
            }
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
