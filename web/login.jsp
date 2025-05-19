<%-- 
    Document   : login
    Created on : 7 Aug 2024, 19:49:40
    Author     : new
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Exam login Page</title>
    </head>
    <body>
        <h1>Online Exam login Page</h1>
        <% 
               String email = request.getParameter("Email");
               String password = request.getParameter("Password");
               String role = request.getParameter("role");
               
               if(email.equals("admin@gmail.com") && password.equals("123admin")&& role.equals("Admin")){
                    response.sendRedirect("admin.jsp");
               }
               else if(email.equals("hr@gmail.com") && password.equals("123hr")&& role.equals("HR")){
                    response.sendRedirect("hr.jsp");
               }
               else if(email.equals("aplcnt@gmail.com") && password.equals("123aplcnt")&& role.equals("Applicant")){
                    response.sendRedirect("aplcntHome.jsp");
               }
               else{
                response.sendRedirect("index.jsp");
               }
           %>
    </body>
</html>
