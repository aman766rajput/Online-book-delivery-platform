<style>
.aman {
    padding-top: 30px;
}

a {
    text-decoration: none;
    color: white;
}

a:hover {
    text-decoration: none;
    color: white;
}

.btn {
    padding: 8px 12px;
    font-size: 14px;
    border-radius: 20px;
    transition: background-color 0.3s, transform 0.3s;
    display: inline-flex;
    align-items: center;
    justify-content: center;
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

.btn-primary {
    background-color: #007bff;
    border: none;
}

.text-center {
    text-align: center;
}

.text-center a.btn {
    width: 100px;
    margin-top: 10px;
}

.btn-container {
    display: flex;
    gap: 10px;
    justify-content: flex-end; /* Align buttons to the right */
}

.btn-container .btn {
    margin: 0;
}

</style>
<div class="container-fluid" style="height: 10px; background-color: #004040"></div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <h3>
                <i class="fa-solid fa-book"></i>Ebooks
            </h3>
        </div>
        <div class="col-md-3 aman">
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-primary" type="submit">Search</button>
            </form>
        </div>
        <div class="col-md-5 aman btn-container">
            <% if (session.getAttribute("adminun") == null) { %>
                <button type="button" class="btn btn-success">
                    <a href="login.jsp" style="color: white;">Login <i class="fa-solid fa-right-to-bracket"></i></a>
                </button>
                <button type="button" class="btn btn-primary">
                    <a href="registration.jsp" style="color: white;">Register <i class="fa-solid fa-id-card"></i></a>
                </button>
            <% } else { %>
                <button type="button" class="btn btn-danger btn-sm">
                    <a href="cart.jsp" style="color: white;">Cart <i class="fa-solid fa-cart-shopping"></i></a>
                </button>
                <button type="button" class="btn btn-success btn-sm">
                    <a href="viewOrder.jsp" style="color: white;">View Orders</a>
                </button>
                <button type="button" class="btn btn-success btn-sm">
                    <a href="" style="color: white;"><%=session.getAttribute("adminun")%> </a>
                </button>
                <button type="button" class="btn btn-danger">
                    <a href="logout.jsp" style="color: white;">Logout <i class="fa-solid fa-id-card"></i></a>
                </button>
            <% } %>
        </div>
    </div>

    <div class="aman">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house"></i>Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="allNewbook.jsp"><i class="fa fa-book" aria-hidden="true"></i>New Book</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="allRecentbook.jsp"><i class="fa fa-book" aria-hidden="true"></i>Recent Book</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="allOldbook.jsp"><i class="fa fa-book" aria-hidden="true"></i>Old Book</a></li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <button class="btn btn-light my-2 mt-sm-0" type="submit">
                            Setting <i class="fa-solid fa-gear"></i>
                        </button>
                        <button class="btn btn-light my-2 mt-sm-0" type="submit">
                            Contact Us <i class="fa-solid fa-phone"></i>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
</div>
