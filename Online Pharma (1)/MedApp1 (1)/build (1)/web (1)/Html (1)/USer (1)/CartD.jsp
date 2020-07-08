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
    <div class="sidebar">
        <a href="DashBoard.html"><i class="fa fa-fw fa-home"></i> Home</a>
  <a href="Display.jsp"><i class="fa fa-plus-square	"></i> Products</a>
  <a href="#services"><i class="fa fa-fw fa-user"></i> Profile</a>
  <a href="Order.jsp"><i class="fa fa-cart-plus"></i> Orders</a>
  <a href="#contact"><i class="	fa fa-clock-o"></i> History</a>
</div>
<%
try {
  String CartC = session.getAttribute("SrNo").toString();
  String CartD = "cart"+session.getAttribute("SrNo").toString();
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
ResultSet rs = null;
String QueryString = "SELECT * from "+CartD+"";
rs = st.executeQuery(QueryString);

%>
<table id="customers">
      <tr>
    <th>Store Name</th>
    <th>Product</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Total</th>
 
  </tr>
<%
while (rs.next()) {
%>

<tr>
<td id="info"><%=rs.getString(3)%></td>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><input type="text" name="quan" style="width : 100px; "></td>
<td>----</td>

</tr>

<% } %>
<%
rs.close();
st.close();
conn.close();

} 
catch(Exception ex) {
out.print(ex);
out.println("Unable to connect to database.");
}
%>

<script>
    function table1(){
             // Get table object
	var myTable = document.getElementById('customers').tBodies[0];
var GTot = 0;
        // first loop for each row	
        for (var r=0, n = myTable.rows.length; r < n; r++) {
                       // this loop is getting each colomn/cells
			for (var c = 0, m = myTable.rows[r].cells.length; c < m; c++) {
              
			   if(myTable.rows[r].cells[c].childNodes[0].value){
				   	
                                        var Price = parseInt(myTable.rows[r].cells[2].innerHTML);
                                        var Name = myTable.rows[r].cells[1].innerHTML;
                                        var MName = myTable.rows[r].cells[0].innerHTML;
					var Quantity = parseInt(myTable.rows[r].cells[c].childNodes[0].value);
			   		var tot = Price*Quantity;
                                        myTable.rows[r].cells[4].innerHTML = tot;
                                        myTable.rows[r].cells[3].innerHTML = Quantity;
                                        GTot = GTot + tot;
                }
            }
        }

alert("Grand Total : "+GTot);

    } 
    function order(){
        location.replace("Order.jsp");
        
    }

</script>
</table>

<center><button onclick="table1()"> Get Value</button></center>
<center><button onclick="order()"> Place Order</button></center>
<p id="Gtot">Grand Total</p>

</body>
</html>