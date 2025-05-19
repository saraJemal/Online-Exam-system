<%-- 
    Document   : updateQuest
    Created on : 7 Sept 2024, 15:43:13
    Author     : new
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Question</title>
        <style>
              h1{
                 /*background-color: #742e08;*/
                /* background-color:#ffcf79;*/
                background-color: lightslategray;
                 padding: 0px;
                 margin: 0px;
                 text-align: center;
                 box-shadow: 0 15px 20px darkblue;
                color: white;
                 font-size: 20px;
                 display: flex;
             }
              a{
               
                margin-left: 500px; 
                text-decoration: none;
                .image {
                    margin-top: 5px;
                }
            }
             img{
                width:30px;
            }
            h1 p{
                margin-left: 100px;
            }
             .name{
                font-size: 15px;
                color: white;
             }
                
            
        </style>
    </head>
    <body>
        <h1> <p>Update Question</p>
            <a href="index.jsp">
                    <div class="image">
                        <img src="Images/Logout.png">
                    </div>
                    <div class="name" data-text="Logout"> Logout</div>
                </a>
        </h1>
         <form name="Idform" action="updateQuestJava.jsp" method="POST">
            <table border="0">
                
                <tbody>
                    <tr>
                        <td>Question ID: </td>
                        <td><input type="text" name="id" value="" size="10px" /></td>
                    </tr>
                    
                </tbody>
            </table>
            <input type="submit" value="Search" name="search" />
            <input type="reset" value="Clear" name="clear" />
        </form>
    </body>
    
</html>
