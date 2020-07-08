<%-- 
    Document   : DataBase
    Created on : 22 Mar, 2019, 8:18:15 PM
    Author     : Dell
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <% 
            String UName = request.getParameter("Uname");
            String CNum = request.getParameter("CNum");
            String Pass1 = request.getParameter("Pass1");
            String Address = request.getParameter("Uaddress");
            String Category = "User";
            String Email = request.getParameter("Email");
            try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
st.executeUpdate("insert into user(Name,Contact,Password,Category,Email,Address)values('"+UName+"','"+CNum+"','"+Pass1+"','"+Category+"','"+Email+"','"+Address+"')");
        int c = Category.compareTo("Doctor");
if(c==0){

        %>
        
        <script>
            alert("Doctor Registered Successful");
                        window.location.replace("Doctor.html");
                        
        </script>   
        
<% 
        }
else{
 %>
        
        <script>
            alert("Patient Registered Successful");
                        window.location.replace("Home.html");
                        
        </script>   
        
<% 

}
}         
catch(Exception e){
  %> 
        <script>
            alert("User Already Registered"); 
            window.location.replace("register.html");
        </script>        
<% 
    out.print(e);
     }  %>
