<%-- 
    Document   : deleteUserJava
    Created on : 19 Sept 2024, 23:14:02
    Author     : new
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User</title>
    </head>
    <body>
        <h1>Delete User</h1>
        <%
            String Id = request.getParameter("id");
              try
           {
            Class.forName("com.mysql.cj.jdbc.Driver");   
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
            PreparedStatement pst = con.prepareStatement("DELETE FROM registered_user  WHERE user_Id = '"+Id+"'");
                    int i = pst.executeUpdate();
             if(i == 1){
            out.println("The record is successfully deleted");
            con.close();
            }else{
              out.println("The requested record is not found");      
                }
           }
           catch(Exception e){
           System.out.print(e);
           e.printStackTrace();
            }
        %>
    </body>
</html>
