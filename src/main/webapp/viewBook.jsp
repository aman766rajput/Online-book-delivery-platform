<%@page import="com.net.Bean.AddBookBean"%>
<%@page import="com.net.connection.Connect"%>
<%@page import="com.net.DAO.addBooksDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details:</title>
<style>
/* Global Styles */
body {
    background-color: #f5f5f5;
    font-family: 'Arial', sans-serif;
    color: #333;
    margin: 0;
    padding: 0;
}

.container {
    margin-top: 50px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

h2, h4, h5 {
    color: #333;
    font-weight: 600;
}

p {
    margin: 0;
    padding: 0;
    color: #555;
}

a {
    text-decoration: none;
    transition: all 0.3s ease-in-out;
}

a:hover {
    opacity: 0.8;
}

/* Image Styling */
img {
    height: 180px;
    width: 140px;
    object-fit: cover;
    border-radius: 8px;
    transition: transform 0.3s;
}

img:hover {
    transform: scale(1.05);
}

/* Button Styles */
.btn {
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 25px;
    border: none;
    color: #fff;
    transition: all 0.3s ease;
    margin: 10px 5px;
}

.btn-primary {
    background-color: #007bff;
}

.btn-primary:hover {
    background-color: #0056b3;
}

.btn-danger {
    background-color: #dc3545;
}

.btn-danger:hover {
    background-color: #c82333;
}

/* Card Styles */
.border {
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    background-color: #fff;
}

/* Icon and Text Styling */
.text-center i {
    color: #28a745;
    margin-bottom: 10px;
}

.text-success {
    color: #28a745;
}



/* Responsive Design */
@media (max-width: 768px) {
    .container {
        margin-top: 20px;
        padding: 10px;
    }

    img {
        width: 120px;
        height: 160px;
    }

    .btn {
        font-size: 14px;
        padding: 8px 16px;
    }
}

</style>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body>
	<%@include file="allComponent/navBar.jsp"%>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	addBooksDAO dao = new addBooksDAO(Connect.getConnection());
	AddBookBean b = dao.getBookID(bid);
	%>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border">
				<img src="book/<%=b.getBphoto()%>"
					style="height: 120px; width: 100px;"><br>
				<h4>
					Book Name :
					<%=b.getBname()%></h4>
				<h4>
					Author Name :
					<%=b.getAuname()%></h4>
				<h4>
					Category :
					<%=b.getBcategories()%></h4>
			</div>


			<div class="col-md-6 text-center p-5 border">
				<h2><%=b.getBname()%></h2>
				<br>


				<%
				if ("Old".equals(b.getBcategories())) {
				%>
				<h5>Contact to seller</h5>
				<h5>
					<i class="fa-regular fa-envelope"></i> Email : admin@gmail
				</h5>

				<%
				}
				%>
				<div class="row ">
					<div class="col-md-4 text-success text-center">
						<i class="fa-solid fa-money-bill fa-2x"></i>
						<p>Cash on delivery</p>
					</div>
					<div class="col-md-4 text-success text-center">
						<i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
						<p>Return</p>
					</div>
					<div class="col-md-4 text-success text-center">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>



				</div>
				<%
				if ("Old".equals(b.getBcategories())) {
				%>

				<div class=" text-center p-3">
					<a href="index.jsp" class="btn btn-primary" style="width:150px">Continue Shopping</a> <a href=""
						class="btn btn-danger">$ <%=b.getBprice()%></a>
				</div>

				<%
				} else {
				%>
				<div class=" text-center p-3">
					<a href="" class="btn btn-primary">Add To Cart</a> <a href=""
						class="btn btn-danger">$ <%=b.getBprice()%></a>
				</div>
				
				<%
				}
				%>
				

			</div>
		</div>
	</div>
	
	 <%@include file="allComponent/footer.jsp" %>
</body>
</html>