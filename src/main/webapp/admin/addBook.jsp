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
    <title>ADMIN : Add Books</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
    background-color: #f8f9fa;
    font-family: Arial, sans-serif;
}

.container {
    margin-top: 50px;
}

.card {
    border: none;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #ffffff;
}

.card-body {
    padding: 30px;
}

.card-body h4 {
    margin-bottom: 20px;
    font-weight: bold;
    color: #343a40;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    font-weight: bold;
    color: #495057;
}

.form-control,
.form-control-file {
    border-radius: 5px;
    border: 1px solid #ced4da;
    padding: 10px;
    transition: border-color 0.3s;
}

.form-control:focus,
.form-control-file:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
}

.form-control-file {
    border: 1px solid #ced4da;
    padding: 10px;
    border-radius: 5px;
}

.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    border-radius: 5px;
    padding: 10px 20px;
    font-weight: bold;
    transition: background-color 0.3s, border-color 0.3s;
}

.btn-primary:hover {
    background-color: #0056b3;
    border-color: #004085;
}

.text-center {
    text-align: center;
}

/* Media Queries for Responsive Design */
@media (max-width: 768px) {
    .container {
        margin-top: 20px;
    }

    .card-body {
        padding: 20px;
    }

    .card-body h4 {
        font-size: 1.5rem;
    }
}

    </style>
    <%@include file="allCss.jsp"%>
</head>
<body>
    <%@include file="navBar.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Add Book</h4>
                        <form action="../addBooks" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Book Name*</label>
                                <input name="bname" type="text" class="form-control" id="exampleInputEmail1">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail2">Author Name*</label>
                                <input name="auname" type="text" class="form-control" id="exampleInputEmail2">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail3">Price*</label>
                                <input name="bprice" type="number" class="form-control" id="exampleInputEmail3">
                            </div>
                            <div class="form-group">
                                <label for="inputState">Book Categories</label>
                                <select id="inputState" name="bcategories" class="form-control">
                                    <option selected>--select--</option>
                                    <option value="New">New Book</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputState">Book Status</label>
                                <select id="inputState" name="bstatus" class="form-control">
                                    <option selected>--select--</option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlFile1">Upload Photo</label>
                                <input name="bphoto" type="file" class="form-control-file" id="exampleFormControlFile1">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="margin-top: 30px">
       
    </div>
    <input type="hidden" id="state" value="<%=session.getAttribute("status") %>">
    <script>
        const state = document.getElementById("state").value;
        if (state === "Success") {
            alert("Book Added Successfully");
        } else if (state === "Failed") {
            alert("Failed, Something went wrong");
        }
    </script>
</body>
</html>
