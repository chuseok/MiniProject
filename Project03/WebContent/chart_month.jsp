<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart Month</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/dateSubmit.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<form>
		<%
		SimpleDateFormat sf = new SimpleDateFormat("yyyy");
		ArrayList<String> yearArray = new ArrayList<>();
		String hidden = (String) request.getParameter("input-date");
		Date yearDate = new Date();
		String currentYear = sf.format(yearDate);
		if (hidden == null) {
			hidden = currentYear;
		}
			
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = DriverManager.getConnection(url, "c##pro", "1234");
		PreparedStatement pstmt;
		String sql = "select to_char(resdate,'YYYY') from reservations group by to_char(resdate,'YYYY')order by to_char(resdate,'YYYY') desc";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs = pstmt.executeQuery();
		while (rs.next()) {
			yearArray.add(rs.getString(1));
		%>
		<%
			}

			rs.close();
			pstmt.close();
			conn.close();
		%>
		<c:set var="hidden" value="<%=hidden%>"></c:set>
		<select class="select-box1" id="input-date" name="input-date">
			<c:set var="yearList" value="<%=yearArray%>" />
			<c:forEach items="${yearList}" var="year">
				<option value="${year }"
					<c:if test='${year eq hidden}'>selected</c:if>>${year }</option>
			</c:forEach>
		</select>
		${year } 
		<input type="hidden" id="hidden" name="hidden" value="${year }"> 
		<input class="select-button" type="submit" value="Submit" onclick="formaction='chart_mon_result.jsp'">
	</form>
	<jsp:include page="chart_month_result.jsp" flush="false" />
	<script>
		/* 	$(document).ready(function() {
		 $('#input-date').change(dateChange);
		 });
		
		 function dateChange() {
		 var inputDate = $('#input-date option:selected').val();
		 $('input#hidden').val(inputDate);
		 }; */
	</script>
</body>
</html>