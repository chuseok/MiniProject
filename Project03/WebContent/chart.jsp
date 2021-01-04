<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/chart.css">
<script src="${pageContext.request.contextPath}/js/dateSubmit.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="include/left_nav.jsp" flush="false"/>
		<div class="main_content">
			<div class="info">
			  <div class="date-section">
			  	<input class="tabs" id="month-radio" type="radio" name="sub_nav" checked="checked">
			    <input class="tabs" id="day-radio" type="radio" name="sub_nav">
			    <input class="tabs" id="sex-radio" type="radio" name="sub_nav">
			    
			  	<div class="date-menu">
			  		<div>
			            <label class="label" for="month-radio">Month</label>
			            <label class="label" for="day-radio">Week</label>
		        	</div>
			  	</div>
			  	<div class="date-submenu">
			  	<section>
			  		<jsp:include page="./chart_month.jsp" flush="false"/>
			  		<jsp:include page="./chart_month_result.jsp" flush="false"/>
			  		</section>
			  	</div>
			  	<div class="date-submenu">
			  		<jsp:include page="./chart_week.jsp" flush="false"/>
			  		<jsp:include page="./chart_week_result.jsp" flush="false"/>
			  	</div>
			  </div>
			</div>
	    </div>
    </div>
<script>
$(document).ready(function(){
    if(localStorage.selected) {
      $('#' + localStorage.selected ).attr('checked', true);
    }
    $('.tabs').click(function(){
      localStorage.setItem("selected", this.id);
    });
  });
</script>
</body>
</html>