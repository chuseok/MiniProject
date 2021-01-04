<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart Week</title>
</head>
<body>
	<form method="post">
		<input class="input-day" id="input-day" type="date" name="valueDate" value="">
		<input type="hidden" id="hidden" name="hidden" value="">
		<input class="select-button" id="submit" type="submit" value="조회" onclick="formaction='chart_res.jsp'">
	</form>
	<jsp:include page="./chart_week_result.jsp" flush="false"/>
</body>
</html>