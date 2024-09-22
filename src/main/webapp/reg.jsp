<%@page import="com.net.DAO.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:useBean id="obj" class="com.net.Bean.StudentBean"></jsp:useBean>
 <jsp:setProperty property="*" name="obj"/>
 
 
 


<%
  int status = StudentDAO.Register(obj);
 if(status > 0)
 {
//	out.print("<br> Registration Success..."); 

out.print("<script> alert('Registration Success....'); "+ 
" window.open('login.jsp','_self')</script>");
 }
 else
 {
	//	out.print("<br> Registration Failed..."); 	 

out.print("<script> alert('Registration Failed....'); "+ 
" window.open('index.jsp','_self')</script>");
 }
%>

 
</body>
</html>