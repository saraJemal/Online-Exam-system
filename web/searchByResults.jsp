<%-- 
    Document   : searchByResults
    Created on : 17 Sept 2024, 23:16:52
    Author     : new
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> View Selected Applicants Results</title>
    </head>
    <body>
        <h1>View Selected Applicants Results</h1>
        <%
        String Marks = request.getParameter("marks");
        ResultSet rs = null;
         try{
             Class.forName("com.mysql.cj.jdbc.Driver");   
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
              PreparedStatement pst = con.prepareStatement("select first_name, middle_name, last_name, Email, phone, Address, obtained_marks from registered_user where user_role = 'Applicant' And obtained_marks >= '"+Marks+"'");
              rs = pst.executeQuery(); 
         }
         catch(Exception e){
         e.printStackTrace();
         
         }
         %>
          <table border="1">
            <tbody>
                <tr>
                    <td>first_name</td>
                    <td>middle_name</td>
                    <td>last_name</td>
                    <td>Email</td>
                    <td>phone</td>
                    <td>Address</td>
                    <td>obtained_marks</td>
                </tr>
                <% while(rs.next()){%>
                <tr>
                    <td><%= rs.getString("first_name")%></td>
                    <td><%= rs.getString("middle_name")%></td>
                    <td><%= rs.getString("last_name")%></td>
                    <td><%= rs.getString("Email")%></td>
                    <td><%= rs.getString("phone")%></td>
                    <td><%= rs.getString("Address")%></td>
                    <td><%= rs.getInt("obtained_marks")%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
