<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String orderId = request.getParameter("orderId");
out.print(orderId);

/* String orderId = (String) session.getAttribute("orderId"); */

Class.forName("oracle.jdbc.driver.OracleDriver");
String url ="jdbc:oracle:thin:@localhost:1521:xe";

Connection conn = DriverManager.getConnection(url, "c##pro", "1234");
PreparedStatement pstmt;
String sql = "delete from reservations where orderId = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, orderId);
pstmt.executeQuery();

%>

<%

pstmt.close();
conn.close();
response.sendRedirect("admin_res_list.jsp");
%>

</body>
</html>