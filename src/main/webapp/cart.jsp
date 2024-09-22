<%@page import="com.net.Bean.AddBookBean"%>
<%@page import="java.util.List"%>
<%
if (session.getAttribute("adminun") == null) {
	response.sendRedirect("login.jsp");
}
%>
<%@page import="com.net.connection.Connect"%>
<%@page import="com.net.DAO.cartDAOimpl"%>
<%@page import="com.net.Bean.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart :</title>
<style>
/* Flexbox alignment for button and link */
.button-container {
	display: flex;
	justify-content: center; /* Center the buttons horizontally */
	gap: 10px; /* Space between the buttons */
	margin-top: 20px; /* Optional: space above the button container */
}

.button-container .btn {
	flex: 1; /* Allow buttons to grow and take up available space */
	text-align: center; /* Center text inside the button */
}
</style>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color: #edfcf1">
	<%@include file="allComponent/navBar.jsp"%>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6 ">
				<h3 class="text-center text-success">Selected Items</h3>
				<div class="card bg-white">
					<div class="card-body">

						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								String uname = (String) session.getAttribute("adminun");
								cartDAOimpl dao = new cartDAOimpl(Connect.getConnection());
								List<Cart> list = dao.getBookByUser(uname);
								int totalPrice = 0;
								for (Cart c : list) {
									totalPrice = c.getTotal_price();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="./deletecart?id=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>

								<tr>
									<td>Total Price</td>
									<td>-</td>
									<td><%=totalPrice%></td>
									<td></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">

				<h3 class="text-center text-primary">Your Details</h3>
				<div class="card bg-white">
					<div class="card-body">
						<%
						String uName = (String) session.getAttribute("adminun");
						%>
						<form class="row g-3" action="order" method="post">
							<input type="hidden" value="<%=uName%>" name="yeah">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Name</label> <input
									type="text" class="form-control" id="inputEmail4" name="name">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Email</label> <input
									type="email" class="form-control" id="inputPassword4"
									name="email">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Mobile
									Nnumber</label> <input type="number" class="form-control"
									id="inputEmail4" name="phno">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">City</label> <input
									type="text" class="form-control" id="inputPassword4"
									name="city">
							</div>
							<div class="col-12">
								<label for="inputAddress" class="form-label">Address</label> <input
									type="text" class="form-control" id="inputAddress" name="add"
									placeholder="1234 Main St">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">State</label> <input
									type="text" class="form-control" id="inputEmail4" name="state">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Pin Code</label>
								<input type="text" class="form-control" id="inputPassword4"
									name="pin">
							</div>
							<div class="col-md-4">
								<label for="inputState" class="form-label">Payment Type</label>
								<select id="inputState" class="form-select" name="pay">
									<option value="noselect">....select....</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>

							<div class="col-12">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="gridCheck">
									<label class="form-check-label" for="gridCheck"> Check
										me out </label>
								</div>
							</div>

							<div class="button-container">
								<button class="btn btn-danger">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>