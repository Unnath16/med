<%-- 
    Document   : StoreMed
    Created on : 1 Apr, 2019, 4:56:38 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<% 
    String SNum = session.getAttribute("store").toString();
            String Item = request.getParameter("Itemid");
            
            try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
st.executeUpdate("delete from "+SNum+" where Item_Id = "+Item+"");
    response.sendRedirect("suppproduct.jsp");
            }
            catch(Exception e){
            out.print(e);
            
            }
        %>
    </body>
</html>
