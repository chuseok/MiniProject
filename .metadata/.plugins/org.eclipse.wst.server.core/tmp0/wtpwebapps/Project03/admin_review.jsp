<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="res.Review"%>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Review List</title>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/reservation.css">

</head>
<body>

	<jsp:useBean id="product" class="res.Review" scope="request" />
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = DriverManager.getConnection(url, "c##pro","1234");
Statement stmt = conn.createStatement();

String sql = "select * from reviews order by rateDate desc";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

Review review = new Review();

ArrayList<Review> reviewList = new ArrayList<Review>();


while(rs.next()) {
	review = new Review(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getString(4));
	reviewList.add(review);
	}
rs.close(); ps.close(); conn.close();

%>
	<div class="wrapper">
		<jsp:include page="include/left_nav.jsp" flush="false" />
		<div class="main_content">
			<div class="header"><p>Reviews</p></div>
			<div class="info">
				<div class="table">
					<table class="table-type1">
						<thead>

							<tr>
								<th>메세지</th>
								<th>별점</th>
								<th>성별</th>
								<th>연령</th>
							</tr>
						</thead>

						<c:set var="list" value="<%=reviewList%>" />
						<c:forEach var="item" items="${list }">
							<tbody>
								<tr>
									<td>${item.rateMsg }</td>
									<td>${item.rateStar }</td>
									<td>${item.gender }</td>
									<td>${item.age }</td>
								</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>