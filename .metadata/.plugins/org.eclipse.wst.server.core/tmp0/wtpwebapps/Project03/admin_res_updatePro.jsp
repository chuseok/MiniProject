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

int orderId = Integer.parseInt(request.getParameter("orderId"));
int tableNo = Integer.parseInt(request.getParameter("tableNo"));
String resDate = request.getParameter("resDate");
String resTime = request.getParameter("resTime");
int headCount = Integer.parseInt(request.getParameter("headCount"));
String msg = request.getParameter("msg");


Class.forName("oracle.jdbc.driver.OracleDriver");
String url ="jdbc:oracle:thin:@localhost:1521:xe";

Connection conn = DriverManager.getConnection(url, "c##pro", "1234");
PreparedStatement pstmt;
String sql = "update reservations set tableNo=?, resDate =to_date(?, 'yyyy-mm-dd'), resTime =?, headcount=?, msg=? where orderId =?";
pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, tableNo);
pstmt.setString(2, resDate);
pstmt.setString(3, resTime);
pstmt.setInt(4, headCount);
pstmt.setString(5, msg);
pstmt.setInt(6, orderId);
pstmt.executeQuery();


pstmt.close();
conn.close();
/* out.println("<script>alert(\"업데이트 성공\");</script>"); */
response.sendRedirect("admin_res_list.jsp");
%>

</body>
</html>