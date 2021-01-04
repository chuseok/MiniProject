<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = DriverManager.getConnection(url, "c##pro","1234");
Statement stmt = conn.createStatement();

String sql = "select * from reservations";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>

<%
String userName = request.getParameter("userName");
String email = request.getParameter("email");
String phoneNo = request.getParameter("phoneNo");
String resDate = request.getParameter("resDate");
String resTime = request.getParameter("resTime");
String headcount = request.getParameter("headcount");
String tableNo = request.getParameter("tableNo");
String msg = request.getParameter("msg");
%>

<%
sql = "insert into customers values (cust_seq.nextval, ?, ?, ?)";
ps = conn.prepareStatement(sql);
ps.setString(1, userName);
ps.setString(2, phoneNo);
ps.setString(3, email);
ps.executeQuery();

sql = "insert into reservations values (ord_seq.nextval,?,cust_seq.currval, ?,?,sysdate, 'in', ?, ?)";
ps = conn.prepareStatement(sql);
ps.setString(1, tableNo);
ps.setString(2, resDate);
ps.setString(3, resTime);
ps.setString(4, headcount);
ps.setString(5, msg);
ps.executeQuery();

int custid = 0;
sql = "select max(custid) from customers";
ps = conn.prepareStatement(sql);
rs = ps.executeQuery();
while(rs.next()){
	custid=rs.getInt(1);
}
%>
<jsp:forward page="resResult.jsp">
	<jsp:param value="<%=custid%>" name="custId"/>
</jsp:forward>

<%rs.close(); ps.close(); conn.close(); %>

</body>
</html>