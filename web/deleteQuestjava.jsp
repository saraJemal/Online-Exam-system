<%-- 
    Document   : deleteQuestjava
    Created on : 20 Aug 2024, 17:44:14
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
        <h1>Delete Question</h1>
        <%!
            public class searchQuestion{
            
                Connection con = null;
                PreparedStatement pst = null;
                ResultSet resultSet = null;
                
                public searchQuestion(){
                    try {
                     Class.forName("com.mysql.cj.jdbc.Driver");   
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                    pst = con.prepareStatement("select * from question_table where Q_Id = ?");
                               
                     }
                    catch(Exception e){
                        e.printStackTrace();
                    }
                }
                public ResultSet getQuestion(String id){ 
                try {  
                    pst.setString(1, id);
                   resultSet = pst.executeQuery();
                }catch (SQLException e){
                    e.printStackTrace();
                }             
                return resultSet;
               }
            }
        %>
        <%
            
            String Id = new String();
            if(request.getParameter("id") != null){
             Id = request.getParameter("id");
        }
        searchQuestion questn = new searchQuestion();
        ResultSet set = questn.getQuestion(Id);
        %>
         <form name="upform" action="deleteQuestjava.jsp" method="POST">
            <table border="0">
                
                <tbody>
                    <tr>
                        <td>Question ID: </td>
                        <td><input type="text" name="id" value="" size="10px" /></td>
                    </tr>
                    
                </tbody>
            </table>
            <input type="submit" value="Search" name="search" />
        </form>
    </body>
        <form name="delform" action="deleteQuest.jsp" method="POST">
        
            
   <p> <% while(set.next()){%> 
        Question ID:<input type="text" name="id" value="<%= set.getString("Q_Id")%>" size="10px" /> <br><br> 
        Question: <input type="text" name="question" value="<%= set.getString("question")%>" size="50px" /> <br><br>
        
        Option 1: <input type="text" name="option1" value="<%= set.getString("option1")%>" size="50px" /> <br><br>
        
        Option 2: <input type="text" name="option2" value="<%= set.getString("option2")%>" size="50px" /> <br><br>
        
        Option 3: <input type="text" name="option3" value="<%= set.getString("option3")%>" size="50px" /> <br><br>
        
        Option 4: <input type="text" name="option4" value="<%= set.getString("option4")%>" size="50px" /> <br><br>
        
        Answer: <input type="text" name="answer" value="<%= set.getString("answer")%>" size="50px" /> <br>
    <%}%>
   </p>
   <br>                                  
            <input type="submit" value="Delete" name="delete" />
        </form>
    </body>
</html>
