<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<link rel="stylesheet" type="text/css" href="Table.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="supplier.css">
</head>
<body>
    <script>
        function myFunction(x) {
var y = x.rowIndex;
alert("Added to Cart");
location.replace("cart.jsp?cart1="+y);
} 

    </script>   
    
    <div class="sidebar">
        <a href="DashBoard.jsp"><i class="fa fa-fw fa-home"></i> Home</a>
  <a href="Display.jsp"><i class="fa fa-plus-square	"></i> Products</a>
  <a href="CartD.jsp"><i class="fa fa-fw fa-user"></i> Cart</a>
  <a href="#clients"><i class="fa fa-cart-plus"></i> Orders</a>
  <a href="#contact"><i class="	fa fa-clock-o"></i> History</a>
</div>
<%
    
    String y = request.getParameter("val");
    session.setAttribute("sno", y);
try {

    String x = "supplier" + y;
session.setAttribute("sprods", x);
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
ResultSet rs = null;    
String QueryString = "SELECT * from "+x+"";
rs = st.executeQuery(QueryString);
%>

<table id="customers">
      <tr>
    <th>No.</th>
    <th>Medicines</th>
    <th>Price</th>
    <th>Quantity</th>
 
  </tr>
<%
while (rs.next()) {
%>

<tr onclick="myFunction(this)">
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>

</tr>
    
<%           
      }
%>
<%
rs.close();
st.close();
conn.close();

}
catch (Exception ex) {

out.print(ex);

out.println("Unable to connect to database.");
}
%>
</table>
<table>
<tr>
<td>
</tr>
</table>
</body>
</html>