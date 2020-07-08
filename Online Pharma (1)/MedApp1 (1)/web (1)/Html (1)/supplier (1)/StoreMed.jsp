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
            String MName = request.getParameter("name");
            String Mprice = request.getParameter("price");
            String MQuantity = request.getParameter("quantity");
            String MID = request.getParameter("prodId");
            
            try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
st.executeUpdate("insert into "+SNum+"(Item_ID,Price,Quantity,Name)values('"+MID+"','"+Mprice+"','"+MQuantity+"','"+MName+"')");
    response.sendRedirect("suppproduct.jsp");
            }
            catch(Exception e){
            out.print(e);
            
            }
        %>
    </body>
</html>
