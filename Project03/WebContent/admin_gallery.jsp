<%@page import="javax.sql.DataSource"%>
<%@page import="res.Photo"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Gallery</title>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/admin-gallery.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<jsp:useBean id="Photo" class="res.Photo"></jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
	
	%>
 	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "c##pro","1234");

	String sql = "Select * from gallery order by pictureNo asc";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();

	ArrayList<Photo> pl = new ArrayList<Photo>();
	while (rs.next()) {
		pl.add(new Photo(rs.getString(1),rs.getString(2)));
	}
	rs.close();
	ps.close();
	conn.close();
	%>
	<div class="wrapper">
		<jsp:include page="include/left_nav.jsp" flush="false" />
		<div class="main_content">
			<div class="header">
				<p>Gallery management.</p>
				<form name="Insert" action="admin_galleryAddPro.jsp" method="post"
					enctype="multipart/form-data">
					<div class="gallery-addButton">
						<input type="file" name="file"> <input class="select-button" type="submit" value="업로드">					
					</div>
				</form>
			</div>
			<div class="info-gallery">
				<c:set var="list" value="<%=pl%>" />
				<c:forEach var="item" items="${list}">
					<div class="gallery-pictures">
						<img src="upload/${item.pictureName}" alt="해당 이미지 없음" width="25%">
						<p>
							<a href="admin_gallery_change.jsp?pictureNo=${item.pictureNo}" role="button">
								<i class="fas fa-edit"></i>
							</a>
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>