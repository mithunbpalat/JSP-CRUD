<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<%
 if(request.getParameter("tsubmit") != null)
 {
	 String id = request.getParameter("id");
	 String name = request.getParameter("tname");
	 String subject = request.getParameter("tsubject");
	 String email = request.getParameter("temail");
	 String sex = request.getParameter("tsex");
	 String salary = request.getParameter("tsalary");
	 
	 Connection con;
	 PreparedStatement ps;
	 ResultSet rs;
	 
	 try{
	 Class.forName("com.mysql.jdbc.Driver");
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3308/testdb","root","");
	 ps = con.prepareStatement("update teacher set Name=?, Subject=?, Email=?, Sex=?, Salary=? where id=?");
	 ps.setString(1, name);
	 ps.setString(2, subject);
	 ps.setString(3, email);
	 ps.setString(4, sex);
	 ps.setString(5, salary);
	 ps.setString(6, id);	 
	 ps.executeUpdate();
	 }catch(Exception e) {out.println(e);}
	 %>
	 <script>
	 	alert("Record Updated..");
	 </script>
	 
	 <%
 }
%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Edit</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>Student Update</h1>
	<div class="row">
		<div class="col-sm-4">
                <form action="#" method="POST">
                
                   <%
                   		Connection con;
              	 		PreparedStatement ps;
              	 		ResultSet rs;
              	 		
              	 		try{
              	 		Class.forName("com.mysql.jdbc.Driver");
              	 		con = DriverManager.getConnection("jdbc:mysql://localhost:3308/testdb","root","");
              	 		
              	 		String id = request.getParameter("id");
              	 		ps = con.prepareStatement("select * from teacher where id = ?");
              	 		ps.setString(1, id);
              	 		rs = ps.executeQuery();
              	 		
              	 		while(rs.next())
              	 		{
                   %>                
                    <div class="form-group">
                        <label for="tname">Name:</label><br>
                        <input type="text" class="form-control" placeholder="Enter Name" value="<%= rs.getString("Name") %>" id="tname" name="tname" required>
                      </div><br>
                      <div class="form-group">
                        <label for="tsubject">Subject:</label><br>
                        <input type="text" class="form-control" placeholder="Enter Subject"  value="<%= rs.getString("Subject") %>" id="tsubject" name="tsubject" required>
                      </div><br>
                      <div class="form-group">
                        <label for="temail">Email:</label><br>
                        <input type="text" class="form-control" placeholder="Enter Email"  value="<%= rs.getString("Email") %>" id="temail" name="temail" required>
                      </div><br>
                      <label for="tsex">Sex:  </label>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="tsex" id="male" value="Male" checked>Male
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="tsex" id="female" value="Female">Female
                        </label>
                      </div><br><br>
                      <div class="form-group">
                        <label for="tsalary">Salary:</label><br>
                        <input type="text" class="form-control" placeholder="Enter Salary"  value="<%= rs.getString("Salary") %>" id="tsalary" name="tsalary" required>
                      </div>
                      
                      <%  
                         }
              	 		 }catch(Exception e) {out.println(e);}
              	 		%>
                      
                      <br>
                      <input type="submit" value="Add Teacher" class="w-100 btn btn-info" name="tsubmit" id="tsubmit">
					  <br><br>
					  <div>
					  		<p><a href="Teachers.jsp">Click to go back</a></p>
					  </div>
                </form>
            </div>
		
	</div>
</body>
</html>