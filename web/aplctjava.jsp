<%-- 
    Document   : aplctjava
    Created on : 8 Aug 2024, 17:52:52
    Author     : new
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome to Applicant login page</title>
    </head>
    <body>
        <h1>welcome to Applicant login page</h1>
        <%
           String Email = request.getParameter("email");
           String Password = request.getParameter("password");
           session.setAttribute("email", Email);
                int flag = 0;
              try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();
                   ResultSet rs = stmt.executeQuery("SELECT * FROM registered_user");
                while(rs.next())
                    {
              
                   if (Email.equals(rs.getString("Email")) && Password.equals(rs.getString("Password")))
                        {
                                flag = 1;
                               break;
                         }
                    }
                 if (flag == 1)
                    {
                      response.sendRedirect("Exam.jsp");
                    } 
                  else if(flag != 1) {
                       response.sendRedirect("aplcntHome.jsp");
                     }
                     con.close();
                 }   
                 catch(SQLException e){
                        e.printStackTrace();
                    }
                
        %>
    </body>
</html>
