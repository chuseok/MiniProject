<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="res.Photo"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/gallery.css">
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<section class="section-gallery" id="section_Gallery">
		<div class="gallery-content">

			<jsp:useBean id="Photo" class="res.Photo"></jsp:useBean>

			<%			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = DriverManager.getConnection(url, "c##pro", "1234");
			Statement stmt = conn.createStatement();

			String sql = "Select * from Gallery order by pictureNo asc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			rs = ps.executeQuery();
			ArrayList<Photo> pl = new ArrayList<Photo>();
			while (rs.next()) {
				pl.add(new Photo(rs.getString(1), rs.getString(2)));
			}
			rs.close();
			ps.close();
			conn.close();
%>

			<div class="pic">
				<c:set var="list" value="<%=pl%>" />
				<c:forEach var="item" items="${list}">

					<img src="upload/${item.pictureName}" class="button" alt="해당 이미지 없음" width="300" height="300">

					<div class="bg-modal">
						<img class="modal-content" src="upload/${item.pictureName}" alt="">
						<div class="close">&times;</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<script src="js/gallery.js"></script>
</body>
</html>