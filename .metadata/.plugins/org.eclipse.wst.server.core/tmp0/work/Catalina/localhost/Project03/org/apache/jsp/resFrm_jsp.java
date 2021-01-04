/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.37
 * Generated at: 2021-01-04 04:35:47 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class resFrm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<script type=\"text/javascript\" src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"https://jonthornton.github.io/jquery-timepicker/jquery.timepicker.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"https://jonthornton.github.io/jquery-timepicker/jquery.timepicker.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<body>\r\n");
      out.write("  <section class=\"reservation\">\r\n");
      out.write("    <div class=\"container__reserv\">\r\n");
      out.write("      <h2 class=\"h2\">예약하기 </h2>      \r\n");
      out.write("      <div class=\"table__wrap\">\r\n");
      out.write("        <div class=\"reservation-content\">\r\n");
      out.write("          <form  name=\"reservForm\" action=\"resPro.jsp\" method=\"post\" >\r\n");
      out.write("            <p class=\"table__text\">이름</p>\r\n");
      out.write("             <input class=\"table__inp\" type=\"text\" name=\"userName\" required>\r\n");
      out.write("            <p class=\"table__text\">이메일</p>\r\n");
      out.write("             <input class=\"table__inp\" type=\"email\" name=\"email\" required >\r\n");
      out.write("            <p class=\"table__text\">전화번호</p>\r\n");
      out.write("              <input class=\"table__inp\"type=\"tel\" name=\"phoneNo\"required pattern=\"[0-9]{3}-[0-9]{4}-[0-9]{4}\"\r\n");
      out.write("                type=\"###-####-####\" placeholder=\"ex) 010-0000-0000\">\r\n");
      out.write("            <p class=\"table__text\">예약 날짜</p>\r\n");
      out.write("              <input class=\"table__inp\"type='date' name='resDate'>\r\n");
      out.write("            <p class=\"table__text\">예약 시간</p>\r\n");
      out.write("              <input class=\"table__inp\"type=\"datetime\" name=\"resTime\" id=\"timepicker\"min=\"10:00\" max=\"18:00\" step=\"1800\"\r\n");
      out.write("              placeholder=\"예약할 시간을 선택해주세요\"oninvalid=\"alert('예약 시간은 10 ~ 18시 30분 단위여야 합니다.')\" required>\r\n");
      out.write("            <p class=\"table__text\">인원 수</p>\r\n");
      out.write("              <select class=\"table__inp\"name=\"headcount\">\r\n");
      out.write("                <option value=\"1\" selected>1명</option>\r\n");
      out.write("                <option value=\"2\">2명</option>\r\n");
      out.write("                <option value=\"3\">3명</option>\r\n");
      out.write("                <option value=\"4\">4명</option>\r\n");
      out.write("                <option value=\"5\">5명</option>\r\n");
      out.write("                <option value=\"6\">6명</option>\r\n");
      out.write("                <option value=\"7\">7명</option>\r\n");
      out.write("                <option value=\"8\">8명</option>\r\n");
      out.write("              </select>\r\n");
      out.write("            <p class=\"table__text\" id=\"table-No\">테이블 번호</p>\r\n");
      out.write("            <select class=\"table__inp\"name=\"tableNo\">\r\n");
      out.write("              <option value=\"1\" selected>1번</option>\r\n");
      out.write("              <option value=\"2\">2번</option>\r\n");
      out.write("              <option value=\"3\">3번</option>\r\n");
      out.write("              <option value=\"4\">4번</option>\r\n");
      out.write("              <option value=\"5\">5번</option>\r\n");
      out.write("            </select>\r\n");
      out.write("            <p class=\"table__text\">전달 할 메세지</p>\r\n");
      out.write("            <textarea rows=\"4\"cols=\"46\" name=\"msg\"></textarea>\r\n");
      out.write("            <button type=\"button\" class=\"submit\" name = \"resButton\" onclick= \"doReserv()\">예약하기</button>\r\n");
      out.write("          </form>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </section>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tfunction doReserv(){\r\n");
      out.write("\t\tif(confirm(\"예약하시겠습니까?\")) {\r\n");
      out.write("\t\t\tdocument.reservForm.submit();\r\n");
      out.write("\t\t} else {document.reservForm.reset();}\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("<script>\r\n");
      out.write("$(\"#timepicker\").timepicker({\r\n");
      out.write("\t'minTime': \"10:00am\",\r\n");
      out.write("\t'maxTime': '20:00pm',\r\n");
      out.write("\tstep: 30,\r\n");
      out.write("\ttimeFormat: \"H:i A\"\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}