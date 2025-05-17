<%-- 
    Document   : readExcel
    Created on : 27 Feb 2025, 08:49:12
    Author     : new
--%>

<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="java.io.*, java.util.*, org.apache.poi.ss.usermodel.*, org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*," %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>

<%
    // Check if it's a multipart request (file upload)
    if(ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {
                if (!item.isFormField()) {  // Only process file uploads
                    InputStream inputStream = item.getInputStream();
                    Workbook workbook = new XSSFWorkbook(inputStream);
                    Sheet sheet = workbook.getSheetAt(0); // Read the first sheet

                    out.println("<h2>Excel File Data:</h2>");
                    out.println("<table border='1'>");

                    for (Row row : sheet) {
                        out.println("<tr>");
                        for (Cell cell : row) {
                            out.println("<td>" + cell.toString() + "</td>");
                        }
                        out.println("</tr>");
                    }

                    out.println("</table>");
                    workbook.close();
                    inputStream.close();
                }
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
%>

<!-- HTML Form for Upload -->
<form action="readExcel.jsp" method="post" enctype="multipart/form-data">
    <input type="file" name="file" accept=".xlsx" required />
    <input type="submit" value="Upload and Read Excel">
</form>

