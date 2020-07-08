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
            String MName = request.getParameter("name1");
            String Mprice = request.getParameter("price1");
            String MQuantity = request.getParameter("quantity1");
            String MID = request.getParameter("prodId1");
            
            try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
st.executeUpdate("update "+SNum+" set Price = '"+Mprice+"',Quantity = '"+MQuantity+"',name = '"+MName+"' where Item_id = '"+MID+"'");
    response.sendRedirect("suppproduct.jsp");
            }
            catch(Exception e){
            out.print(e);
            
            }
        %>
    </body>
</html>
