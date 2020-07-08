package org.apache.jsp.Html;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.*;

public final class Display_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("    \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write(" \n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<script src=\"Myfunctions.js\"></script>\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"Table.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"supplier.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"sidebar\">\n");
      out.write("  <a href=\".html\"><i class=\"fa fa-fw fa-home\"></i> Home</a>\n");
      out.write("  <a href=\"Display.jsp\"><i class=\"fa fa-plus-square\t\"></i> Products</a>\n");
      out.write("  <a href=\"#services\"><i class=\"fa fa-fw fa-user\"></i> Profile</a>\n");
      out.write("  <a href=\"#clients\"><i class=\"fa fa-cart-plus\"></i> Orders</a>\n");
      out.write("  <a href=\"#contact\"><i class=\"\tfa fa-clock-o\"></i> History</a>\n");
      out.write("</div>\n");

try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medapp","root","sarilla1427");
Statement st = conn.createStatement();
ResultSet rs = null;
String QueryString = "SELECT * from supplier";
rs = st.executeQuery(QueryString);

      out.write("\n");
      out.write("<table id=\"customers\">\n");
      out.write("      <tr>\n");
      out.write("    <th>No.</th>\n");
      out.write("    <th>Store Name</th>\n");
      out.write("    <th>Address</th>\n");
      out.write("    <th>Contact</th>\n");
      out.write(" \n");
      out.write("  </tr>\n");

while (rs.next()) {

      out.write("\n");
      out.write("\n");
      out.write("<tr onclick=\"myFunction(this)\">\n");
      out.write("<td id=\"info\">");
      out.print(rs.getString(9));
      out.write("</td>\n");
      out.write("<td>");
      out.print(rs.getString(4));
      out.write("</td>\n");
      out.write("<td>");
      out.print(rs.getString(1));
      out.write("</td>\n");
      out.write("<td>");
      out.print(rs.getString(2));
      out.write("</td>\n");
      out.write("\n");
      out.write("</tr>\n");
 } 
      out.write('\n');

rs.close();
st.close();
conn.close();

} catch (Exception ex) {
out.print(ex);
out.println("Unable to connect to database.");
}

      out.write("\n");
      out.write("</table><TABLE>\n");
      out.write("<TR>\n");
      out.write("<TD><FORM ACTION=\"welcome_to_database_query.jsp\" method=\"get\" >\n");
      out.write("<button type=\"submit\"><-- back</button></TD>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("</font>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
