<%@page import="com.net.Bean.bookorder"%>
<%@page import="java.util.List"%>
<%@page import="com.net.connection.Connect"%>
<%@page import="com.net.DAO.bookOrderimpl"%>
<%@page import="com.net.DAO.bookorderDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books and Orders</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Include the updated CSS here */
        body {
    font-family: 'Arial', sans-serif;
    background-color: #f8f9fa;
}

.container {
    margin-top: 20px;
}

.card {
    border: none;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card-body {
    text-align: center;
    padding: 20px;
}

.card-body i {
    font-size: 3rem;
    margin-bottom: 10px;
}

.card-body h4 {
    font-size: 1.2rem;
    color: #333;
    margin: 0;
}

.card-body .text-primary {
    color: #007bff;
}

.card-body .text-danger {
    color: #dc3545;
}

.card-body .text-warning {
    color: #ffc107;
}

a {
    text-decoration: none;
    color: inherit;
}

a:hover {
    color: inherit;
}

h4 {
    font-weight: 600;
    margin-bottom: 10px;
}
        
    </style>
    <%@include file="allCss.jsp"%>
</head>
<body>
    <%@include file="navBar.jsp"%>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-2">
                <a href="addBook.jsp">
                    <div class="card">
                        <div class="card-body">
                            <i class="fa-solid fa-square-plus text-primary"></i><br>
                            <h4>Add Book</h4>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-2">
                <a href="allBook.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-book-open text-danger"></i><br>
                            <h4>All Books</h4>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-2">
                <a href="order.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-truck-ramp-box text-warning"></i><br>
                            <h4>Orders</h4>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-2">
                <a href="adminlogin.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-right-from-bracket text-primary"></i><br>
                            <h4>Logout</h4>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
