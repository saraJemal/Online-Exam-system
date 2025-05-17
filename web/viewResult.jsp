<%-- 
    Document   : viewResult
    Created on : 15 Aug 2024, 18:10:24
    Author     : new
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Applicants Result</title>
         <style>
            body{
                margin: 0;
                padding: 0;
            }
            h1{
                 background-color: lightblue;
                margin:0;
                margin-bottom: 20px;
                padding: 5px 0;
                display:flex;
                border-radius: 10px;
                vertical-align: middle;
                box-shadow: 0 10px 30px darkblue;
                align-items: center;
                position: relative;
            }
            h1 p{
                margin-left: 20px;
                margin-right: 200px;
            }
            .serch{
                position: relative;
                display: flex;
            }
            input[type = text]{
                font-size: 16px;
                padding: 5px;
                margin-right: 10px;
            }
            
            input[type=submit]{
                font-size: 16px;
                padding: 5px;
                padding-top: 15px;
                width: 60px;
                border: none;
            }
            .image img{
                margin-left: -60px;
                width: 15px;
                
            }
            a{
                position: absolute;
                margin-left: 1000px; 
                text-decoration: none;
            }
            .imge img{
                width:40px;
            }
            .name{
                font-size: 20px;
                color: black;
                
            }
            table{
                margin-left: 100px;
                margin-top: 30px;
                
            }
        </style>
    </head>
    <body>
        
         <%!
            public class viewResult{
            
                Connection con = null;
                PreparedStatement pst = null;
                ResultSet resultSet = null;
                
                public viewResult(){
                    try {
                     Class.forName("com.mysql.cj.jdbc.Driver");   
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                    pst = con.prepareStatement("select first_name, middle_name, last_name, Email, phone, Address, obtained_marks from registered_user where user_role = 'Applicant'");
                                
                     }
                    catch(Exception e){
                        e.printStackTrace();
                    }
                }
                public ResultSet getResult(){ 
                try {  
                   resultSet = pst.executeQuery();
                }catch (Exception e){
                    e.printStackTrace();
                }             
                return resultSet;
               }
            }
        %>
        <%
            
        viewResult questn = new viewResult();
        ResultSet set = questn.getResult();
        %>
        <h1> <p>View Results</p>
           <form name="upform" action="searchByResults.jsp" method="POST">  
              <div class="serch">
                <input type="text" name="marks" value="" size="10px"/>
                <div class="image"> 
                <input type="submit" value="" name="search"/>
                <img src="Images/search.png">
               </div>
            </div>
         </form>
            <a href="index.jsp">
                    <div class="imge">
                        <img src="Images/Logout.png">
                    </div>
                    <div class="name" data-text="Logout"> Logout</div>
                </a> 
        </h1>
       
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
                <% while(set.next()){%>
                <tr>
                    <td><%= set.getString("first_name")%></td>
                    <td><%= set.getString("middle_name")%></td>
                    <td><%= set.getString("last_name")%></td>
                    <td><%= set.getString("Email")%></td>
                    <td><%= set.getString("phone")%></td>
                    <td><%= set.getString("Address")%></td>
                    <td><%= set.getInt("obtained_marks")%></td>
                </tr>
                <%}%>
            </tbody>
        </table>

        
    </body>
</html>
