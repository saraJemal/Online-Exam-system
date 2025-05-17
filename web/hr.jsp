<%-- 
    Document   : hr
    Created on : 7 Aug 2024, 19:37:05
    Author     : new
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome to HR login page</title>
        <style>
         
                h1{
                 background-color: #5c755e;
                 padding: 20px;
                 margin: 0px;
                 text-align: center;
            }
            body{
                padding: 0;
                margin: 0; 
                background-image: url("Images/HR home.jpg");
                background-repeat: no-repeat;
                background-size: cover; 
                height: 100vh;
                /*background-color: #ffcf79;*/
                font-family: verdana, Arial, Geneva, Arial Black;
                font-size: 25px;
                font-weight: normal;  
            }
             table{
                background-color: #074f56;
                padding: 30px;
                width: 600px;
                margin: auto;
                margin-top: 100px;
                height: 60px;
                line-height:60px;
                color: white;
                border:solid 2px aqua;
                border-radius: 10px;
            }
            input{
                width: 100%;
                padding: 5px;
               margin-top: 20px;
               
            }
            input[type=submit]{
               width: 15%;
               margin-left: 450px;
               background-color: #742e08;
               color: white;
               font-size: 25px;
               border: none;
               border-radius: 10px;
               padding: 10px;
            }
            input[type=reset]{
                 width: 15%;
               margin-left: 50px;
               background-color: #742e08;
               color: white;
               font-size: 25px;
               border: none;
               border-radius: 10px;
               padding: 10px;
            }
               
           </style>
    </head>
    <body>
        <%response.setHeader("Cache-Control", "no-cache, no-store" );%>
        <h1>Welcome to Login Page</h1>
        <form name="hrForm" action="hrjava.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Email: </td>
                        <td><input type="text" name="email" id = "email" value="" size="30" required/></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="password" id = "pass" value="" size="30" required /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Login" name="submit" />
            <input type="reset" value="Clear" name="clear" />
        </form>
    </body>
</html>
