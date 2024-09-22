<%@page import="com.net.connection.Connect"%>
<%@page import="com.net.DAO.bookOrderimpl"%>
<%@page import="com.net.Bean.bookorder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN : Orders</title>
<style>
body {
    background-color: #f4f7f9;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

h2.text-center {
    color: #343a40;
    font-size: 2rem;
}

.table {
    width: 100%;
    margin: 0 auto;
    background-color: #ffffff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.table th, .table td {
    padding: 12px;
    text-align: center;
    vertical-align: middle;
}

.table thead {
    background-color: #007bff;
    color: #ffffff;
}

.table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

.table tbody tr:hover {
    background-color: #e2e6ea;
}

.table th {
    font-weight: bold;
}

.table td {
    font-size: 14px;
}

.table .table-group-divider {
    border-top: 1px solid #dee2e6;
}

.table .table-group-divider + .table-group-divider {
    border-top-width: 0;
}

/* Responsive Design */
@media (max-width: 768px) {
    .table {
        font-size: 14px;
    }

    .table th, .table td {
        padding: 8px;
    }

    h2.text-center {
        font-size: 1.5rem;
    }
}

</style>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navBar.jsp"%>
	<h2 class="text-center">All Orders :</h2>
	<table class="table text-center">
		<thead>
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No.</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payement Type</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">
			<%
			bookOrderimpl dao = new bookOrderimpl(Connect.getConnection());
			List<bookorder> blist = dao.getBook();
			for (bookorder b : blist) {
			%>
			<tr>
				<th scope="row"><%=b.getOrderid()%></th>
				<td><%=b.getUsername() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFulladd() %></td>
				<td><%=b.getPhno()%></td>
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
	<div style="margin-top: 30px">
		
	</div>
</body>
</html>