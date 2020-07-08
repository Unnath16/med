<%--
    Document   : Login
    Created on : 23 Mar, 2019, 5:22:05 PM
    Author     : Dell
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    
    </head>
    
    
        <% 
            String CNum1 = request.getParameter("CNum");
                        String Pass2 = request.getParameter("Pass1");
                        String Pass,name;
                        
                        try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
String sql = "SELECT PASSWORD,sr_no FROM supplier WHERE Contact="+CNum1+"";
ResultSet rs = st.executeQuery(sql);

while(rs.next()){
    Pass = rs.getString("PASSWORD");
name = rs.getString("sr_no");
int c = Pass.compareTo(Pass2);
session.setAttribute("SNum", CNum1);
session.setAttribute("SrNo", name);
if(c == 0){
    response.sendRedirect("suppproduct.jsp");
}
        else if(c!=0){

%>
        
         <script>
            alert("Invalid Credentials");
            location.replace("Home.html");
        </script>   
        
<% 
            }
                    }

if(!rs.next()){
%>
        
        <script>
            alert("Supplier Does not Exist");
            location.replace("Home.html");
        </script>   
        
<% 

}
          }



          catch(Exception e){
out.print(e);            
%>
        
        <script>
            alert("Invalid Login");
        </script>   
        
<% 
          }
        
        %>
    

