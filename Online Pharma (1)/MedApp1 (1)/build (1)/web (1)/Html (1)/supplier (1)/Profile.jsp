
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="supplier.css">
<script src="Myfunctions.js"></script>
</HEAD>
<body>
<%
String SNum = session.getAttribute("SNum").toString();
    out.print(SNum);

try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
ResultSet rs = null;
String QueryString = "SELECT * from supplier where contact = "+SNum+"";
rs = st.executeQuery(QueryString);
%>
<table id="customers">
      <tr>
    <th>No.</th>
    <th>Store Name</th>
    <th>Address</th>
    <th>Contact</th>
 
  </tr>
<%
while (rs.next()) {
%>

<tr>
<td id="info"><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(1)%></td>
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
  <a href="supplierhome.jsp?log=3"><i class="fa fa-fw fa-home"></i> Home</a>
<a href="suppproduct.jsp?log=3"><i class="fa fa-plus-square	"></i> Products</a>
  <a href="#services"><i class="fa fa-fw fa-user"></i> Profile</a>
  <a href="#clients"><i class="fa fa-cart-plus"></i> Orders</a>
  <a href="#contact"><i class="	fa fa-clock-o"></i> History</a>
</div>

</BODY>

