<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="bean.LoginDao" %>
<%@ page import="bean.LoginBean" %>
<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<% 
		try{
		if(request.getParameter("submit") != null){
		String n = request.getParameter("uname");
		String p = request.getParameter("pass");
}
%>

<jsp:useBean id="obj" class="bean.LoginBean" />
<jsp:setProperty property="*" name="obj"/>

<%

boolean status = false; 
status = LoginDao.validate(obj);
if(status == true){  
response.sendRedirect("Details.jsp");
}
else
{
	out.println("Sorry invalid username or password");
	response.sendRedirect("http://localhost:8080/demo1/Login.html");
	}
}catch(Exception e){out.println(e);}
%>