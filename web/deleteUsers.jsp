<%-- 
    Document   : deleteUsers
    Created on : 20 Sept 2024, 00:00:26
    Author     : new
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Users</title>
         <style>
             body{
                padding: 0;
                margin: 0; 
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
                color: white;
                 font-size: 20px;
                 display: flex;
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
                color: white;
             }
        </style>
    </head>
    <body>
        <h1> <p>Delete Users</p>
            <a href="admin.jsp">
                    <div class="image">
                        <img src="Images/Logout.png">
                    </div>
                    <div class="name" data-text="Logout"> Logout</div>
                </a>
        </h1>
         <%!
            public class searchUser{
            
                Connection con = null;
                PreparedStatement pst = null;
                ResultSet resultSet = null;
                
                public searchUser(){
                    try {
                     Class.forName("com.mysql.cj.jdbc.Driver");   
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                    pst = con.prepareStatement("SELECT * FROM registered_user where user_Id = ?");
                                
                     }
                    catch(Exception e){
                        e.printStackTrace();
                    }
                }
                public ResultSet getUser(String id){ 
                try {  
                    pst.setString(1, id);
                   resultSet = pst.executeQuery();
                }catch (SQLException e){
                    e.printStackTrace();
                }             
                return resultSet;
               }
            }
        %>
        <%
            
            String Id = new String();
            if(request.getParameter("id") != null){
             Id = request.getParameter("id");
        }
        searchUser questn = new searchUser();
        ResultSet set = questn.getUser(Id);
        %>
        
        <form name="Idform" action="deleteUsers.jsp" method="POST">
            <table border="0">
                
                <tbody>
                    <tr>
                        <td>User ID: </td>
                        <td><input type="text" name="id" value="" size="10px" /></td>
                    </tr>
                    
                </tbody>
            </table>
            <input type="submit" value="Search" name="search" />
            <input type="reset" value="Clear" name="clear" />
        </form>
    
        <form name="updUform" action="deleteUserJava.jsp" method="POST">
               
   <p> <% while(set.next()){%> 
        User ID:<input type="text" name="id" value="<%= set.getString("user_Id")%>" size="10px" /> <br><br> 
        
        First_name: <input type="text" name="first_name" value="<%= set.getString("first_name")%>" size="50px" /> <br><br>
        
        Middle_name: <input type="text" name="middle_name" value="<%= set.getString("middle_name")%>" size="50px" /> <br><br>
        
        Last_name: <input type="text" name="last_name" value="<%= set.getString("last_name")%>" size="50px" /> <br><br>
        
        Email: <input type="text" name="Email" value="<%= set.getString("Email")%>" size="50px" /> <br><br>
        
        Phone: <input type="text" name="phone" value="<%= set.getString("phone")%>" size="50px" /> <br><br>
        
        Address: <input type="text" name="Address" value="<%= set.getString("Address")%>" size="50px" /> <br><br>
        
        Password: <input type="text" name="password" value="<%= set.getString("password")%>" size="50px" /> <br><br>
        
        User_Role: <input type="text" name="user_role" value="<%= set.getString("user_role")%>" size="50px" /> <br><br>
        
       Obtained_marks: <input type="text" name="obtained_marks" value="<%= set.getString("obtained_marks")%>" size="50px" /> <br>
    <%}%>
   </p>
   <br>                                  
            <input type="submit" value="Delete" name="delete" />
            <input type="reset" value="Clear" name="clear" />
        </form>
    </body>
</html>
