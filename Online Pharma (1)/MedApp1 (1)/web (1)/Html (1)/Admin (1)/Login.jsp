<%--
    Document   : Login
    Created on : 23 Mar, 2019, 5:22:05 PM
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
            String CNum1 = request.getParameter("CNum");
                        String Pass2 = request.getParameter("Pass1");
                        String Pass,name;
                        
                        try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
String sql = "SELECT PASSWORD,category FROM user WHERE Contact="+CNum1+"";
ResultSet rs = st.executeQuery(sql);

while(rs.next()){
Pass = rs.getString("PASSWORD");
name = rs.getString("Category");
int c = Pass.compareTo(Pass2);
session.setAttribute("contact", CNum1);
int d = name.compareTo("Doctor");
int e = name.compareTo("Patient");
int f = name.compareTo("Supplier");

if(c == 0){
    
    response.sendRedirect("DashBoard.jsp");


}

        else{
     %>
        
        <script>
            alert("Incorrect");
                        
        </script>   
        
<% 
            String redirectURL = "Home.html"; 
            response.sendRedirect(redirectURL); 
            }
                    }

          }
          catch(Exception e){
out.print(e);             
          }
        
        %>
    </body>
</html>
