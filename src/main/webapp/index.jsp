<%@page import="com.net.Bean.StudentBean"%>
<%@page import="com.net.Bean.AddBookBean"%>
<%@page import="java.util.List"%>
<%@page import="com.net.connection.Connect"%>
<%@page import="com.net.DAO.addBooksDAO"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
body {
	background-color: #f7f7f7;
	font-family: 'Arial', sans-serif;
	color: #333;
}

.back-img {
	background: url("img/book2.png") center center/cover no-repeat;
	height: 100vh;
	width: 100%;
	background-repeat: no-repeat;
	position: relative;
}

h4 {
	color: #ffffff;
	text-shadow: 2px 2px 4px #000000;
	font-weight: 600;
	text-align: center;
	padding: 10px 20px;
	background-color: rgba(0, 0, 0, 0.5);
	border-radius: 10px;
	position: absolute;
	top: 20px;
	left: 50%;
	transform: translateX(-50%);
	width: 80%;
}

.container {
	width: 100%;
	margin-top: 20px;
	margin-bottom: 20px;
}

.card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s, background-color 0.3s;
}

.card:hover {
	background-color: #e1fce3;
	transform: scale(1.05);
}

.card-body img {
	width: 150px;
	height: 200px;
	margin-bottom: 15px;
	transition: transform 0.3s;
}

.card-body img:hover {
	transform: scale(1.1);
}

.card-body p {
	margin: 5px 0;
	font-size: 14px;
	font-weight: 300;
}

.card-body .row a {
	margin: 5px;
	text-align: center;
}

.btn {
	padding: 8px 12px;
	font-size: 14px;
	border-radius: 20px;
	transition: background-color 0.3s, transform 0.3s;
}

.btn:hover {
	transform: scale(1.05);
}

.btn-success {
	background-color: #28a745;
	border: none;
	color: white;
}

.btn-danger {
	background-color: #dc3545;
	border: none;
	color: white;
}

.text-center {
	text-align: center;
}

hr {
	border-top: 1px solid #bbb;
	width: 90%;
	margin: 20px auto;
}

.text-center a.btn {
	width: 100px;
	margin-top: 10px;
}
</style>
</head>
<body>

	<%@include file="allComponent/navBar.jsp"%>

	<div class="container-fluid back-img ">
		<h4>The objective of the project is to offer a streamlined and
			user-friendly platform that enables customers to effortlessly browse,
			purchase, and have books delivered directly to their doorstep.</h4>
	</div>

	<br>
	<hr>

	<!-- Recent Books Section -->
	<div class="container">
		<h3 class="text-center">Recent Books</h3>
		<div class="row">

			<%
			addBooksDAO dao = new addBooksDAO(Connect.getConnection());
			List<AddBookBean> list = dao.getRecBook();
			for (AddBookBean b : list) {
			%>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center ">
						<img src="book/<%=b.getBphoto()%>"
							style="width: 150px; height: 200px" class="img.thumblin">
						<p>
							Book Name :<%=b.getBname()%></p>
						<p>
							Author :<%=b.getAuname()%></p>
						<%
						int id = b.getBid();
						%>
						<p>
							Category :
							<%=b.getBcategories()%></p>
						<div class="row">
							<%
							if (b.getBcategories().equals("Old")) {
							%>
							<a href="viewBook.jsp?bid=<%=id%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBprice()%></a>
							<%
							} else {
							if (session.getAttribute("adminun") == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"> <i
								class="fa fa-shopping-cart" aria-hidden="true"></i>Add Cart
							</a>
							<%
							} else {
							%>
							<a
								href="cart?bid=<%=id%>&uname=<%=session.getAttribute("adminun")%>"
								class="btn btn-danger btn-sm ml-1"> <i
								class="fa fa-shopping-cart" aria-hidden="true"></i>Add Cart
							</a>
							<%
							}
							%>
							<a href="viewBook.jsp?bid=<%=id%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBprice()%></a>
							<%
							}
							%>
						</div>
					</div>

				</div>
			</div>



			<%
			}
			%>
		</div>
		<div class="text-center">
			<a href="allRecentbook.jsp" class="btn btn-success btn-sm">View
				All</a>
		</div>
	</div>
	<hr>

	<!-- New Books Section -->
	<div class="container">
		<h3 class="text-center">New Books</h3>
		<div class="row">
			<%
			List<AddBookBean> newBooks = dao.getNewBook();
			for (AddBookBean b : newBooks) {
			%>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<img src="book/<%=b.getBphoto()%>"
							style="width: 150px; height: 200px" class="img.thumblin">
						<p>
							Book Name :
							<%=b.getBname()%></p>
						<p>
							Author :
							<%=b.getAuname()%></p>
						<p>
							Category :
							<%=b.getBcategories()%></p>
						<div class="row">
							<%
							if (session.getAttribute("adminun") == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"> <i
								class="fa fa-shopping-cart" aria-hidden="true"></i> Add Cart
							</a>
							<%
							} else {
							%>
							<a
								href="cart?bid=<%=b.getBid()%>&uname=<%=session.getAttribute("adminun")%>"
								class="btn btn-danger btn-sm ml-3"> <i
								class="fa fa-shopping-cart" aria-hidden="true"></i> Add Cart
							</a>
							<%
							}
							%>
							<a href="viewBook.jsp?bid=<%=b.getBid()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBprice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center">
			<a href="allNewbook.jsp" class="btn btn-success btn-sm">View All</a>
		</div>
	</div>
	<hr>

	<!-- Old Books Section -->
	<div class="container">
		<h3 class="text-center">Old Books</h3>
		<div class="row">
			<%
			List<AddBookBean> oldBooks = dao.getOldBook();
			for (AddBookBean b : oldBooks) {
			%>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<img src="book/<%=b.getBphoto()%>" class="img-thumbnail">
						<p>
							Book Name :<%=b.getBname()%></p>
						<p>
							Author :<%=b.getAuname()%></p>
						<p>
							Category :<%=b.getBcategories()%></p>
						<div class="row">
							<a href="viewBook.jsp?bid=<%=b.getBid()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBprice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center">
			<a href="allOldbook.jsp" class="btn btn-success btn-sm">View All</a>
		</div>
	</div>

	<hr>

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>

	<!-- JavaScript to show alert based on session attribute -->
	<script>
	let state = '<%=session.getAttribute("addcart")%>
		';
		if (state === "success") {
			alert('Added to cart....');
		} else if (state === "fail") {
			alert('Failed to add to cart....');
		}
	</script>

	<%
	// Clear the session attribute after showing the alert
	session.removeAttribute("addcart");
	%>
	<%@include file="allComponent/footer.jsp"%>
</body>
</html>
