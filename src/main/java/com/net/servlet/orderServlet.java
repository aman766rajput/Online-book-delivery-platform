package com.net.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.net.Bean.Cart;
import com.net.Bean.bookorder;
import com.net.DAO.bookOrderimpl;
import com.net.DAO.cartDAOimpl;
import com.net.connection.Connect;

@WebServlet("/order")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phno = request.getParameter("phno");
			String add = request.getParameter("add");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String pin = request.getParameter("pin");
			String payment = request.getParameter("pay");
			String uname=request.getParameter("yeah");
			String fulladd=add+","+city+","+state+","+pin;
			
			
			
			cartDAOimpl dao=new cartDAOimpl(Connect.getConnection());
			
			List<Cart> list=dao.getBookByUser(request.getParameter("yeah")); 
			bookOrderimpl dao2=new bookOrderimpl(Connect.getConnection());
			bookorder o=null;
			int i=dao2.getOrderNo();
			ArrayList<bookorder> ordlist=new ArrayList<bookorder>();
			for(Cart c:list) {
				o=new bookorder();
				o.setOrderid("00"+i);
				o.setUsername(name);
				o.setEmail(email);
				o.setPhno(phno);
				o.setBname(c.getBookName());
				o.setFulladd(fulladd);
				o.setAuthor(c.getAuthor());
				o.setPrice(c.getPrice());
				o.setPayment(payment);
				o.setPincode(pin);
				o.setUname(uname);
				ordlist.add(o);
				i++;
			}
			if("noselect".equals(payment)) {
				response.sendRedirect("cart.jsp");
			}else {
			boolean f=	dao2.saveOrder(ordlist);
			if(f) {
				response.sendRedirect("orderPlaced.jsp");
			}else {
				System.out.print("Order fail");
			}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
