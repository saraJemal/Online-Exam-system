<%-- 
    Document   : searchData
    Created on : 7 Sept 2024, 15:35:14
    Author     : new
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Data</title>
    </head>
    <body>
        <h1>Search Data</h1>
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
</html>
