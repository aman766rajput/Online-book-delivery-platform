<%@page import="com.net.Bean.AddBookBean"%>
<%@page import="java.util.List"%>
<%@page import="com.net.connection.Connect"%>
<%@page import="com.net.DAO.addBooksDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN : All books</title>
<style>
body {
    background-color: #f4f6f9;
    font-family: Arial, sans-serif;
}

h2.text-center {
    color: #343a40;
}

.table {
    width: 100%;
    margin: 20px auto;
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
    background-color: #f2f2f2;
}

.table tbody tr:hover {
    background-color: #e9ecef;
}

.table img {
    border-radius: 5px;
    width: 50px;
    height: 50px;
}

.table .btn {
    border-radius: 5px;
    padding: 5px 10px;
    font-size: 14px;
    margin: 2px;
    transition: background-color 0.3s, border-color 0.3s;
}

.table .btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    color: #ffffff;
}

.table .btn-primary:hover {
    background-color: #0056b3;
    border-color: #004085;
}

.table .btn-danger {
    background-color: #dc3545;
    border-color: #dc3545;
    color: #ffffff;
}

.table .btn-danger:hover {
    background-color: #c82333;
    border-color: #bd2130;
}

/* Media Queries for Responsive Design */
@media (max-width: 768px) {
    .table {
        font-size: 14px;
    }

    .table th, .table td {
        padding: 8px;
    }

    .table .btn {
        font-size: 12px;
        padding: 4px 8px;
    }
}

</style>
<%@include file="allCss.jsp"%>
</head>
<body>
    <%@include file="navBar.jsp"%>
    <h2 class="text-center">All Books :</h2>
    <table class="table table-striped text-center">
        <thead>
            <tr>
                <th scope="col">Book Id</th>
                <th scope="col">Image</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author Name</th>
                <th scope="col">Price</th>
                <th scope="col">Book Categories</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>

            <%
            addBooksDAO dao = new addBooksDAO(Connect.getConnection());
            List<AddBookBean> list = dao.getAllbook();
            for (AddBookBean b : list) {
            %>
            <tr>
                <th scope="row"><%=b.getBid()%></th>
                <td><img src="../book/<%=b.getBphoto()%>" style="width: 50px; height: 50px;"></td>
                <td><%=b.getBname()%></td>
                <td><%=b.getAuname()%></td>
                <td><%=b.getBprice()%></td>
                <td><%=b.getBcategories()%></td>
                <td><%=b.getBstatus()%></td>
                <td>
                    <a href="editBook.jsp?id=<%=b.getBid()%>" class="btn btn-primary">Edit</a>
                    <a href="../delete?id=<%=b.getBid()%>" class="btn btn-danger">Delete</a>
                </td>
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

