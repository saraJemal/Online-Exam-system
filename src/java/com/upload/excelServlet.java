/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.upload;

import java.io.IOException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Iterator;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author new
 */
@WebServlet(name = "excelServlet", urlPatterns = {"/excelServlet"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB threshold
    maxFileSize = 1024 * 1024 * 10,       // 10MB max file size
    maxRequestSize = 1024 * 1024 * 50     // 50MB max request size
)
public class excelServlet extends HttpServlet {
    
    
      String jdbcURL = "jdbc:mysql://localhost:3306/userdetails";
      String dbUser = "root";
      String dbPassword = "root";
    
    
     
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        try (InputStream fileContent = filePart.getInputStream()) {
            saveToDatabase(fileContent);
            response.getWriter().write("File uploaded and data saved successfully!");
            
        } catch (Exception e) {
            response.getWriter().write("Error: " + e.getMessage());
        }
        
       
        InputStream inputStream = filePart.getInputStream();

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
              }     data.append("</table>");
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

    private void saveToDatabase(InputStream inputStream) throws Exception {
        Workbook workbook;
        Connection conn;
         PreparedStatement pst;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser,dbPassword); 
            String sql =  "INSERT INTO excelquestn (Q_Id, question, option1, option2, option3, option4, answer) VALUES (?, ?, ?, ?, ?, ?, ?)";
             pst = conn.prepareStatement(sql); 
                workbook = new XSSFWorkbook(inputStream);
                Sheet sheet = workbook.getSheetAt(0);
               // for (Row row : sheet) {
                   // if (row.getRowNum() == 0) continue; // Skip header row
              Iterator<Row> rowIterator = sheet.iterator();
              rowIterator.next(); // Skip header row
                   
                   while (rowIterator.hasNext()) {
                  Row row = rowIterator.next(); 
                  
                   int Q_Id =  (int)row.getCell(0).getNumericCellValue();
                    String question = row.getCell(1).getStringCellValue();
                    String option1 = row.getCell(2).getStringCellValue();
                    String option2 = row.getCell(3).getStringCellValue();
                    String option3 = row.getCell(4).getStringCellValue();
                    String option4 = row.getCell(5).getStringCellValue();
                    String answer = row.getCell(6).getStringCellValue();
                    
                    
                    pst.setInt(1, Q_Id);
                    pst.setString(2, question);
                    pst.setString(3, option1);
                    pst.setString(4, option2);
                    pst.setString(5, option3);
                    pst.setString(6, option4);
                    pst.setString(7, answer);
                    pst.executeUpdate();
                    
                }
            pst.close();
            workbook.close();
            conn.close();
            }
    
       /*public class UploadServlet extends HttpServlet {*/
    
   /* private static final String JDBC_URL = "jdbc:mysql://localhost:3306/userdetails";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Part filePart = request.getPart("file");
        if (filePart == null || filePart.getSize() == 0) {
            response.getWriter().write("No file uploaded.");
            return;
        }
        
        try (InputStream inputStream = filePart.getInputStream();
             Workbook workbook = new XSSFWorkbook(inputStream)) {
            
            Sheet sheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = sheet.iterator();

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD); 
                String sql = "INSERT INTO excelquestn (Q_Id, question, option1, option2, option3, option4, answer, givenAnswer) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pst = conn.prepareStatement(sql);

                rowIterator.next(); // Skip header row

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
            }
            catch (ClassNotFoundException | SQLException e){
             response.getWriter().write("Error: " + e.getMessage());   
            }
            response.getWriter().write("File uploaded and data inserted successfully!");
        } catch (Exception e) {
            response.getWriter().write("Error: " + e.getMessage());
        }
    }*/
   }



  
    
        
    

