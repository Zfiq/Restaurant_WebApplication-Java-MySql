package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/Header.jsp");
    _jspx_dependants.add("/Footer.jsp");
  }

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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <!-- Link connection to Style.css -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"StyleCss/Style.css\"/> \n");
      out.write("        <title>Header</title>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <header>\n");
      out.write("            <!-- Header text layout is modified in Style.css class -->\n");
      out.write("            <!-- Restaurant image from Image folder and Large text for restaurant name -->\n");
      out.write("            <!-- For the image file width and height set in Style.css class which is used for the name MyRestuarant background-image as Logo.-->\n");
      out.write("            <!-- Class Logo is the Restaurant name for styling in Style.css class.-->\n");
      out.write("            <div class=\"Logo\">MyRestaurant</div>\n");
      out.write("            <!--Layout is in Style.css class for ul and li.-->\n");
      out.write("          \n");
      out.write("                <ul class=\"ul_Header\">\n");
      out.write("                    <li ><a class=\"li_Header\" href=\"WellCome.jsp\">Home</a></li>\n");
      out.write("                    <li><a class=\"li_Header\" href=\"index.jsp\">Login Differnt User</a></li>\n");
      out.write("                    <li><a class=\"li_Header\" href=\"Menu\">Menu</a></li>\n");
      out.write("                    <li><a class=\"li_Header\" href=\"ContactUs.jsp\">Contact Us</a></li>\n");
      out.write("                </ul>\n");
      out.write("\n");
      out.write("           \n");
      out.write("        </header>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</html>\n");
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <!--StyleSheet connection link to Style.css class -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"StyleCss/Style.css\"/>\n");
      out.write("        <title>Footer</title>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <!--For the footer tags layout css is used in footer section.-->\n");
      out.write("        <!-- placed the copyRight text outside the ul tag-->\n");
      out.write("        <!--li contain hyper links to other pages.-->\n");
      out.write("        <!--The logout input form layout is modified using css-->\n");
      out.write("\n");
      out.write("        <footer>\n");
      out.write("\n");
      out.write("            <ul class=\"ul_Footer\">\n");
      out.write("                <li ><a class=\"li_Footer\" href=\"Menu\">Menu</a></li>\n");
      out.write("                <li><a class=\"li_Footer\" href=\"BillCalculator.jsp\">MenuCalculator</a></li>\n");
      out.write("                <li><a class=\"li_Footer\" href=\"CustomerReservations.jsp\">Reserve Table</a></li>\n");
      out.write("\n");
      out.write("                <li><form class=\"Logout-Footer\" action=\"Logout\" method=\"post\">\n");
      out.write("                        <input type=\"submit\" value=\"Logout\" class=\"LogoutButton\"/>\n");
      out.write("                    </form></li>\n");
      out.write("            </ul>\n");
      out.write("            <article class=\"offer-text\">\n");
      out.write("                Special offers for students and for our regular customers.\n");
      out.write("                Upcoming events we will be offering our free new recipes and desserts to all our customers.\n");
      out.write("                <strong>Please Note</strong>.Our free new recipe offer only applies to those who comes with minimum 5 in Number in party.\n");
      out.write("            </article>\n");
      out.write("\n");
      out.write("            <div class=\"CopyRight\"> CopyRight &copy; 2018-19 All Rights Reserved.</div>\n");
      out.write("\n");
      out.write("        </footer>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"StyleCss/Style.css\"> <!-- Link connection to StyleCss folder path Style.css -->\n");
      out.write("        <title>Login Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body style=\"background-color:#B8860B\">\n");
      out.write("        <!-- Set form for user name and password and aligned from top using Style.css -->\n");
      out.write("        <!-- After login successfully it will redirect to WellCome.jsp page -->\n");
      out.write("        <form action=\"Login\" method=\"get\" class=\"EntryForm\">\n");
      out.write("            User Name:<input type=\"text\" name=\"UserName\"/><br>\n");
      out.write("            Password:<input type=\"password\" name=\"Password\"/><br>\n");
      out.write("            <!-- Two Input buttons first one for submission and second one to clear the fields -->\n");
      out.write("            <input type=\"submit\" value=\"submit\"/>\n");
      out.write("            <input type=\"reset\" value=\"Clear\"/>\n");
      out.write("        </form>\n");
      out.write("        <!-- Set the error messages to red color using Style.css -->\n");
      out.write("        <p id=\"Fields_Error\"> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${NoEntryError}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("        <p id=\"User_Error\"> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${InvalidUser}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
