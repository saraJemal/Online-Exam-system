/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Iterator;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author new
 */
@WebServlet(name = "excelUpld", urlPatterns = {"/excelUpld"})
@MultipartConfig
public class excelUpld extends HttpServlet {

     //private static final String jdbcURL = "jdbc:mysql://localhost:3306/userdetails";
    //private static final String dbUser = "root";
    //private static final String dbPassword = "root";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         // fetch data from the form
           Part filePart = request.getPart("file");
        InputStream inputStream = filePart.getInputStream();
        try (InputStream fileContent = filePart.getInputStream()) {
            saveToDatabase(fileContent);
            response.getWriter().write("File uploaded and data saved successfully!");
        } catch (Exception e) {
            response.getWriter().write("Error: " + e.getMessage());
        }

StringBuilder data;
        try (Workbook workbook = new XSSFWorkbook(inputStream)) {
Sheet sheet = workbook.getSheetAt(0);
            data = new StringBuilder("<h2>Excel Data:</h2><table border='1'>");
for (Row row : sheet) {
data.append("<tr>");
for (Cell cell : row) {
data.append("<td>").append(getCellValue(cell)).append("</td>");
}
data.append("</tr>");
}   data.append("</table>");
        }

        response.setContentType("text/html");
        response.getWriter().write(data.toString());
    }

    private String getCellValue(Cell cell) {
        return switch (cell.getCellType()) {
            case STRING -> cell.getStringCellValue();
            case NUMERIC -> String.valueOf(cell.getNumericCellValue());
            case BOOLEAN -> String.valueOf(cell.getBooleanCellValue());
            default -> "";
        };
    }
 

    
    // </editor-fold>

    private void saveToDatabase(InputStream inputStream) throws Exception {
        Workbook workbook;
        Connection conn;
         PreparedStatement pst;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails", "root","root"); 
            String sql =  "INSERT INTO excelquestn (Q_Id, question, option1, option2, option3, option4, answer, givenAnswer) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
             pst = conn.prepareStatement(sql); 
                workbook = new XSSFWorkbook(inputStream);
                Sheet sheet = workbook.getSheetAt(0);
               // for (Row row : sheet) {
                   // if (row.getRowNum() == 0) continue; // Skip header row
              Iterator<Row> rowIterator = sheet.iterator();
              rowIterator.next(); // Skip header row
                   /* String Q_Id =  row.getCell(0).getStringCellValue();
                    String question = row.getCell(1).getStringCellValue();
                    String option1 = row.getCell(2).getStringCellValue();
                    String option2 = row.getCell(3).getStringCellValue();
                    String option3 = row.getCell(4).getStringCellValue();
                    String option4 = row.getCell(5).getStringCellValue();
                    String answer = row.getCell(6).getStringCellValue();
                    String givenAnswer = row.getCell(7).getStringCellValue();*/
                   while (rowIterator.hasNext()) {
                  Row row = rowIterator.next(); 
                    pst.setInt(1, (int)row.getCell(0).getNumericCellValue());
                    pst.setString(2, row.getCell(1).getStringCellValue());
                    pst.setString(3, row.getCell(2).getStringCellValue());
                    pst.setString(4, row.getCell(3).getStringCellValue());
                    pst.setString(5, row.getCell(4).getStringCellValue());
                    pst.setString(6, row.getCell(5).getStringCellValue());
                    pst.setString(7, row.getCell(6).getStringCellValue());
                    pst.setString(8, row.getCell(7).getStringCellValue());
                    pst.executeUpdate();
                    
                }
                
            
            pst.close();
            workbook.close();
            conn.close();
            }
}


