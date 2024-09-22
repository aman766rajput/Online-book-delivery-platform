<%@page import="com.net.Bean.AddBookBean"%>
<%@page import="com.net.connection.Connect"%>
<%@page import="com.net.DAO.addBooksDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN : Edit Book</title>
<%@include file="allCss.jsp"%>
<style>
/* Your existing CSS styles */
</style>
</head>
<body>
    <%@include file="navBar.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Edit Book</h4>

                        <%
                        String idParam = request.getParameter("id");
                        int id = 0;
                        try {
                            if (idParam != null && !idParam.trim().isEmpty()) {
                                id = Integer.parseInt(idParam);
                                addBooksDAO dao = new addBooksDAO(Connect.getConnection());
                                AddBookBean b = dao.getBookID(id);

                                if (b != null) {
                        %>

                        <form action="../editBooks" method="post" >
                            <input type="hidden" name="id" value="<%=b.getBid()%>">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Book Name*</label>
                                <input name="bname" type="text" class="form-control" id="exampleInputEmail" value="<%=b.getBname()%>">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Author Name*</label>
                                <input name="auname" type="text" class="form-control" id="exampleInputEmail" value="<%=b.getAuname()%>">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Price*</label>
                                <input name="bprice" type="number" class="form-control" id="exampleInputEmail" value="<%=b.getBprice()%>">
                            </div>

                            <div class="form-group">
                                <label for="inputState">Book Status</label>
                                <select id="inputState" name="bstatus" class="form-control">
                                    <option value="Active" <%= "Active".equals(b.getBstatus()) ? "selected" : "" %>>Active</option>
                                    <option value="Inactive" <%= "Inactive".equals(b.getBstatus()) ? "selected" : "" %>>Inactive</option>
                                </select>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form>

                        <%
                                } else {
                                    out.println("<p>Book not found. Please try again.</p>");
                                }
                            } else {
                                out.println("<p>Invalid book ID. Please try again.</p>");
                            }
                        } catch (NumberFormatException e) {
                            out.println("<p>Invalid book ID format. Please try again.</p>");
                        }
                        %>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="margin-top: 30px">
        <%@include file="footer.jsp"%>
    </div>

    <%
    String status = (String) session.getAttribute("status");
    if (status != null) {
    %>
        <script>
            const state = "<%= status %>";
            if (state === "Success") {
                alert("Book Updated Successfully");
            } else if (state === "Failed") {
                alert("Failed, Something went wrong");
            }
            <% session.removeAttribute("status"); %> <!-- Remove status after displaying the alert -->
        </script>
    <%
    }
    %>
</body>
</html>
