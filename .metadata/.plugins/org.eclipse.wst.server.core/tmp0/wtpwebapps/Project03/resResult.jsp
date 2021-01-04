<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Refresh" content="10;url=Cozima.jsp">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Oswald:wght@500&family=Roboto&family=Source+Sans+Pro&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ResResult.css">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
int custId = Integer.parseInt(request.getParameter("custId"));

Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = DriverManager.getConnection(url, "c##pro","1234");
Statement stmt = conn.createStatement();

String sql = "select * from Customers where custId=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setInt(1,custId);
ResultSet rs = ps.executeQuery();


String userName = null;
String email = null;
String phoneNo = null;
int headcount = 0;
String tableNo = null;
String msg = null;
Date resDate = null;
String resTime=null;

while(rs.next()){
	userName = rs.getString(2);
	phoneNo = rs.getString(3);
	email = rs.getString(4);		
}

sql = "select * from reservations where custid=?";
ps = conn.prepareStatement(sql);
ps.setInt(1,custId);
rs = ps.executeQuery();

while(rs.next()){
	tableNo = rs.getString(2);
	resDate = rs.getDate(4);
	resTime = rs.getString(5);
	headcount = rs.getInt(8);
	msg = rs.getString(9);
}
%>

	<div class="container">
		<section class="section-resResult">
			<div class="resResult-title">
				<h3>예약이 완료 되었습니다.</h3>
			</div>
			<h4 class="title-h4">예약내역</h4>
			<ul>
				<li><p>이름</p><%=userName%></li>
				<li><p>이메일</p><%=email%></li>
				<li><p>전화번호</p><%=phoneNo%></li>
				<li><p>예약날짜</p><%=resDate%> <%=resTime%></li>
				<li><p>인원 수</p><%=headcount%></li>
				<li><p>테이블 번호</p><%=tableNo%></li>
				<li><p>전달할 메세지</p><%=msg%></li>
			</ul>
			<p style="text-align: center; margin: 30px;">10초 뒤에 홈페이지로 이동합니다.</p>
		</section>
	</div>
	<%
	rs.close();
	ps.close();
	conn.close();
	%>
	<!-- Footer -->  
	<jsp:include page="Footer.jsp"/>
</body>
</html>