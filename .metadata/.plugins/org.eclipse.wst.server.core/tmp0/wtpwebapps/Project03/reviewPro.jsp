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

String sql = "select * from Reviews";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>

<%
String starRate = (String)request.getParameter("starRate");
if(starRate == null || starRate.trim().equals("")){
	starRate = "5";
}
String comment = request.getParameter("comment");
String rateAge = request.getParameter("rateAge");
String rateGender = request.getParameter("rateGender");


%>
<%-- 별점 : <%=star %>
코멘트 : <%=comment %>
성별: <%=rateGender %>
연령대 : <%=rateAge %>
 --%>

<%
sql = "insert into reviews(rateMsg, rateStar, rateGender, rateAge) values (?, ?, ?, ?)";
ps = conn.prepareStatement(sql);
ps.setString(1, comment);
ps.setString(2, starRate);
ps.setString(3, rateGender);
ps.setString(4, rateAge);
ps.executeQuery();

rs.close(); ps.close(); conn.close();

%>
<jsp:forward page="reviewResult.jsp"></jsp:forward>




















</body>
</html>