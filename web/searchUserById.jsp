<%-- 
    Document   : searchUserById
    Created on : 19 Sept 2024, 18:32:47
    Author     : new
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selected User</title>
    </head>
    <body>
        <h1>Selected User</h1>
        <%
             String Id = request.getParameter("id");
             ResultSet rs = null;
               
        try{
             Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM registered_user WHERE user_Id >= '"+Id+"'");
            }
         catch(Exception e){
                e.printStackTrace();
            }
        %>
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
