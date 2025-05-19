<%-- 
    Document   : aplcntHome
    Created on : 8 Aug 2024, 17:53:23
    Author     : new
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Exam Instruction Page</title>
        <style>
            #bod1{
                margin: 0;
                padding:0;
                font-family: verdana, Arial, Geneva, Arial Black;
                font-size: 16px;
                background-color: #ffcf79;
                font-weight: normal;
            }
            h1{
                text-align: center; 
                color: darkorchid;
                margin: 10px;
            }
            .dat{
               
                font-size: 16px;
                color: #2C8f77;
                margin-left: 1000px;
                margin-top: -50px;
                position: absolute;
                    
                
             }
           .box{      
              margin: 20px;
              padding: 10px;
              font-size: 14px; 
            
              background-color: #e5e4d7;
                
              justify-content: center;
              line-height: 1.5em;
              
              
             
            }
           
            #nub {
                text-align: center;
                margin-left:10px;
                
            }
           /* input{
                margin-left: 500px;
                padding: 10px;
                border-radius: 10px;
                font-size: 20px;
                background-color: darkslateblue;
                color: white;
            }*/
           
             table{
                background-color: #074f56;
                padding: 10px;
                width: 600px;
                /*margin-top: 50px;
                margin-left: 200px;*/
                margin: auto;
                margin-top: 10px;
                height: 60px;
                line-height:60px;
                color: white;
                border:solid 2px aqua;
                border-radius: 10px;
            }
            input{
                /*width: 100%;*/
               padding: 5px;
               margin-top: 5px;
               display: inline;
               
            }
            input[type=submit]{
               width: 20%;
               margin-left: 380px;
               background-color: #742e08;
               color: white;
               border: none;
               border-radius: 10px;
               padding: 10px;
            }
           input[type=reset]{
               width: 20%;
               margin-left: 5px;
               background-color: #742e08;
               color: white;
               border: none;
               border-radius: 10px;
               padding: 10px;
            }
           
        </style>
    </head>
    <body id='bod1'>
        
        <%
            
       
          
          Date date = new Date();
          SimpleDateFormat sform = new SimpleDateFormat("dd/MM/yyyy");
        %>
       <% response.setHeader("Cache-Control", "no-cache, no-store" );%>
        <h1> Exam Instruction </h1>
        
        <div class="dat"> Date:<%= sform.format(date)%> </div> 
             
        <p class="box"> 
 You must only attempt this exam once. Any additional attempts should only be used in the event where a serious technical issue has occurred and supporting evidence supporting this will be required. <br> 

 You are not permitted to obtain assistance by improper means or ask for help from or give help to any other person.<br> 

 You are not permitted to take screenshots, record the screen, copy and paste questions or answers or otherwise attempt to take any of the content of this exam out of the exam for any purpose.<br> 

 You are not permitted to post any requests for clarification of exam content.<br> 
 Answer all questions to the best of your ability and perception of the questions’ intent, make reasonable assumptions if necessary, to answer all questions.<br> 

 Misconduct action will be taken against you if you breach our organization rules.<br>
  
 </p>
<div id="nub">
Exam Duration = 10min<br>
All The Best!!!<br>
</div>
  
  <form name="indexForm" action="Exam.jsp" method="POST">
            <input type="submit" value="StartExam" name="submit" />
        </form>
  
    </body>
</html>
