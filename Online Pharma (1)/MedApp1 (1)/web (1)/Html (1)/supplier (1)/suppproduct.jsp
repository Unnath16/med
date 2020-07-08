<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<script src="Myfunctions.js"></script>
<link rel="stylesheet" type="text/css" href="Table.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="supplier.css">
</head>
<body>
    
    
    <div class="sidebar">
        <a href="supplierhome.jsp"><i class="fa fa-fw fa-home"></i> Home</a>
        <a href="suppproduct.jsp"><i class="fa fa-plus-square	"></i> Products</a>
  <a href="Order.jsp"><i class="fa fa-fw fa-user"></i> Orders</a>
  <a href="Profile.jsp"><i class="fa fa-cart-plus"></i> Profile</a>
  <a href="#contact"><i class="	fa fa-clock-o"></i> History</a>
</div>
<%
    
String SNum = session.getAttribute("SrNo").toString();
    try {
String x = "supplier" + SNum;
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
ResultSet rs = null;    
String QueryString = "SELECT * from "+x+"";
rs = st.executeQuery(QueryString);
session.setAttribute("store", x);
%>
<br>
<br>
<p align="center">Available Stock</p>
<table id="customers">
      <tr>
    <th>No.</th>
    <th>Product ID</th>
    <th>Name</th>
    <th>Quantity</th>
    <th>Price</th>
    
 
  </tr>
<%
while (rs.next()) {
%>

<tr>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(3)%></td>

</tr>
<% } %>
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
<br>
<br>
<br>
<p align="center">Add Stock</p>



<form method="GET" action="StoreMed.jsp" >
	<table id="customers">
	
<th>Product Id</th>
<th>Product</th>
<th>Quantity</th>
<th>Price</th>

<tr>

    <td><input type="text" name="prodId" /> </td>
	<td> <input type="text" name="name"/> </td>
	<td> <input type="text" name="quantity" /> </td>
	<td> <input type="text" name="price" /> </td>
	</tr>
        
	</table>
    <center><button >Add Stock</button></center>
   
</form>


<p align="center">Update Stock</p>



<form method="GET" action="UpdateMed.jsp" >
	
    <table id="customers">
	
<th>Product Id</th>
<th>Product</th>
<th>Quantity</th>
<th>Price</th>

<tr>

    <td><input type="text" name="prodId1" /> </td>
	<td> <input type="text" name="name1"/> </td>
	<td> <input type="text" name="quantity1" /> </td>
	<td> <input type="text" name="price1" /> </td>
	</tr>
        
	</table>
    <center><button>Update</button></center>
   
</form>

<p align="center">Delete Stock</p>

<center><form method="GET" action="DeleteMed.jsp" >
    Enter Product Id<input type="text" placeholder="Product ID" name="Itemid" style="width : 15%; margin: 10px;">    
        <button >Delete</button>

</form></center>
        <br><br><br>
</body>

</html>
