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
            String HName = request.getParameter("HName");
          String Category = "Doctor";
            String DLic = request.getParameter("LicNo");
            String DAddress = request.getParameter("Address");
            String CNum = request.getParameter("CNum");
            String Name = request.getParameter("Name");
            String Password = request.getParameter("Pass1");
            String Email = request.getParameter("Email");
 
            try{

                Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();

st.executeUpdate("insert into Doctor(Hospital,License,Address,Contact,Name,Email,Password)values('"+HName+"','"+DLic+"','"+DAddress+"','"+CNum+"','"+Name+"','"+Email+"','"+Password+"')");
           
        %>
        
        <script>
            alert("Registration Successful");
            
                        window.location.replace("Doctor.html");
                        
        </script>   
        
<% 
    
        }

catch(Exception e){
 %>
        
        <script>
            alert("Docter Already Registered");
            
                        window.location.replace("Doctor.html");
                        
        </script>   
        
<% 
%> 

<% 
    
  
     }  %>
    </body>
</html>
