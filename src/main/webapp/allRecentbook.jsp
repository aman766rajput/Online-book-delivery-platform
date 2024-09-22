<%@page import="com.net.Bean.AddBookBean"%>
<%@page import="java.util.List"%>
<%@page import="com.net.connection.Connect"%>
<%@page import="com.net.DAO.addBooksDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent Books:</title>
<style>
.card:hover {
	background-color: #e1fce3;
}

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
	position: relative; /* Set to position the h4 inside */
}

h4 {
	color: #ffffff;
	text-shadow: 2px 2px 4px #000000;
	font-weight: 600;
	text-align: center;
	padding: 10px 20px;
	background-color: rgba(0, 0, 0, 0.5);
	border-radius: 10px;
	position: absolute; /* Position the h4 absolutely within .back-img */
	top: 20px; /* Adjust this value to move the h4 up or down */
	left: 50%;
	transform: translateX(-50%); /* Center the h4 horizontally */
	width: 80%; /* Adjust the width as necessary */
}

.container {
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

.card-body {
	padding: 20px;
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
	font-size: 16px;
	font-weight: 500;
}

.card-body .row a {
	margin: 5px;
	text-align: center;
}
</style>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body>
	<%@include file="allComponent/navBar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			addBooksDAO dao = new addBooksDAO(Connect.getConnection());
			List<AddBookBean> list = dao.getAllRecentBook();
			int count = 0;
			for (AddBookBean b : list) {
				if (count % 4 == 0 && count != 0) {
			%>
		</div>
		<!-- End row -->
		<div class="row">
			<!-- Start new row -->
			<%
			}
			%>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<img src="book/<%=b.getBphoto()%>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p>
							Book Name :
							<%=b.getBname()%></p>
						<p>
							Author :
							<%=b.getAuname()%></p>
						<p>
							<%
							if (b.getBcategories().equals("Old")) {
							%>
							Category:
							<%=b.getBcategories()%></p>
						<div class="row">
							<a href="viewBook.jsp?bid=<%=b.getBid()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBprice()%></a>
						</div>
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
							href="cart?bid=<%=b.getBid()%>&uname=<%=session.getAttribute("adminun")%>"
							class="btn btn-danger btn-sm ml-1"> <i
							class="fa fa-shopping-cart" aria-hidden="true"></i>Add Cart
						</a>
						<%
						}
						%>
						<a href="viewBook.jsp?bid=<%=b.getBid()%>"
							class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
							class="btn btn-danger btn-sm ml-1"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBprice()%></a>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			count++;
			}
			%>
		</div>
		<!-- End last row -->
	</div>
	<%@include file="allComponent/footer.jsp"%>
</body>
</html>
