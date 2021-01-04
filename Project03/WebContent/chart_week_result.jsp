
<%@page import="res.OrderDates"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.*"%>
<%@page import="java.util.Date"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart Week</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
String date = request.getParameter("valueDate");

ArrayList<OrderDates> orderDates = new ArrayList<>();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
</head>
<body>
<c:set var="orderArray" value="<%=orderDates %>"/>
<%
if(date == null) {
	String tempDate =  sf.format(new Date());
	Date currentTime = sf.parse(tempDate);
	Calendar cal = Calendar.getInstance();
	cal.setTime(currentTime);
	//week에서 현재값 보내주면 지우기
	date = sf.format(cal.getTime());
	
}
/* session.setAttribute("hiddenWeek", date);
out.print("hidden set : " + date); */
Date beforeDate = sf.parse(date); /* 증가할 date값 */
Calendar cal = Calendar.getInstance();
cal.setTime(beforeDate);
cal.add(Calendar.DATE, -6);/* 마이너스 핻야됨!!! */
beforeDate = cal.getTime();
for(int i=0; i<7; i++) {
	orderDates.add(new OrderDates(beforeDate));
	cal.add(Calendar.DATE, 1);
	beforeDate = cal.getTime();
}/* 요청받은 값으로 7일 출력 */
/* cal.add(Calendar.DATE, 7); */

Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";

Connection conn = DriverManager.getConnection(url, "c##pro", "1234");
PreparedStatement pstmt;
String sql="select resdate from reservations where resdate between ? and ?";
pstmt=conn.prepareStatement(sql);

pstmt.setDate(1, new java.sql.Date(orderDates.get(0).getOrderDate().getTime()));
pstmt.setDate(2, new java.sql.Date(orderDates.get(6).getOrderDate().getTime()));
ResultSet rs = pstmt.executeQuery();
if(rs!=null) {
while(rs.next()) {
%>

<c:set var="stdOrderDate" value="<%=rs.getDate(1) %>"/>
<%-- 배열값 : ${orderArray[0].orderDate } <br>
디비에서 가져온 값 : <%=rs.getDate(1) %> <br> --%>
<c:forEach var="item" items="${orderArray }">
	<c:if test="${item.orderDate eq stdOrderDate}">
		<c:set target="${item }" property="resCount" value="${item.resCount + 1 }"/>
	</c:if>
<%-- 	${item.orderDate } <br>
	${item.resCount } <br> --%>
</c:forEach>
<%
}
} else {
	out.println("rs is null");
}
rs.close();
pstmt.close();
conn.close();

%>
<%-- <c:set var="orderArray" value="<%=orderDates %>"/> --%>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
let date =new Date('<%=date%>');

/* var array = []; */
/* var array2 = new Array(); */
var orderArray = [];
var loop=0;

<c:forEach items="${orderArray}" var="item1">
	orderArray[loop] = {
			orderDate:"${item1.orderDate}",
			resCount:"${item1.resCount}"
	};
	/* document.write("${item1.orderDate}"); */
	/* array2.push("${item1.resCount}"); */
	loop++;
</c:forEach>



/* for(var i=0; i<7; i++) {
	array.push(date.toLocaleString());
	date.setDate(date.getDate() + 1);
}
 */
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawMultSeries2);
 
function drawMultSeries2() {
	
    var data2 = google.visualization.arrayToDataTable([
      ['예약 시간대', '예약자 수', { role: 'style' }],
      [orderArray[0].orderDate, parseInt(orderArray[0].resCount), 'opacity: 0.2'],
      [orderArray[1].orderDate, parseInt(orderArray[1].resCount), 'opacity: 0.2'],
      [orderArray[2].orderDate, parseInt(orderArray[2].resCount), 'opacity: 0.2'],
      [orderArray[3].orderDate, parseInt(orderArray[3].resCount), 'opacity: 0.2'],
      [orderArray[4].orderDate, parseInt(orderArray[4].resCount), 'opacity: 0.2'],
      [orderArray[5].orderDate, parseInt(orderArray[5].resCount), 'opacity: 0.2'],
      [orderArray[6].orderDate, parseInt(orderArray[6].resCount), 'opacity: 0.2']
    ]);
    

    var options = {
      title: '주간별 분석',
      width:1600,
      height:650
    };

		var chart2 = new google.visualization.ColumnChart(document
				.getElementById('chart_div2'));
		chart2.draw(data2, options);
  }
   </script>
<div id="chart_div2"></div>
</html>