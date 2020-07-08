<%-- 
    Document   : Doctor
    Created on : 26 Mar, 2019, 1:04:28 PM
    Author     : Dell
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <% 
            String MName = request.getParameter("MName");
            String MLic = request.getParameter("LicNo");
            String MAddress = request.getParameter("Address");
            String CNum = request.getParameter("CNum");
            String Name = request.getParameter("Name");
            String Password = request.getParameter("Pass1");
            String Email = request.getParameter("Email");
 
            try{

                Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();

st.executeUpdate("insert into Supplier(Address,Contact,Email,Store,License,Name,Password)values('"+MAddress+"','"+CNum+"','"+Email+"','"+MName+"','"+MLic+"','"+Name+"','"+Password+"')");
           
        %>
        
        <script>
            alert("Registration Successful");
            
                        window.location.replace("Home.html");
                        
        </script>   
        
<% 
    
        }

catch(Exception e){
%>
        
        <script>
            alert("Supplier Already Registered");
            
                        window.location.replace("Doctor.html");
                        
        </script>   
        


<% 
    
  
     }  %>
    </body>
</html>
