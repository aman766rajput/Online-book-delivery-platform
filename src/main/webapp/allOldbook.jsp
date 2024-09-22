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
<title>Old Books:</title>
<style type="text/css">
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

    body {
        background-color: #f7f7f7;
        font-family: 'Arial', sans-serif;
        color: #333;
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
    }

    .btn-danger {
        background-color: #dc3545;
        border: none;
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

<%@include file="allComponent/allCss.jsp"%>
</head>
<body>
	<%@include file="allComponent/navBar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">

			<%
			addBooksDAO dao3 = new addBooksDAO(Connect.getConnection());
			List<AddBookBean> list3 = dao3.getAlloldBook();
			for (AddBookBean b : list3) {
			%>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center ">
						<img src="book/<%=b.getBphoto()%>"
							style="width: 150px; height: 200px" class="img.thumblin">
						<p><%=b.getBname()%></p>
						<p><%=b.getAuname()%></p>
						<p>
							Category :
							<%=b.getBcategories()%></p>
						<div class="row">
							<a href="viewBook.jsp?bid=<%=b.getBid() %>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBprice()%></a>
						</div>

					</div>

				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>
	 <%@include file="allComponent/footer.jsp" %>
</body>
</html>