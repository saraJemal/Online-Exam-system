<%-- 
    Document   : hrjava
    Created on : 8 Aug 2024, 11:39:02
    Author     : new
--%>
<%@page import="newpackage.encrypt"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome to HR login page</title>
    </head>
    <body>
        <h1>welcome to HR login page</h1>
        <%
          response.setHeader("Cache-Control", "no-cache, no-store" ); 
           String Email = request.getParameter("email");
           String Password = encrypt.passwordHash(request.getParameter("password"));
           session.setAttribute("email", Email);
           boolean alreadyAttempted = false;
                int flag = 0;
                if (Email != null && Password != null){
              try {
              // Database connection
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();
                   // check if hr email exists and password matches
                   ResultSet rs = stmt.executeQuery("SELECT * FROM registered_user where user_role = 'Hr'");
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
                      response.sendRedirect("hrHome.jsp");
                      
                    }
                    // check if admin email exists and password matches
                 ResultSet rs1 = stmt.executeQuery("SELECT * FROM registered_user where user_role = 'Admin'");
                while(rs1.next())
                    {
              
                   if (Email.equals(rs1.getString("Email")) && Password.equals(rs1.getString("Password")))
                        {
                                flag = 1;
                               break;
                         }
                    }
                 if (flag == 1)
                    {
                      response.sendRedirect("admin.jsp");
                    }
                   
                    // check if applicant email exists and password matches
                  ResultSet rs2 = stmt.executeQuery("SELECT * FROM registered_user where user_role = 'Applicant' ");
                while(rs2.next())
                    {
              
                   if (Email.equals(rs2.getString("Email")) && Password.equals(rs2.getString("Password")))
                        {
                                flag = 1;
                               break;
                         }
                    }
                 if (flag == 1)
                    {
                    
                // Check if user has already attempted the exam
                  ResultSet rs3 = stmt.executeQuery("SELECT attempted FROM registered_user where Email = '"+Email+"' ");
                 if (rs3.next()) {
                    alreadyAttempted = rs3.getBoolean("attempted");
                  }

                  if (alreadyAttempted) {
                      out.println("<script>alert('You have already attempted the exam.'); window.location='index.jsp';</script>");
                  } else {

                    // Mark exam as attempted
                    int i = 0;
                    response.sendRedirect("aplcntHome.jsp");
                     i = stmt.executeUpdate("UPDATE registered_user SET attempted=1 WHERE Email = '"+Email+"' ");
                    
                   }
                    
                   }
              else{
                  //response.sendRedirect("hr.jsp");
                  out.println("<script>alert('Invalid credentials!'); window.location='hr.jsp';</script>");
                    }  
                 }
          catch(Exception e){
                e.printStackTrace();
                out.println("<script>alert('Invalid credentials!'); window.location='index.jsp';</script>");
                    }
            } 
        %>
        <%
            /*
           response.setHeader("Cache-Control", "no-cache, no-store" ); 
           String Email = request.getParameter("email");
           String Password = encrypt.passwordHash(request.getParameter("password"));
           session.setAttribute("email", Email);
                int flag = 0;
              try {
              // Database connection
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();
                   ResultSet rs = stmt.executeQuery("SELECT * FROM registered_user where user_role = 'Hr'");
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
                      response.sendRedirect("hrHome.jsp");
                     
                    } 
                 /* else{
                        response.sendRedirect("hr.jsp");
                         }
                         
                 }   
                 catch(Exception e){
                        e.printStackTrace();
                    }
              try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();    
                   ResultSet rs1 = stmt.executeQuery("SELECT * FROM registered_user where user_role = 'Admin'");
                while(rs1.next())
                    {
              
                   if (Email.equals(rs1.getString("Email")) && Password.equals(rs1.getString("Password")))
                        {
                                flag = 1;
                               break;
                         }
                    }
                 if (flag == 1)
                    {
                      response.sendRedirect("admin.jsp");
                    } 
               /* else{
                        response.sendRedirect("hr.jsp");
                         }
                         
                }
               catch(Exception e){
                        e.printStackTrace();
                    } 
                 try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();
                   ResultSet rs2 = stmt.executeQuery("SELECT * FROM registered_user where user_role = 'Applicant' ");
                while(rs2.next())
                    {
              
                   if (Email.equals(rs2.getString("Email")) && Password.equals(rs2.getString("Password")))
                        {
                                flag = 1;
                               break;
                         }
                    }
                 if (flag == 1)
                    {
                      response.sendRedirect("aplcntHome.jsp");
                    }
                  /* else{
                        response.sendRedirect("hr.jsp");
                         }
                 
                 }   
                 catch(Exception e){
                        e.printStackTrace();
                    }
             */
        %>
    </body>
</html>
