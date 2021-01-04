<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send an e-mail</title>
</head>
<body>
<%

	String subject ="shcool Food";
	String content ="enjoy?\nhttp://192.168.0.135:8085/Project03/reviewFrm.html";

	String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
	String userId ="c##pro"; 
	String userPwd = "1234";

	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	Connection conn = DriverManager.getConnection(url, userId, userPwd); 
	PreparedStatement pstmt;
	String sql = "Select email ,resdate from reservations r, customers c where r.custid = c.custid order by resdate"; 
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String currDate =  dateFormat.format(new Date());
		Date currentTime = dateFormat.parse(currDate);
		Date tempDate = rs.getDate(2);
		Calendar selectedTime = Calendar.getInstance();
		selectedTime.setTime(tempDate);
		selectedTime.add(Calendar.DATE, 1);
		int dateFlag = selectedTime.getTime().compareTo(currentTime);
 		System.out.println("sql : " + selectedTime.getTime() + "<br>");
 		System.out.println("현재 시간 : " + currentTime + "<br>");
		if(dateFlag == 0) {
		
		System.out.println(rs.getString(1));
		%>
		<jsp:forward page="/EmailSendingServlet">
			<jsp:param name="recipient" value="<%=rs.getString(1) %>"/>
			<jsp:param name="subject" value="<%=subject %>"/>
			<jsp:param name="content" value="<%=content %>"/>
		</jsp:forward>
		<%
		}
	}
	

%>

<!--     <form action="EmailSendingServlet" method="post">
        <table border="0" width="35%" align="center">
            <caption><h2>Send New E-mail</h2></caption>
            <tr>
                <td width="50%">Recipient address </td>
                <td><input type="text" name="recipient" size="50"/></td>db에서 가져와
            </tr>
            <tr>
                <td>Subject </td>
                <td><input type="text" name="subject" size="50"/></td>정해진 값
            </tr>
            <tr>
                <td>Content </td>
                <td><textarea rows="10" cols="39" name="content">오늘</textarea> </td> 정해진 값
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Send"/></td>
            </tr>
        </table>
         
    </form> -->
</body>
</html>