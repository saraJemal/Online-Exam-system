<%-- 
    Document   : regDemo
    Created on : 7 Aug 2024, 14:14:38
    Author     : new
--%>

<%Class.forName("com.mysql.cj.jdbc.Driver");%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration Page </title>
    </head>
         <%!
            public class Users{
            
                Connection con = null;
                PreparedStatement pst = null;
                
                
                public Users(){
                    try {
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                    pst = con.prepareStatement("INSERT INTO user_register (first_name, middle_name, last_name, Email,Address, password,user_role,last_update)" 
                                + "values (?,?,?,?,?,?,?,?)");
                                
                     }
                    catch(SQLException e){
                        e.printStackTrace();
                    }
                }
                public int setUser(String first, String middle, String last, String Email, String Address, String pass, String role, Timestamp timeStamp){
                int result = 0;
                try {    
                   pst.setString(1, first);
                   pst.setString(2, middle);
                   pst.setString(3, last);
                   pst.setString(4, Email);
                   pst.setString(5, Address);
                   pst.setString(6, pass);
                   pst.setString(7, role);
                   pst.setTimestamp(8, timeStamp);
                   result = pst.executeUpdate();
                }catch (SQLException e){
                    e.printStackTrace();
                }             
                return result;
               }
            }
        %>
        <%
         int result = 0;
         if (request.getParameter("submit") != null){
         String first_name = new String();
         String middle_name = new String();
         String last_name = new String();
         String Email = new String();
         String Address = new String();
         String password = new String();
         String user_role = new String();
         
         if(request.getParameter("first") != null){
            first_name = request.getParameter("first");
            }
          if(request.getParameter("middle") != null){
            middle_name = request.getParameter("middle");
            }
           if(request.getParameter("last") != null){
            last_name = request.getParameter("last");
            }
           if(request.getParameter("Email") != null){
            Email = request.getParameter("Email");
            }
           if(request.getParameter("Address") != null){
            Address = request.getParameter("Address");
            }
           if(request.getParameter("pass") != null){
            password = request.getParameter("pass");
            }
           if(request.getParameter("role") != null){
            user_role = request.getParameter("role");
            }
          
            Date date = new Date();
            Timestamp timestamp = new Timestamp(date.getTime());
            
            Users user = new Users();
            result = user.setUser(first_name, middle_name, last_name, Email, Address, password, user_role, timestamp);
            
            }
        %>
        
    <body onload = "displayResults()">
        <h1>User Registration Page</h1>
       
        <form name="regForm" action="regDemo.jsp" method="POST">
            <table border="0">
                <tbody>
                            <tr>
                                <td>First Name:</td>
                                <td><input type="text" name="first" value="" size="45" /></td>
                            </tr>
                            <tr>
                                <td>Middle Name:</td>
                                <td><input type="text" name="middle" value="" size="45" /></td>
                            </tr>
                            <tr>
                                <td>Last Name:</td>
                                <td><input type="text" name="last" value="" size="45" /></td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td><input type="text" name="Email" value="" size="45" /></td>
                            </tr>
                            <tr>
                                <td>Address:</td>
                                <td><input type="text" name="Address" value="" size="45" /></td>
                            </tr>
                            <tr>
                                <td>password:</td>
                                <td><input type="text" name="pass" value="" size="45" /></td>
                            </tr>
                            <tr>
                                <td>User Role</td>
                                <td><input type="text" name="role" value="" size="45" /></td>
                            </tr>
                </tbody>
            </table>
            <input type="hidden" name="hidden" value="<%= result%>" />
            <input type="submit" value="Submit" name="submit" />
            <input type="reset" value="Clear" name="clear" />
        </form>
            <SCRIPT LANGUAGE ="JavaScript">
            <!-- 
            function displayResults()
            {
              if(document.regForm.hidden.value == 1){
                alert ("data inserted!");
               }
               else{
                alert ("data not inserted");
               }
           }
           // -->
            </SCRIPT>
    </body>
    <%
           response.setHeader("Cache-Control", "no-cache, no-store" ); 
           String Email = request.getParameter("email");
           String Password = encrypt.passwordHash(request.getParameter("password"));
           session.setAttribute("email", Email);
                int flag = 0;
              try {
              // Database connection
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();
                   ResultSet rs = stmt.executeQuery("SELECT * FROM registered_user where user_role = 'Hr'");
                while(rs.next())
                    {
              
                   if (Email.equals(rs.getString("Email")) && Password.equals(rs.getString("Password")))
                        {
                                flag = 1;
                               break;
                         }
                    }
                 if (flag == 1)
                    {
                      response.sendRedirect("hrHome.jsp");
                     
                    } 
                 /* else{
                        response.sendRedirect("hr.jsp");
                         }*/
                         
                 }   
                 catch(Exception e){
                        e.printStackTrace();
                    }
              try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();    
                   ResultSet rs1 = stmt.executeQuery("SELECT * FROM registered_user where user_role = 'Admin'");
                while(rs1.next())
                    {
              
                   if (Email.equals(rs1.getString("Email")) && Password.equals(rs1.getString("Password")))
                        {
                                flag = 1;
                               break;
                         }
                    }
                 if (flag == 1)
                    {
                      response.sendRedirect("admin.jsp");
                    } 
               /* else{
                        response.sendRedirect("hr.jsp");
                         }*/
                         
                }
               catch(Exception e){
                        e.printStackTrace();
                    } 
                 try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();
                   ResultSet rs2 = stmt.executeQuery("SELECT * FROM registered_user where user_role = 'Applicant' ");
                while(rs2.next())
                    {
              
                   if (Email.equals(rs2.getString("Email")) && Password.equals(rs2.getString("Password")))
                        {
                                flag = 1;
                               break;
                         }
                    }
                 if (flag == 1)
                    {
                      response.sendRedirect("aplcntHome.jsp");
                    }
                  /* else{
                        response.sendRedirect("hr.jsp");
                         }*/
                 
                 }   
                 catch(Exception e){
                        e.printStackTrace();
                    }
        %>
</html>
