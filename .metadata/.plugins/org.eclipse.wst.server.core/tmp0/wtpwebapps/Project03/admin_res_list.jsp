<%@page import="res.Reservation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Reservation List</title>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/reservation.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
    <div class="wrapper">
	
	<jsp:include page="include/left_nav.jsp" flush="false"/>
	<div class="main_content">
	<div class="header"><p>Reservation Status.</p></div>
	<div class="info">
		<div class="table">
		<form action="admin_res_updatePro.jsp" method="post">
			<table class="table-type1">
				<thead>
				<tr>
					<th>주문 번호</th>
					<th>테이블 번호</th>
					<th>고객 번호</th>
					<th>예약 날짜</th>
					<th>예약 시간</th>
					<th>주문 날짜</th>
					<th>예약 진행</th>
					<th>인원 수</th>
					<th>메세지</th>
					<th></th>
					<th></th>
				</tr>
				</thead>
<%
ArrayList<Reservation> resList = new ArrayList<Reservation>();

Class.forName("oracle.jdbc.driver.OracleDriver");
String url ="jdbc:oracle:thin:@localhost:1521:xe";

Connection conn = DriverManager.getConnection(url, "c##pro", "1234");
PreparedStatement pstmt;
ResultSet rs =null;
String sql = "select * from reservations order by resdate desc";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()) {
	Reservation reservation = new Reservation();
	resList.add(new Reservation(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getString(5),rs.getDate(6), rs.getString(7), rs.getInt(8), rs.getString(9)));
	
}
rs.close();
pstmt.close();
conn.close();
%>

				<c:set var="list" value="<%=resList %>" />
				<c:forEach var="item" items="${list }">
					<tbody>
						<tr>
							<td class="td-short">${item.orderId }</td>
							<td>${item.tableNo }</td>
							<td class="td-short">${item.custId }</td>
							<td>${item.resDate }</td>
							<td>${item.resTime }</td>
							<td>${item.orderDate }</td>
							<td>${item.progress }</td>
							<td class="td-short">${item.headCount }</td>
							<td>${item.msg }</td>
							<td colspan="3">
							<div class="button-group1">
							<button class="button-1" type="submit" formaction='admin_res_delete.jsp?orderId=${item.orderId }'>삭제</button>
							<button class="button-3" type="submit" formaction='admin_res_updateFrm.jsp?orderId=${item.orderId }'>수정</button>
							</div>
							</td>
						</tr>
					</tbody>				
				</c:forEach>
			</table>
		</form>	
		</div>
	</div>
	</div>
	</div>
</body>
</html>