<%@page import="com.net.Bean.bookorder"%>
<%@page import="java.util.List"%>
<%@page import="com.net.connection.Connect"%>
<%@page import="com.net.DAO.bookOrderimpl"%>
<%@page import="com.net.DAO.bookorderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Order :</title>
<style>
    
    body {
    background-color: #f4f4f4;
    font-family: 'Arial', sans-serif;
    color: #333;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
}

h3 {
    margin-bottom: 20px;
    font-size: 1.8rem;
}

.table {
    width: 100%;
    margin: 20px 0;
    border-collapse: collapse;
}

.table th, .table td {
    padding: 12px;
    text-align: left;
    border: 1px solid #ddd;
}

.table th {
    background-color: #007bff;
    color: #fff;
    font-weight: bold;
}

.table td {
    background-color: #fff;
}

.table-striped tbody tr:nth-of-type(odd) {
    background-color: #f9f9f9;
}

.table-hover tbody tr:hover {
    background-color: #e9ecef;
}

.text-primary {
    color: #007bff;
}

.text-center {
    text-align: center;
}
    
</style>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body>
    <%@include file="allComponent/navBar.jsp"%>
    <div class="container p-1">
        <h3 class="text-center text-primary">Your Orders</h3>

        <table class="table table-striped mt-3">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment Type</th>
                </tr>
            </thead>
            <tbody>

                <%
                String uname = (String) session.getAttribute("adminun");
                bookOrderimpl dao = new bookOrderimpl(Connect.getConnection());
                List<bookorder> blist = dao.getBook(uname);
                for(bookorder b:blist){%>
                
                <tr>
                    <td><%=b.getOrderid() %></td>
                    <td><%=b.getUsername() %></td>
                    <td><%=b.getBname() %></td>
                    <td><%=b.getAuthor() %></td>
                    <td><%=b.getPrice() %></td>
                    <td><%=b.getPayment() %></td>
                </tr>
                <% 					
                }
                %>
                
            </tbody>
        </table>
    </div>
</body>
</html>
