<%-- 
    Document   : Exam
    Created on : 22 Aug 2024, 15:54:47
    Author     : new
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Exam Page</title>
    </head>
    <body>
        <h1>Welcome to Exam Page</h1>
       
        <%!
           /* public class Exam{
                Connection con = null;
                PreparedStatement pst = null;
                ResultSet resultSet = null;
                public String questionId="1";
                public String answer;
                public int marks = 0;
                
                
                public Exam(){
                
                    try {
                     Class.forName("com.mysql.cj.jdbc.Driver");   
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                    pst = con.prepareStatement("select * from question_table order by rand() ");           
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
         } */ 
        %>
      
       <% 
           response.setHeader("Cache-Control", "no-cache, no-store" );
           ResultSet rs = null;
           int id = 1;   
             try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
                   Statement stmt = con.createStatement();
                    rs = stmt.executeQuery("select count(Q_Id) from question_table");
                if(rs.next())
                    {
                      id = rs.getInt(1);
                     id= id++;
                
                    }
                  }
            catch(Exception e){
                        e.printStackTrace();
                    } 
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
           
           Date date = new Date();
           SimpleDateFormat sform = new SimpleDateFormat("dd/MM/yyyy");
            
        
       /* Exam questn = new Exam();
        ResultSet set = questn.getExam();*/
     
           
       %>
       
       
       <p> Date:<%= sform.format(date)%></p>
       <p> Duration:10min </p>
       
       <div class="remainT">  
           <h2> Time Left <span id = time> 00:00</span> Seconds</h2>
       </div>
           <div> 
    <form id="examform" action="ExamJava.jsp" method="POST">
                 
               <% while(set.next()) {%> 
         <%= set.getInt("Q_Id")%>.
         
        <%= set.getString("question")%> <br><br>
        
        a <input type="radio" name="ansr<%= set.getInt("Q_Id")%>" value="option1"> <%= set.getString("option1")%> <br>
        
        b <input type="radio" name="ansr<%= set.getInt("Q_Id")%>" value="option2"> <%= set.getString("option2")%> <br>
        
        c <input type="radio" name="ansr<%= set.getInt("Q_Id")%>" value="option3"> <%= set.getString("option3")%> <br>
        
        d <input type="radio" name="ansr<%= set.getInt("Q_Id")%>" value="option4"> <%= set.getString("option4")%> <br><br>
        
       <%}%>
       
           </div>
           <input type="submit" value="Submit" name="submit" />
         </form>
              
           <script language="javascript" type="text/javascript">
              /*
               let timeSecond = 30;
               const timeh = document.getElementById('timer');
               const form = document.getElementById('examform');
               
               timeh.innerHTML ="00:"+timeSecond;
               const countd = setInterval(()=>{
                   timeSecond--;
                 displayTime(timeSecond);
                 if(timeSecond <= 0 || timeSecond < 1){
                      clearInterval(countd);
                      form.submit;
                 }  
               },1000);
              function displayTime(second){
                  const min = Math.floor(second/60);
                  const sec = Math.floor(second%60);
                  timeh.innerHTML = min+" : "+sec;
                  
              }
              */
              
           </script>  
             <script>
            /*     
        let timeLeft = 30;
        const timerElement = document.getElementById('timer');
        const form = document.getElementById('examform');

        const countdown = setInterval(() => {
            timeLeft--;
            timerElement.textContent = timeLeft;
            
            if (timeLeft <= 0) {
                clearInterval(countdown);
                form.submit();
            }
        }, 1000);
     
          */        
    </script>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
    let timeLeft = 600; // 10 minutes in seconds
    const timerDisplay = document.getElementById("time");
    

    function updateTimer() {
        const examForm = document.getElementById("examform");
        let minutes = Math.floor(timeLeft / 60);
        let seconds = timeLeft % 60;
        timerDisplay.textContent =  minutes+" : "+seconds;
        
        timeLeft--;

        if (timeLeft < 0) {
            clearInterval(timer);
            examForm.submit(); // Auto-submit form
        }
    }

    const timer = setInterval(updateTimer, 1000);
});
</script>
    </body>
    
</html>
 