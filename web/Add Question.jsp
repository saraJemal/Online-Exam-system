<%-- 
    Document   : Add Question
    Created on : 15 Aug 2024, 18:07:18
    Author     : new
--%>
 <%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Question</title>
    </head>
   
    <% 
           /* public class addQuestion{
            
                Connection con = null;
                PreparedStatement pst = null;
                
                
                public addQuestion(){
                    try {
                     Class.forName("com.mysql.cj.jdbc.Driver");   
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                    pst = con.prepareStatement("INSERT INTO question_table (Q_Id, question, option1, option2, option3, option4, answer)" 
                                + "values (?,?,?,?,?,?,?)");
                                
                     }
                    catch(Exception e){
                        e.printStackTrace();
                    }
                }
                public int setQuestion(int Q_Id,String question, String option1, String option2, String option3, String option4, String answer){
                int result = 0;
                try { 
                    
                   pst.setInt(1, Q_Id);
                   pst.setString(2, question);
                   pst.setString(3, option1);
                   pst.setString(4, option2);
                   pst.setString(5, option3);
                   pst.setString(6, option4);
                   pst.setString(7, answer);
                   result = pst.executeUpdate();
                }catch (SQLException e){
                    e.printStackTrace();
                }             
                return result;
               }
            }*/
        %>
        <%
          
             int Q_Id = 1;   
             try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();
                   ResultSet rs = stmt.executeQuery("select max(Q_Id)from question_table");
                if(rs.next())
                    {
                      Q_Id = rs.getInt(1);
                     Q_Id= Q_Id + 1;
                    }
                  }
            catch(Exception e){
                        e.printStackTrace();
                    }
             
            int i = 0;
        if (request.getParameter("submit") != null){
         String question = new String();
         String option1 = new String();
         String option2 = new String();
         String option3 = new String();
         String option4 = new String();
         String answer = new String();
    
         
         if(request.getParameter("question") != null){
            question = request.getParameter("question");
            }
          if(request.getParameter("option1") != null){
            option1 = request.getParameter("option1");
            }
           if(request.getParameter("option2") != null){
            option2 = request.getParameter("option2");
            }
           if(request.getParameter("option3") != null){
            option3 = request.getParameter("option3");
            }
           if(request.getParameter("option4") != null){
            option4 = request.getParameter("option4"); 
            }
           if(request.getParameter("answer") != null){
            answer = request.getParameter("answer");
            }
            try {
                     Class.forName("com.mysql.cj.jdbc.Driver");   
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   PreparedStatement pst = con.prepareStatement("INSERT INTO question_table (Q_Id, question, option1, option2, option3, option4, answer)" 
                                + "values (?,?,?,?,?,?,?)");
                                
                   pst.setInt(1, Q_Id);
                   pst.setString(2, question);
                   pst.setString(3, option1);
                   pst.setString(4, option2);
                   pst.setString(5, option3);
                   pst.setString(6, option4);
                   pst.setString(7, answer);
                  int result = pst.executeUpdate();
                  if(result == 1){
                     out.println("The question is successfully saved");
                     con.close();
                    }else{
                     out.println("The questio is not saved"); 
                        }
                  
             
                }catch (SQLException e){
                    e.printStackTrace();
                }             
            }
           
        %>
        
    <body>
        <h1>Add New Question</h1>
        <form name="QForm" action="Add Question.jsp" method="POST">
        
        <table border="0">          
            <tbody>
                
                <tr>
                    <td>Question ID: </td> 
                    
                    <td> 
                        <%= Q_Id%>
                    </td>
                </tr>
                <tr>
                    <td>Question: </td>
                    <td><input type="text" name="question" value="" size="50px" required /></td>
                </tr>
                <tr>
                    <td>Option 1:</td>
                    <td><input type="text" name="option1" value="" size="50px" required /></td>
                </tr>
                <tr>
                    <td>Option 2:</td>
                    <td><input type="text" name="option2" value="" size="50px" required /></td>
                </tr>
                <tr>
                    <td>Option 3:</td>
                    <td><input type="text" name="option3" value="" size="50px" required /></td>
                </tr>
                <tr>
                    <td>Option 4:</td>
                    <td><input type="text" name="option4" value="" size="50px" required/></td>
                </tr>
                <tr>
                    <td>Answer:</td>
                    <td><input type="text" name="answer" value="" size="50px" required/></td>
                </tr>
            </tbody>
        </table>
            <input type="submit" value="Save" name="submit" />
            <input type="reset" value="Clear" name="clear" />
      </form>
    </body>
</html>
