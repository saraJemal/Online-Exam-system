<%-- 
    Document   : aplcnt
    Created on : 7 Aug 2024, 19:38:55
    Author     : new
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome to Applicant login page</title>
        <style>
         *{
               padding: 0;
                margin: 0; 
                  
              }
                h1{
                 background-color: #5c755e;
                 padding: 20px;
                 margin: 0px;
                 text-align: center;
            }
            .bim{
                /*background-image: url("Images/aplcnt login.jpg");
                background-repeat: no-repeat;
                background-size: contain; 
                height: 100vh;*/
                background-color: #ffcf79;
                font-family: verdana, Arial, Geneva, Arial Black;
                font-size: 16px;
                font-weight: normal;  
            }
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
                width: 100%;
                padding: 5px;
               margin-top: 5px;
               
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
               margin-left: 50px;
               background-color: #742e08;
               color: white;
               border: none;
               border-radius: 10px;
               padding: 10px;
            }
               
           </style>
    </head>
    <body class = "bim">
        <h1>Welcome to Applicant Login Page</h1>
        <form name="aplForm" action="aplctjava.jsp" method="POST">
            <table  border="0">
                <tbody>
                    <tr>
                        <td>Email: </td>
                        <td><input type="text" name="email" value="" size="30" /></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="password" value="" size="30" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Login" name="submit" />
            <input type="reset" value="Clear" name="clear" />
        </form>
    </body>
</html>
