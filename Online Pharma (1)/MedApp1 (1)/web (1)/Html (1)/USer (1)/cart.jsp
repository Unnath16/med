<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<script src="Myfunctions.js"></script>
<link rel="stylesheet" type="text/css" href="Table.css">
</head>
<body>
<%

    try {
        int s = 0;
            String supplier,cno,Pno,Mnam = "",pri = "",SName = "",Supp_No =" ",Supp_Cont = " ",S_Address = " ";
String CName = "",Cust_No =" ",Cust_Cont = " ",C_Address = " ",Quantity1 = "2";
            supplier = session.getAttribute("sprods").toString();
String cno1 = session.getAttribute("SrNo").toString();
             cno = "cart"+session.getAttribute("SrNo").toString();
             String sno = session.getAttribute("sno").toString();
             Pno = request.getParameter("cart1");

             if(s==0){
out.print(supplier);
out.print(cno + "srno");
out.print(sno + "sno");
out.print(Pno + "Pno");

}
//String x = cart+cno;
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
ResultSet rs = null;     
ResultSet rs2 = null;     
String QueryString = "SELECT * from "+supplier+" where No="+Pno+"";
rs = st.executeQuery(QueryString);
while (rs.next()) {
Mnam = rs.getString(5);
pri = rs.getString(3);
}
rs.close();

Statement st1 = conn.createStatement();
String QueryString1 = "SELECT * from supplier where Sr_No="+sno+"";
rs2 = st1.executeQuery(QueryString1);
while (rs2.next()) 
{
SName = rs2.getString(4);
S_Address = rs2.getString(1);
Supp_No = rs2.getString(9);
Supp_Cont = rs2.getString(2);
}
rs2.close();
st1.close();
out.print(Mnam);
out.print(pri);
out.print(SName);

Statement st2 = conn.createStatement();
String QueryString2 = "SELECT * from user where CNo="+cno1+"";

rs2 = st2.executeQuery(QueryString2);

while (rs2.next()) 
{
CName = rs2.getString(1);
C_Address = rs2.getString(7);
Cust_No = rs2.getString(6);
Cust_Cont = rs2.getString(2);
}


Statement st3 = conn.createStatement();
String QueryString3 = "insert into "+cno+"(Name,Price,Store_Name,Supp_No,Supp_Address,Supp_Cont,User_Name,User_Address,User_No,User_Cont,Quantity)values('"+Mnam+"','"+pri+"','"+SName+"','"+Supp_No+"','"+S_Address+"','"+Supp_Cont+"','"+CName+"','"+C_Address+"','"+Cust_No+"','"+Cust_Cont+"','"+Quantity1+"')";
st3.executeUpdate(QueryString3);

rs2.close();
st3.close();

response.sendRedirect("Display.jsp");

conn.close();

}
catch (Exception ex) {
%>
<script>
    alert("Product Already Exist in Cart");
    location.replace("Display.jsp");
</script>
    <%
out.print(ex);
out.println("Unable to connect to database.");
}

%>


</body>
</html>