<%-- 
    Document   : excelSql
    Created on : 25 Feb 2025, 14:20:17
    Author     : new
--%>


<%@ page import="java.io.*, java.sql.*, org.apache.poi.ss.usermodel.*, org.apache.poi.xssf.usermodel.XSSFWorkbook" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    
    
    // MySQL Database connection
   /* String jdbcURL = "jdbc:mysql://localhost:3306/userdetails";
    String dbUser = "root";
    String dbPassword = "root";

    
        Part filePart = request.getPart("file");
        InputStream inputStream = filePart.getInputStream();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet sheet = workbook.getSheetAt(0);

            for (Row row : sheet) {
                if (row.getRowNum() == 0) continue; // Skip header row
                
                 int Q_Id = (int) row.getCell(0).getNumericCellValue();
            String question = row.getCell(1).getStringCellValue();
            String option1 = row.getCell(2).getStringCellValue();
            String option2 = row.getCell(3).getStringCellValue();
            String option3 = row.getCell(4).getStringCellValue();
            String option4 = row.getCell(5).getStringCellValue();
            String answer = row.getCell(6).getStringCellValue();
            String givenAnswer = row.getCell(7).getStringCellValue();
            
            String insertSQL = "INSERT INTO excelquestn (Q_Id, question, option1, option2, option3, option4, answer, givenAnswer) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                  PreparedStatement  pst = conn.prepareStatement(insertSQL);
                  
                  pst.setInt(1, Q_Id);
            pst.setString(2, question);
            pst.setString(3, option1);
            pst.setString(4, option2);
            pst.setString(5, option3);
            pst.setString(6, option4);
            pst.setString(7, answer);
            pst.setString(8, givenAnswer);
            pst.executeUpdate();
                
               /* String sql = "INSERT INTO users (name, age, email) VALUES (?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, name);
                statement.setDouble(2, age);
                statement.setString(3, email);
                statement.executeUpdate();
            }
            workbook.close();
            conn.close();
            out.println("Data uploaded successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    */

%>

<html>
<head>
    <title>Upload Excel File</title>
</head>
<body>
<h2>Upload Excel File to MySQL</h2>
<form method="post" action ="excelServlet"  enctype="multipart/form-data">
    <input type="file" name="file" accept=".xlsx" required />
    <br><br>
    <input type="submit" value="Upload" />
</form>
</body>
</html>
