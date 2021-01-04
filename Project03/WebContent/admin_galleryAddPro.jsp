<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="Photo" class="res.Photo"></jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<%@ page import="res.Photo"%>
	<%
	String path = application.getRealPath("/upload");
	int size = 800 * 800 * 10;
	MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
	String pictureNo = multi.getParameter("pictureNo");
	Enumeration files = multi.getFileNames();
	String name = (String) files.nextElement();
	String pictureName = multi.getOriginalFileName(name);
	%>
	
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "c##pro", "1234");
	String sql = "INSERT INTO gallery VALUES(pic_seq.NEXTVAL,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,pictureName);
	pstmt.executeUpdate();
	response.sendRedirect("admin_gallery.jsp");
	%>
</body>
</html>