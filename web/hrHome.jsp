<%-- 
    Document   : hrHome
    Created on : 8 Aug 2024, 08:16:11
    Author     : new
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HR Home Page</title>
        <style>
            body{
                margin:0;
                padding:0;
                background-image: url("Images/HR home.jpg");
                font-family: verdana, Arial, Geneva, Arial Black;
                font-size: 25px;
                font-weight: normal;  
            }
            h1{
                background-color: #ffcf79;
                text-align: center;
                margin:0;
                padding:0;
            }
          
            ul{
                 background-color: darkgray;
                margin:0;
                padding: 20px 0;
                display:flex;
                border-radius: 10px;
                vertical-align: middle;
                box-shadow: 0 10px 30px darkblue;
                align-items: center;
            }
            ul li{
                list-style: none;
                text-align: center;
                display: block;
              
                
            }
            ul li a{
                text-decoration: none;
                padding: 0 50px;
                display: block;
            }
            ul li a .image{
                width: 60px;
                height:60px;
                text-align: center;
                background: #ffcf79;
                margin: 0 auto 10px;
            }
            ul li a .name{
                position: relative;
                height:20px;
                width:100%;
                color: black;
                font-size: 16px;       
            }
            a:hover{
                background-color: #d3d3d3;
              border-radius: 10px;  
            }
        </style>
    </head>
    <body>
        <h1>Welcome Dear HR</h1>
        <div id="nav">
        <ul>
            <li><a href="Add Question.jsp">
                    <div class="image">
                        <img src="Images/add new question.png">
                    </div>
                    <div class="name" data-text="Add New Question"> Add New Question</div>
                </a>
            </li>
             <li><a href="excelSql.jsp">
                    <div class="image">
                        <img src="Images/add new question.png">
                    </div>
                    <div class="name" data-text="Add New Question"> Upload Question</div>
                </a>
            </li>   
            <li><a href="updateQuest.jsp">
                    <div class="image">
                        <img src="Images/Update Question.png">
                    </div>
                    <div class="name" data-text="Update Question"> Update Question</div>
                </a>
            </li>   
            <li><a href="viewAllQues.jsp">
                    <div class="image">
                        <img src="Images/all questions.png">
                    </div>
                    <div class="name" data-text="All Questions"> All Questions</div>
                </a>
            </li>   
            <li><a href="searchData.jsp">
                    <div class="image">
                        <img src="Images/delete Question.png">
                    </div>
                    <div class="name" data-text="Delete Question"> Delete Question</div>
                </a>
            </li>   
            <li><a href="viewResult.jsp">
                    <div class="image">
                        <img src="Images/allResults.png">
                    </div>
                    <div class="name" data-text="View Result"> View Result</div>
                </a>
            </li>   
            <li><a href="index.jsp">
                    <div class="image">
                        <img src="Images/Logout.png">
                    </div>
                    <div class="name" data-text="Logout"> Logout</div>
                </a>
            </li>   
        </ul>
        </div>
    </body>
</html>
