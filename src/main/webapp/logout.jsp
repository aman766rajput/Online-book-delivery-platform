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

	




	<%
	
	
		//	out.print("<br> Registration Success..."); 
		session.removeAttribute("adminun");
		out.print("<script> alert('Logout Success....'); " + " window.open('login.jsp','_self')</script>");
	
	%>


</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>