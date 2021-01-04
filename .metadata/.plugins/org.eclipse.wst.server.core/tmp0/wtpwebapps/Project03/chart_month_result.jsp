<%@page import="res.OrderDates"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart Month</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
String yearDateOri = request.getParameter("input-date");
if (yearDateOri == null ||yearDateOri == "") 
{
	yearDateOri = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());
}
/* out.println(yearDateOri); */
int yearDate = Integer.parseInt(yearDateOri);

ArrayList<OrderDates> monthDates = new ArrayList<>();
for (int i = 1; i < 13; i++) 
{
	monthDates.add(new OrderDates(Integer.toString(i)));
}
/* for(int i = 0; i<orderDates.size(); i++){
	out.println(orderDates.get(i).getOrderMonth());
} */
%>
</head>

<body>

<c:set var="monthArray" value="<%=monthDates%>" />

	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";

	Connection conn = DriverManager.getConnection(url, "c##pro", "1234");
	PreparedStatement pstmt;
	String sql="select ltrim(to_char(resdate,'MM'),'0') res_month from reservations "+ 
								"where to_char(resdate,'YYYY')=? order by ltrim(to_char(resdate,'MM'),'0')";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, yearDate);
	ResultSet rs=pstmt.executeQuery();
	if (rs!=null) 
	{
		while (rs.next()) 
		{
			%>
	<c:set var="selectedMonth" value="<%=rs.getString(1)%>" />
	<c:forEach var="item" items="${monthArray }">
		<c:if test="${item.orderMonth eq selectedMonth}">
			<c:set target="${item }" property="resCount"
				value="${item.resCount + 1 }" />
		</c:if>
	</c:forEach>
	<%
		}
	} 	
	else 
	{
		out.println("rs is null");
	}
	
	rs.close(); pstmt.close(); conn.close();
	%>


	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		var monthArray = [];
		var loop = 0;
		<c:forEach items="${monthArray}" var="item1">
			monthArray[loop] = {
				orderMonth : "${item1.orderMonth}월",
				resCount : "${item1.resCount}"
			};
			loop++;
		</c:forEach>
		
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

		google.charts.load('current', {packages : [ 'corechart', 'bar' ]});
		google.charts.setOnLoadCallback(drawMultSeries1);
		google.charts.setOnLoadCallback(drawMultSeries2);
		 

		function drawMultSeries1() {

			var data1 = google.visualization
					.arrayToDataTable([
							[ '예약 시간대', '예약자 수', {role : 'style'} ],
							[ monthArray[0].orderMonth,parseInt(monthArray[0].resCount),'opacity: 0.2' ],
							[ monthArray[1].orderMonth,parseInt(monthArray[1].resCount),'opacity: 0.2' ],
							[ monthArray[2].orderMonth,parseInt(monthArray[2].resCount),'opacity: 0.2' ],
							[ monthArray[3].orderMonth,parseInt(monthArray[3].resCount),'opacity: 0.2' ],
							[ monthArray[4].orderMonth,parseInt(monthArray[4].resCount),'opacity: 0.2' ],
							[ monthArray[5].orderMonth,parseInt(monthArray[5].resCount),'opacity: 0.2' ],
							[ monthArray[6].orderMonth,parseInt(monthArray[6].resCount),'opacity: 0.2' ],
							[ monthArray[7].orderMonth,parseInt(monthArray[7].resCount),'opacity: 0.2' ],
							[ monthArray[8].orderMonth,parseInt(monthArray[8].resCount),'opacity: 0.2' ],
							[ monthArray[9].orderMonth,parseInt(monthArray[9].resCount),'opacity: 0.2' ],
							[ monthArray[10].orderMonth,parseInt(monthArray[10].resCount),'opacity: 0.2' ],
							[ monthArray[11].orderMonth,parseInt(monthArray[11].resCount),'opacity: 0.2' ]
					]);

			var options = {
					title: '월별 분석',
					width : 1600,
	  			height : 650,
									
			};

			var chart = new google.visualization.ColumnChart(document
					.getElementById('chart_div1'));
			chart.draw(data1, options);
		}
		

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
			    height:1500
			};

			var chart2 = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
			chart2.draw(data2, options);
			}
		
	</script>
	<div class="chart-content">
		<div id="chart_div1"></div>
	</div>
</body>
</body>
</html>