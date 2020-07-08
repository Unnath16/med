<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<link rel="stylesheet" type="text/css" href="Table.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="supplier.css">
    <script>
        function myFunction(x) {
var y = x.rowIndex;
alert(x.rowIndex);
location.replace("Medicines.jsp?val="+y);
} 
</script>
</head>
<body>
    <div class="sidebar">
        <a href="DashBoard.html"><i class="fa fa-fw fa-home"></i> Home</a>
  <a href="Display.jsp"><i class="fa fa-plus-square	"></i> Products</a>
  <a href="CartD.jsp"><i class="fa fa-fw fa-user"></i>Cart</a>
  <a href="#clients"><i class="fa fa-cart-plus"></i> Orders</a>
  <a href="#contact"><i class="	fa fa-clock-o"></i> History</a>
</div>
<%
try {
    String Cno = "cart"+session.getAttribute("SrNo").toString();
    String Cno1 = session.getAttribute("SrNo").toString();
    
    int sum = 0;
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
Statement st1 = conn.createStatement();
ResultSet rs = null;
ResultSet rs1 = null;

String QueryString = "insert into orders select * from "+Cno+"";
st.executeUpdate(QueryString);
st.close();

String sql = "select * from orders where user_no = "+Cno1+"";
rs = st1.executeQuery(sql);
%>
<table id="customers">
      <tr>
    <th>Store Name</th>
    <th>Address</th>
    <th>Contact</th>
    <th>Product</th>
    <th>Price</th>
    <th>Total</th>
 
  </tr>
<%
while (rs.next()) {
    
  int price = Integer.parseInt(rs.getString(2));
  int quan = Integer.parseInt(rs.getString(11));
   sum = sum + price*quan;
%>

<tr>
<td id="info"><%=rs.getString(3)%></td>
<td id="info"><%=rs.getString(5)%></td>
<td id="info"><%=rs.getString(6)%></td>
<td><%=rs.getString(1)%></td>
<td><%=price%></td>
<td><%=price*quan%></td>


</tr>

<% } %>
<%
rs.close();
st.close();
conn.close();

} catch (Exception ex) {
out.print("nnnnnnnnnnnnnnnnnnnnnnn"+ex);
out.println("Unable to connect to database.");
}
%>
</table><TABLE>
<TR>
<TD><FORM ACTION="welcome_to_database_query.jsp" method="get" >
<button type="submit"><-- back</button></TD>
</TR>
</TABLE>
</font>
</body>
</html>