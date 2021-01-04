<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="Menu" class="res.Photo"></jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
	
	%>
	<%@ page import="res.Photo"%>
	<%
	String path = application.getRealPath("upload");
	int size = 1024 * 1024 * 10;
	MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
	String pictureNo = multi.getParameter("pictureNo");
	Enumeration files = multi.getFileNames();
	String name = (String) files.nextElement();
	String pictureName = multi.getOriginalFileName(name); 
	out.println(pictureNo);
	out.println(pictureName);
	%>
	
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "c##pro", "1234");
	String sql = "UPDATE gallery set pictureName=? WHERE pictureNo=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(2, pictureNo);
	pstmt.setString(1, pictureName);
	
	pstmt.executeUpdate();
	response.sendRedirect("admin_gallery.jsp");
	%>
</body>
</html>