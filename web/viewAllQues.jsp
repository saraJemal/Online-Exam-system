<%-- 
    Document   : viewAllQues
    Created on : 15 Aug 2024, 18:09:09
    Author     : new
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Question</title>
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
        </style>
    </head>
    <body>
        
         <%!
            public class viewQuestion{
            
                Connection con = null;
                PreparedStatement pst = null;
                ResultSet resultSet = null;
                
                public viewQuestion(){
                    try {
                     Class.forName("com.mysql.cj.jdbc.Driver");   
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                    pst = con.prepareStatement("select * from question_table");
                                
                     }
                    catch(Exception e){
                        e.printStackTrace();
                    }
                }
                public ResultSet getQuestion(){ 
                try {  
                   resultSet = pst.executeQuery();
                }catch (SQLException e){
                    e.printStackTrace();
                }             
                return resultSet;
               }
            }
        %>
        <%
            
        viewQuestion questn = new viewQuestion();
        ResultSet set = questn.getQuestion();
        %>
        
            <h1><p>View Questions</p>
          <form name="upform" action="searchById.jsp" method="POST">  
              <div class="serch">
                <input type="text" name="id" value="" size="10px"/>
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
                    <td>Q_Id</td>
                    <td>Question</td>
                    <td>Option1</td>
                    <td>Option2</td>
                    <td>Option3</td>
                    <td>Option4</td>
                    <td>Answer</td>
                </tr>
                <% while(set.next()){%>
                <tr>
                    <td><%= set.getInt("Q_Id")%></td>
                    <td><%= set.getString("question")%></td>
                    <td><%= set.getString("option1")%></td>
                    <td><%= set.getString("option2")%></td>
                    <td><%= set.getString("option3")%></td>
                    <td><%= set.getString("option4")%></td>
                    <td><%= set.getString("answer")%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
           
       
    </body>
</html>
