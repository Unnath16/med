<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="supplier.css">
</head>
<body>
<%
String Cont = session.getAttribute("contact").toString();
out.print(Cont);
String no1;

try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
ResultSet rs = null;
String QueryString = "SELECT * from user where contact = "+Cont+"";
rs = st.executeQuery(QueryString);

%>
<table id="customers">
      <tr>
    <th>No.</th>
    <th>Name</th>
    <th>Address</th>
    <th>Contact</th>
 
  </tr>
<%
while (rs.next()) {
    String no = rs.getString(3);
session.setAttribute("srno", no);
%>

<tr>
<td id="info"><%=rs.getString(3)%></td>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(2)%></td>

</tr>
</table>
<% } %>
<%

rs.close();
st.close();
conn.close();

} catch (Exception ex) {
out.print(ex);
out.println("Unable to connect to database.");
}
%>
<div class="sidebar">
  <a href="DashBoard.jsp"><i class="fa fa-fw fa-home"></i> Home</a>
  <a href="Display.jsp"><i class="fa fa-plus-square	"></i> Products</a>
  <a href="CartD.jsp"><i class="fa fa-fw fa-user"></i> Cart</a>
  <a href="Order.jsp"><i class="fa fa-cart-plus"></i> Orders</a>
  <a href="#contact"><i class="	fa fa-clock-o"></i> History</a>
</div>

<div class="main">
  <h2>Welcome to MedApp</h2>
  <p>This side navigation is of full height (100%) and always shown.</p>
  <p>Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
</div>
     
</body>
</html> 

