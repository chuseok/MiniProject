<%@page import="java.util.ArrayList"%>
<%@page import="res.Photo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gallery Update</title>
<style>
.gallery-pic{
	width:700px;
	overflow:hidden;
}
</style>
</head>
<body>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<jsp:useBean id="Photo" class="res.Photo"
		scope="request" />
	<%
		String pictureNo = request.getParameter("pictureNo");
	
	%>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "c##pro", "1234");
	String sql = "Select * from Gallery where pictureNo=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pictureNo);
	ResultSet rs = pstmt.executeQuery();
	ArrayList<Photo> pl = new ArrayList<Photo>();
	while (rs.next()) {
		pl.add(new Photo(rs.getString(1),rs.getString(2)));
		
	}
	rs.close();
	pstmt.close();
	conn.close();
	%>
	<form action="admin_gallery_changePro.jsp" method="post"
		enctype="multipart/form-data">
		<c:set var="list" value="<%=pl%>" />
		<c:forEach var="item" items="${list}">
		<div class="gallery-pic">
			<img src="upload/${item.pictureName}" alt="해당 이미지 없음" width="50%">
		</div>	
			<p>
				<input type="file" name="file"> <input type="hidden" name=pictureNo value="${item.pictureNo}">
				<INPUT type="submit" value="완료">
			</p>
			<p>
				<input type="hidden" name=pictureNo value="${item.pictureNo}">
			</p>
		</c:forEach>

	</form>
</body>
</html>