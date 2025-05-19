<%-- 
    Document   : searchById
    Created on : 17 Sept 2024, 21:34:29
    Author     : new
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Selected Questions</title>
    </head>
    <body>
        <h1>View Selected Questions</h1>
        <%
         String Id = request.getParameter("id");
         ResultSet rs = null;
        try{
             Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();
                    rs = stmt.executeQuery("SELECT* FROM question_table WHERE Q_Id >= '"+Id+"'");
            }
         catch(Exception e){
                e.printStackTrace();
            }
         
         %>
          <table border="1">
            <tbody>
                <tr>
                    <td>Q_Id</td>
                    <td>Question</td>
                    <td>Option1</td>
                    <td>Option2</td>
                    <td>Option3</td>
                    <td>Option4</td>
                    <td>Answer</td>
                </tr>
                <% while(rs.next()){%>
                <tr>
                    <td><%= rs.getInt("Q_Id")%></td>
                    <td><%= rs.getString("question")%></td>
                    <td><%= rs.getString("option1")%></td>
                    <td><%= rs.getString("option2")%></td>
                    <td><%= rs.getString("option3")%></td>
                    <td><%= rs.getString("option4")%></td>
                    <td><%= rs.getString("answer")%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
