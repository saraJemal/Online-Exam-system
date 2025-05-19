<%-- 
    Document   : viewUsers
    Created on : 19 Sept 2024, 15:18:13
    Author     : new
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Registered Users</title>
         <style>
            body{
                margin: 0;
                padding: 0;
            }
            h1{
                 background-color: lightblue;
                margin:0;
                margin-bottom: 20px;
                padding: 5px 0;
                display:flex;
                border-radius: 10px;
                vertical-align: middle;
                box-shadow: 0 10px 30px darkblue;
                align-items: center;
                position: relative;
            }
            h1 p{
                margin-left: 20px;
                margin-right: 200px;
            }
            .serch{
                position: relative;
                display: flex;
            }
            input[type = text]{
                font-size: 16px;
                padding: 5px;
                margin-right: 10px;
            }
            
            input[type=submit]{
                font-size: 16px;
                padding: 5px;
                padding-top: 15px;
                width: 60px;
                border: none;
            }
            .image img{
                margin-left: -60px;
                width: 15px;
                
            }
            a{
                position: absolute;
                margin-left: 1000px; 
                text-decoration: none;
            }
            .imge img{
                width:40px;
            }
            .name{
                font-size: 20px;
                color: black;
                
            }
        </style>
    </head>
    <body>
       
        <%
           ResultSet rs = null; 
            try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();
                   rs = stmt.executeQuery("SELECT * FROM registered_user");
                }
                catch(Exception e){
                e.printStackTrace();
                
            }
        %>
        <h1><p>View Users</p>
        <form name="upform" action="searchUserById.jsp" method="POST">  
              <div class="serch">
                <input type="text" name="id" value="" size="10px"/>
                <div class="image"> 
                <input type="submit" value="" name="search"/>
                <img src="Images/search.png">
               </div>
            </div>
         </form>
            <a href="admin.jsp">
                    <div class="imge">
                        <img src="Images/Logout.png">
                    </div>
                    <div class="name" data-text="Logout"> Logout</div>
                </a>
        </h1>
       
        
        <table border="1">
            <tbody>
                <tr>
                    <td>user_Id</td>
                    <td>first_name</td>
                    <td>middle_name</td>
                    <td>last_name</td>
                    <td>Email</td>
                    <td>phone</td>
                    <td>Address</td>
                    <td>password</td>
                    <td>user_role</td>
                    <td>obtained_marks</td>
                </tr>
                <% while(rs.next()){%>
                <tr>
                    <td><%= rs.getInt("user_Id")%></td>
                    <td><%= rs.getString("first_name")%></td>
                    <td><%= rs.getString("middle_name")%></td>
                    <td><%= rs.getString("last_name")%></td>
                    <td><%= rs.getString("Email")%></td>
                    <td><%= rs.getString("phone")%></td>
                    <td><%= rs.getString("Address")%></td>
                    <td><%= rs.getString("password")%></td>
                    <td><%= rs.getString("user_role")%></td>
                    <td><%= rs.getString("obtained_marks")%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
           
    </body>
</html>
