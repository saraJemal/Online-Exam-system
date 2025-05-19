<%-- 
    Document   : admin
    Created on : 7 Aug 2024, 19:35:16
    Author     : new
--%>
<%@page import="java.util.Date"%>
<%Class.forName("com.mysql.cj.jdbc.Driver");%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Admin Home Page</title>
        <style>
             body{
                padding: 0;
                margin: 0; 
                background-image: url("Images/ad_back.jpg");
                background-repeat: no-repeat;
                background-size: cover; 
                height: 100vh;
                font-family: verdana, Arial, Geneva, Arial Black;
               
                font-weight: normal; 
               
            }
             h1{
                 /*background-color: #742e08;*/
                 background-color:#ffcf79;
                 padding: 5px;
                 margin: 0px;
                 text-align: center;
                 box-shadow: 0 10px 30px darkblue;
                 font-size: 25px;
             }
             ul {
                 background-color: #2C8f77;
                 width: 250px;
                 height: 100vh;
                 position: absolute;
                 font-size: 25px;
                 margin:0;
                 padding: 0;
                 list-style: none;
                
                
             }
             a{
                 text-decoration: none;
                 font-family: Georgia, "Times New Roman", Times, serif;
                 background-color: #5c755e;
                 color: white;
                 display: block;
                 width: 150px;
                 margin: 10px;
                 padding: 10px;
                 border: 1px solid blue;
                 border-radius: 10px;
                 box-shadow: 0 10px 30px darkblue;
                 text-align: center;
                 height: 30px;
                 line-height: 30px;
             }
             a:hover{
                 background-color: #d3d3d3;
                 color: black;
             }
              
        </style>
    </head>
    <body>
        
        <h1>Welcome to Admin Home Page</h1>
        <ul>
            <li> <a href="register.jsp"> Add Users</a></li>
            <li> <a href="viewUsers.jsp"> View Users</a></li>
            <li> <a href="editUsers.jsp"> Edit Users</a></li>
            <li> <a href="deleteUsers.jsp"> Delete User</a></li>
            <li> <a href="hr.jsp"> Logout</a></li>
        </ul>
          
    </body>
</html>
