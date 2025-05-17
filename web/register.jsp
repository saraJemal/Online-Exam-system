<%-- 
    Document   : register
    Created on : 5 Aug 2024, 18:43:46
    Author     : new
--%>



<%Class.forName("com.mysql.cj.jdbc.Driver");%>
<%@page import="newpackage.encrypt"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration Page </title>
        <style>
         
                h1{
               /*  background-color: #5c755e;
                 padding: 20px;
                 margin: 0px;
                 text-align: center;*/
            }
             body{
                padding: 0;
                margin: 0; 
               /* background-image: url("Images/ad_back.jpg");*/
                background-repeat: no-repeat;
                background-size: cover; 
                height: 100vh;
                font-family: verdana, Arial, Geneva, Arial Black;
               
                font-weight: normal; 
               
            }
             h1{
                 /*background-color: #742e08;*/
                /* background-color:#ffcf79;*/
                background-color: lightslategray;
                 padding: 0px;
                 margin: 0px;
                 text-align: center;
                 box-shadow: 0 15px 20px darkblue;
                
                 font-size: 20px;
                 display: flex;
             }
            
              table{
                background-color: #d3d3d3;
                padding: 20px;
                width: 600px;
                margin-top: 20px;
                margin-left: 380px;
                height: 40px;
                 font-size: 16px;
                 font-weight: bold;
                line-height:40px;
                color: black;
                border:solid 2px lightslategray;
                border-radius: 10px;
            }
            input{
                width: 100%;
                padding: 5px;
               
               
            }
            input[type=submit]{
               width: 15%;
               margin-left: 450px;
               background-color: lightslategray;
               color: black;
               font-size: 20px;
               border: none;
               border-radius: 10px;
               padding: 5px;
            }
            input[type=reset]{
                 width: 15%;
               margin-left: 50px;
               background-color: lightslategray;
               color: black;
               font-size: 20px;
               border: none;
               border-radius: 10px;
               padding: 5px;
            }
             a{
               
                margin-left: 500px; 
                text-decoration: none;
                .image {
                    margin-top: 5px;
                }
            }
             img{
                width:30px;
            }
            h1 p{
                margin-left: 100px;
            }
             .name{
                font-size: 15px;
                color: black;
             }
        </style>
           
    </head>
    <body >
        <h1> <p>User Registration Page</p>
            <a href="admin.jsp">
                    <div class="image">
                        <img src="Images/Logout.png">
                    </div>
                    <div class="name" data-text="Logout"> Logout</div>
                </a>
        </h1>
        <%!
            public class Users{
            
                Connection con = null;
                PreparedStatement pst = null;
                
                
                public Users(){
                    try {
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                    pst = con.prepareStatement("INSERT INTO registered_user (first_name, middle_name, last_name, Email, phone, Address, password,user_role, obtained_marks, registered_date)" 
                                + "values (?,?,?,?,?,?,?,?,?,?)");
                                
                     }
                    catch(SQLException e){
                        e.printStackTrace();
                    }
                }
                public int setUser(String first, String middle, String last, String Email, String phone, String Address, String pass, String role, String obtained_marks, Timestamp timeStamp){
                int result = 0;
                try {    
                   pst.setString(1, first);
                   pst.setString(2, middle);
                   pst.setString(3, last);
                   pst.setString(4, Email);
                   pst.setString(5, phone);
                   pst.setString(6, Address);
                   pst.setString(7, pass);
                   pst.setString(8, role);
                   pst.setString(9, "0");
                   pst.setTimestamp(10, timeStamp);
                   result = pst.executeUpdate();
             
                }catch (SQLException e){
                System.out.print(e);
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
         String phone = new String();
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
           if(request.getParameter("phone") != null){
            phone = request.getParameter("phone"); 
            }
           if(request.getParameter("Address") != null){
            Address = request.getParameter("Address");
            }
           if(request.getParameter("pass") != null){
            password = encrypt.passwordHash(request.getParameter("pass"));
            }
           if(request.getParameter("role") != null){
            user_role = request.getParameter("role");
            }
            
          
            Date date = new Date();
            Timestamp timestamp = new Timestamp(date.getTime());
            
            Users user = new Users();
            result = user.setUser(first_name, middle_name, last_name, Email, phone, Address, password, user_role, "0", timestamp);
             if(result == 1){
            out.println("The record is successfully saved");
            }else{
             out.println("The record is not saved"); 
                }
            }
        %>
       
        <form name="regForm" action="register.jsp" method="POST">
            <table border="0">
                <tbody>
                            <tr>
                                <td>First Name:</td>
                                <td><input type="text" name="first" value="" size="45" required /></td>
                            </tr>
                            <tr>
                                <td>Middle Name:</td>
                                <td><input type="text" name="middle" value="" size="45" required /></td>
                            </tr>
                            <tr>
                                <td>Last Name:</td>
                                <td><input type="text" name="last" value="" size="45" required /></td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td><input type="text" name="Email" value="" size="45" required  /></td>
                            </tr>
                            <tr>
                                <td>Phone Number:</td>
                                <td><input type="text" name="phone" value="" size="45" required /></td>
                            </tr>
                            <tr>
                                <td>Address:</td>
                                <td><input type="text" name="Address" value="" size="45" required /></td>
                            </tr>
                            <tr>
                                <td>password:</td>
                                <td><input type="text" name="pass" value="" size="45" required /></td>
                            </tr>
                            <tr>
                                <td>User Role</td>
                                <td><input type="text" name="role" value="" size="45" required /></td>
                            </tr>
                </tbody>
            </table>
            <input type="hidden" name="hidden" value="<%= result%>" />
            <input type="submit" value="Submit" name="submit" />
            <input type="reset" value="Clear" name="clear" />
        </form>
    </body>
</html>
