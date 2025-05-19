<%-- 
    Document   : addQuestionjava
    Created on : 18 Aug 2024, 12:16:02
    Author     : new
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%!
        public class addQuestion{
            Connection con = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            public addQuestion(){
                try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                 stmt = con.prepareStatement("select Q_Id from question_table");
                
                }
               catch(Exception e){
                    e.printStackTrace();
                  }
            }
             public ResultSet getAddQuestions(){
              try{
                  rs = stmt.executeQuery();
               
                }
              catch(Exception e){
                e.printStackTrace();
                }
                return rs;
            }
            
        }
    %>
    <%
        addQuestion add = new addQuestion();
        ResultSet set = add.getAddQuestions();
        
    %>
    </body>
    <table border="0">
            <tbody>
                <tr>
                    <td>Question ID</td>
                    <td>Question</td>
                    <td>Option 1</td>
                    <td>Option 2</td>
                    <td>Option 3</td>
                    <td>Option 4</td>
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
</html>
 <%
           /* public class Exam{
                Connection con = null;
                PreparedStatement pst = null;
                ResultSet resultSet = null;
                public String questionId="1";
                public String answer;
                
                
                public Exam(){
                
                    try {
                     Class.forName("com.mysql.cj.jdbc.Driver");   
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                    pst = con.prepareStatement("select * from question_table");
                                
                     }
                    catch(Exception e){
                        e.printStackTrace();
                    }
                }
                public ResultSet getExam(){ 
                try {  
                   resultSet = pst.executeQuery();
                }catch (SQLException e){
                    e.printStackTrace();
                }             
                return resultSet;
               }
            }*/     
            
        %>
      
       <%   
         /*  Date date = new Date();
           SimpleDateFormat sform = new SimpleDateFormat("dd/MM/yyyy");
            
        
        Exam questn = new Exam();
        ResultSet set = questn.getExam();*/
        
       %>
       <a href="Exam.jsp"><input type="submit" value="Next" name="next" /><a/>