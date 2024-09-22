<!DOCTYPE html>
<%@page import="com.net.DAO.StudentDAO"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Log</title>


</head>
<body>

	<jsp:useBean id="obj" class="com.net.Bean.StudentBean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj" />
	<%
	int status = StudentDAO.Login(obj);
	if (status > 0) {
		//	out.print("<br> Registration Success..."); 
		session.setAttribute("adminun", obj.getUname());
		out.print("<script> alert('Login Success....'); " + " window.open('index.jsp','_self')</script>");
	} else {
		//	out.print("<br> Registration Failed..."); 	 

		out.print("<script> alert('Login Failed....'); " + " window.open('login.jsp','_self')</script>");
	}
	%>


</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>