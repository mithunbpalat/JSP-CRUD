<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
 if(request.getParameter("tsubmit") != null)
 {
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
	 ps = con.prepareStatement("insert into teacher(Name,Subject,Email,Sex,Salary) values (?,?,?,?,?)");
	 ps.setString(1, name);
	 ps.setString(2, subject);
	 ps.setString(3, email);
	 ps.setString(4, sex);
	 ps.setString(5, salary);
	 ps.executeUpdate();
	 }catch(Exception e) {out.println(e);}
	 %>
	 <script>
	 	alert("Record Added..");
	 </script>
	 
	 <%
 }
%>
    
<!DOCTYPE html>
<html>
<head>

    <title>Teachers</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <h1 style="text-align: center;">SCHOOL MANAGEMENT SYSTEM</h1><br><br>
    <div class="container">
        <ul class="nav nav-pills nav-justified">
          <li class="nav-item">
            <a class="nav-link " href="Details.jsp">Students Record</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="Teachers.jsp">Teachers Record</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Login.html">Logout</a>
          </li>
        </ul><br><br><br>
        <h2 style="text-align: center;">Teacher Records</h2><br><br>
        <div class="row">
            <div class="col-sm-4">
                <form action="#" method="POST">
                    <div class="form-group">
                        <label for="tname">Name:</label><br>
                        <input type="text" class="form-control" placeholder="Enter Name" id="tname" name="tname" required>
                      </div><br>
                      <div class="form-group">
                        <label for="tsubject">Subject:</label><br>
                        <input type="text" class="form-control" placeholder="Enter Subject" id="tsubject" name="tsubject" required>
                      </div><br>
                      <div class="form-group">
                        <label for="temail">Email:</label><br>
                        <input type="text" class="form-control" placeholder="Enter Email" id="temail" name="temail" required>
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
                        <label for="tsalary">Fees:</label><br>
                        <input type="text" class="form-control" placeholder="Enter Salary" id="tsalary" name="tsalary" required>
                      </div><br>
                      <input type="submit" value="Add Teacher" class="w-100 btn btn-info" name="tsubmit" id="tsubmit">

                </form>
            </div>
            <div class="col-sm-8">
                <table id="tt" class="table table-dark table-responsive-sm">
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Subject</th>
                        <th>Email</th>
                        <th>Sex</th>
                        <th>Salary</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    <%
                 		Connection con;
               	 		PreparedStatement ps;
               	 		ResultSet rs;
               	 		
               	 		try{
               	 		Class.forName("com.mysql.jdbc.Driver");
               	 		con = DriverManager.getConnection("jdbc:mysql://localhost:3308/testdb","root","");
                    	
               	 		String query = "select * from teacher";
               	 		Statement st = con.createStatement();
               	 		rs = st.executeQuery(query);
               	 		
               	 		while(rs.next())
               	 		{
               	 			String id = rs.getString("Id");
                    %>
                    <tr>
                    	<td><%= rs.getString("Id") %></td>
                        <td><%= rs.getString("Name") %></td>
                        <td><%= rs.getString("Subject") %></td>
                        <td><%= rs.getString("Email") %></td>
                        <td><%= rs.getString("Sex") %></td>
                        <td><%= rs.getString("Salary") %></td>
                        <td><a href="TeacherEdit.jsp?id=<%=id%>">Edit</a></td>
                        <td><a href="TeacherDelete.jsp?id=<%=id%>">Delete</a></td>
                    </tr>
                    <%
               	 		}
               	 	    }catch(Exception e) {out.println(e);}
                    %>
                </table>
            </div>
        </div>
    
      

</body>
</html>