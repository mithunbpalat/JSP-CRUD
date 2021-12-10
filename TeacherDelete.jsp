<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<%
	 String id = request.getParameter("id");
	 
	 Connection con;
	 PreparedStatement ps;
	 ResultSet rs;
	 
	 try{
	 Class.forName("com.mysql.jdbc.Driver");
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3308/testdb","root","");
	 ps = con.prepareStatement("delete from teacher where id = ?");
	 ps.setString(1, id);	 
	 ps.executeUpdate();
	 }catch(Exception e) {out.println(e);}
	 %>
	 <script>
	 	alert("Record Deleted..");
	 </script>
	 <%
	 response.sendRedirect("Teachers.jsp");
	 %>