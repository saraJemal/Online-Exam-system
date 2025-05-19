<%-- 
    Document   : deleteQuest
    Created on : 15 Aug 2024, 18:09:36
    Author     : new
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Question</title>
    </head>
    <body>
        <h1>Delete Question
            <a href="index.jsp">
                    <div class="image">
                        <img src="Images/Logout.png">
                    </div>
                    <div class="name" data-text="Logout"> Logout</div>
                </a>
        </h1>
        <%
            String Id = request.getParameter("id");
            try
           {
            Class.forName("com.mysql.cj.jdbc.Driver");   
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
            PreparedStatement pst = con.prepareStatement("DELETE FROM question_table WHERE Q_Id = '"+Id+"'");
                    int i = pst.executeUpdate();
             if(i == 1){
            out.println("The record is successfully deleted");
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
