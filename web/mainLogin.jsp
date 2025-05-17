<%-- 
    Document   : mainLogin
    Created on : 9 Aug 2024, 14:17:25
    Author     : new
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hb Online Exam Web Service </title>
        <style>
            
             *{
                padding: 0;
                margin: 0; 
                    
              }
                h1{
                 background-color: #5c755e;
                 padding: 20px;
                 color: darkblue;
                 margin: 0px;
                 text-align: center;
            }
            body{
                background-color: #ffcf79; 
                font-family: verdana, Arial, Geneva, Arial Black;
                font-weight: normal;
                font-size: 25px;  
            }
            .loginform{
                width: 800px;
                margin: auto;
                margin-top: 50px;
                background-color: darkslategray;
                color: white;
                padding: 10px 0px 10px 0px;
                text-align: center;
                border-radius: 15px 15px 0px 0px;
                
            }
            .main {
                background-color: #5c755e;
                width: 800px;
                margin: auto;
                text-align: center;
                padding-bottom:20px ;
            }
            .email p{
                font-size: 20px;
                padding: 10px 5px;
            }
            .email input{
                font-size: 16px;
                padding: 10px 5px;
                width: 50%;
                margin-left: 30px;
                border: 0;
                border-radius: 5px;
            }
            .passcont p{
                font-size: 20px;
                padding: 10px 5px;
                display:flex;
                align-items: center;
                justify-content: center;
            }
            .passcont input{
                 font-size: 16px;
                padding: 10px 5px;
                width: 50%;
                border: 0;
                outline: 0;
                border-radius: 5px;
                display:flex;
                align-items: center;
            }
            .passcont img{
                background-color: white;
                width: 35px;
                padding: 3px;
                cursor: pointer;
                border: 1px;
                margin-top: auto;
                margin-left: -60px;
            }
            .role p{
                font-size: 20px;
                padding: 10px 5px;
            }
            .option {
                font-size: 20px;
                padding: 5px 5px;
                margin-left: 50px;
            }
            .submit input[type = submit]{
                background-color: #2C8f77;
                margin: auto;
                font-size: 20px;
                padding: 10px 110px;
                 border-radius: 20px;
                border: 2px solid burlywood;
                
            }
            .submit input[type = reset]{
                background-color: #2C8f77;
                margin: auto;
                font-size: 20px;
                padding: 10px 110px;
                border-radius: 20px;
                border: 2px solid burlywood;
            }
            
        </style>
    </head> 
           
    <body > <h1>Hb Online Exam Web Service</h1>
        <div class="loginform"> <h2> General Login Form</h2></div>
            <div class="main">
                <form  action="login.jsp" method="POST">
                    <div class="email">
                        <p>User Email: 
                    <input type="text" name="Email" value="" size="30" placeholder = "email"/>
                        </p>
                    </div>
                    <div class="passcont">
                     <p>User Password:
                         <input type="password" name="Password" value="" size="30" placeholder = "password" id="pass"/>
                         <img src = "Images/eye-close.png" id="eyeicon" >
                        </p>
                    </div>
                    <div class="role">
                    <p> User Role: 
                            <select class="option" name="role">
                                <option>Choose your role</option>
                                <option>Admin</option>
                                <option>HR</option>
                                <option>Applicant</option>
                            </select>
                        </p>
                    </div>
                       <div class="submit">
                        <input type="submit" value="Login" name="submit" />
                        <input type="reset" value="Clear" name="clear" />
                       </div>
        </form>
          </div>      
        <script>
            let eyeicon = document.getElementById("eyeicon");
            let password = document.getElementById("pass");
            eyeicon.onclick = function(){
                if(password.type == "password"){
                    password.type =  "text";
                    eyeicon.src = "Images/eye-open.png";
                }else{
                     password.type =  "password";
                     eyeicon.src = "Images/eye-close.png";
                 }      
            }
        </script>
    </body>
</html>
