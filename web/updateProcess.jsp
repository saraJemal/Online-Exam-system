<%-- 
    Document   : updateProcess
    Created on : 19 Aug 2024, 15:20:48
    Author     : new
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Question</title>
    </head>
    <body>
        <h1>Update Question</h1>
       
        
       <%
           String Id = request.getParameter("id");
           String Question = request.getParameter("question");
           String Option1 = request.getParameter("option1");
           String Option2 = request.getParameter("option2");
           String Option3 = request.getParameter("option3");
           String Option4 = request.getParameter("option4");
           String Answer = request.getParameter("answer");
           try
           {
            Class.forName("com.mysql.cj.jdbc.Driver");   
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
            PreparedStatement pst = con.prepareStatement("UPDATE question_table SET question = '"+Question+"', option1 = '"+Option1+"', option2 = '"+Option2+"', option3 = '"+Option3+"', option4 = '"+Option4+"', answer = '"+Answer+"' WHERE Q_Id = '"+Id+"'");
            int i = pst.executeUpdate();
            out.println("The record is successfully updated");
            con.close();
           }
           catch(Exception e){
           System.out.print(e);
           e.printStackTrace();
            }
       %>
    </body>
</html>
