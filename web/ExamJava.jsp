<%-- 
    Document   : ExamJava
    Created on : 10 Sept 2024, 22:32:03
    Author     : new
--%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Java</title>
        <style>
            body{
                margin: 0;
                padding: 0;
                font-family: verdana, Arial, Geneva, Arial Black;
                font-size: 20px;
                font-weight: normal; 
                background-color: #ffcf79; 
            }
            .cont{
                
                margin: 20px;
                padding: 10px;
                justify-items: center;
                background-image: url("Images/pages background.jpg");
                
                
            }
            h1{
         
                color: white;
              width: 800px;
            }
            #btn{
               margin-top: 20px;
               border-radius: 5px;
               padding: 5px;
               background-color: #742e08;
               
            }
            a{
               text-align: center;
               color: white;
               text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="cont">
        <h1> The Result You Have Scored</h1>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store" );
            
            ResultSet rs = null;
            String paramName, paramValue[];    
            int marks = 0;
            String ans = null;
            Enumeration paramNames = request.getParameterNames();
            ResultSet set = null;
            
        try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement st = con.createStatement();
                   set = st.executeQuery("select* from question_table");
                   
                }
            catch(Exception e){
                 e.printStackTrace();
                   } 
               ResultSet rs1 = null;
         int size = 1;   
             try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();
                   rs1 = stmt.executeQuery("select count(Q_Id)from question_table");
                if(rs1.next())
                    {
                      size = rs1.getInt(1); 
                    }
                    
                  }
                catch(Exception e){
                    e.printStackTrace();
            }
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                Statement stmt = con.createStatement();
                 rs = stmt.executeQuery("select* from question_table");
                 while(rs.next() && paramNames.hasMoreElements()){
                    String un = rs.getString("answer");
                    paramName = (String)paramNames.nextElement();
                    paramValue = request.getParameterValues(paramName);
                  
                    for(int i=0;i< paramValue.length; i++){
                          ans = paramValue[i];
                        }
                    
                      if (un.equals(ans) && set.next()){
                        out.println("Your answer for question No. "+set.getInt(1)+". is correct!<br/>");
                         marks++;
                         }   
                     else if(!un.equals(ans) && set.next()){
                      out.println("The correct answer for question No. "+set.getInt(1)+". is "+un+" <br/>");
                        }
                    }
                 
              }
            catch(Exception e){
            e.printStackTrace();
            out.println("Sorry! Try Again");
            }
           
            String Email = session.getAttribute("email").toString();
            String marks1 = String.valueOf(marks);
            
            int i = 0;
           try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                Statement stmt = con.createStatement();
                  i = stmt.executeUpdate("update registered_user set obtained_marks = '"+marks+"' where Email = '"+Email+"'");
                  out.println( " You Have Scored "+marks1+" out of "+size+"</br>");
                  /*if(i == 1){
            out.println("The record is successfully saved");
           
            }else{
             out.println("The record is not saved"); 
                }*/
                 
            } 
          catch(Exception e){
            e.printStackTrace();
            }
            
        %>
        <div id ="btn"> <a href="index.jsp">Logout </a>
        <% session.invalidate();%>
         </div>
        </div>
         
    </body>
</html>
