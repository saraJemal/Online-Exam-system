<%-- 
    Document   : editUserJava
    Created on : 19 Sept 2024, 20:41:43
    Author     : new
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
    </head>
    <body>
        <h1>Edit User</h1>
          <%
           String Id = request.getParameter("id");
           String first_name = request.getParameter("first_name");
           String middle_name = request.getParameter("middle_name");
           String last_name = request.getParameter("last_name");
           String Email = request.getParameter("Email");
           String phone = request.getParameter("phone");
           String Address = request.getParameter("Address");
           String password = request.getParameter("password");
           String Role = request.getParameter("user_role");
           String Marks = request.getParameter("obtained_marks");
           try
           {
            Class.forName("com.mysql.cj.jdbc.Driver");   
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
            PreparedStatement pst = con.prepareStatement("update registered_user set first_name = '"+first_name+"', middle_name = '"+middle_name+"', last_name = '"+last_name+"', Email = '"+Email+"', phone = '"+phone+"', Address = '"+Address+"', password = '"+password+"', user_role = '"+Role+"',obtained_marks = '"+Marks+"' WHERE user_Id = '"+Id+"'");
            int i = pst.executeUpdate();
            out.println("The User is successfully updated");
            con.close();
           }
           catch(Exception e){
           System.out.print(e);
           e.printStackTrace();
            }
       %>
    </body>
</html>
