<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="res.OrderDates"%>
<%@page import="java.sql.*"%>
<%@page import="res.Reservation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main_content.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

</head>
<body>
	
	<div class="main_content">
		<div class="header"><p>Reservation Module.</p></div>
		<div class="info">
			<div class="main-list1">
				<p class="res-title">reservation</p>
				<div class="table">
					<table class="table-type1">
						<thead>
						<tr>
							<th>주문 번호</th>
							<th>테이블 번호</th>
							<th>고객 번호</th>
							<th>예약 날짜</th>
							<th>예약 시간</th>
							<th>주문 날짜</th>
							<th>예약 진행</th>
							<th>인원 수</th>
							<th>메세지</th>
						</tr>
						</thead>

<%
ArrayList<Reservation> resList = new ArrayList<Reservation>();

Class.forName("oracle.jdbc.driver.OracleDriver");
String url ="jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = DriverManager.getConnection(url, "c##pro", "1234");
PreparedStatement pstmt;
ResultSet rs =null;
String sql = "select * from reservations where rownum < 4 order by resdate desc";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()) {
	Reservation reservation = new Reservation();
	resList.add(new Reservation(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getString(5),rs.getDate(6), rs.getString(7), rs.getInt(8), rs.getString(9)));
	
}
/* rs.close();
pstmt.close();
conn.close(); */
%>
<%

String yearDateOri = "";
yearDateOri = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());
int yearDate = Integer.parseInt(yearDateOri);

String weekDate = "";
ArrayList<OrderDates> weekDates = new ArrayList<>();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
String tempDate =  sf.format(new Date());
Date currentTime = sf.parse(tempDate);
Calendar cal = Calendar.getInstance();
cal.setTime(currentTime);
weekDate = sf.format(cal.getTime());

ArrayList<OrderDates> monthDates = new ArrayList<>();
for (int i = 1; i < 13; i++) 
{
	monthDates.add(new OrderDates(Integer.toString(i)));
}
%>


<c:set var="orderArray" value="<%=weekDates %>"/>
<%
Date beforeDate = sf.parse(weekDate); /* 증가할 date값 */
cal.setTime(beforeDate);
cal.add(Calendar.DATE, -6);/* 마이너스 핻야됨!!! */
beforeDate = cal.getTime();
for(int i=0; i<7; i++) {
	weekDates.add(new OrderDates(beforeDate));
	cal.add(Calendar.DATE, 1);
	beforeDate = cal.getTime();
}/* 요청받은 값으로 7일 출력 */
/* cal.add(Calendar.DATE, 7); */
sql = "select resdate from reservations where resdate between ? and ?";
pstmt = conn.prepareStatement(sql);
pstmt.setDate(1, new java.sql.Date(weekDates.get(0).getOrderDate().getTime()));
pstmt.setDate(2, new java.sql.Date(weekDates.get(6).getOrderDate().getTime()));
rs = pstmt.executeQuery();
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

%>

<c:set var="monthArray" value="<%=monthDates%>" />
	<%
	sql="select ltrim(to_char(resdate,'MM'),'0') res_month from reservations "+ 
								"where to_char(resdate,'YYYY')=? order by ltrim(to_char(resdate,'MM'),'0')";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, yearDate);
	rs=pstmt.executeQuery();
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
			loop++;
		</c:forEach>


		google.charts.load('current', {packages : [ 'corechart', 'bar' ]});
		google.charts.setOnLoadCallback(drawMultSeries1);
		google.charts.setOnLoadCallback(drawMultSeries2);

		function drawMultSeries1() {

			var data1 = google.visualization.arrayToDataTable([
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
					width : 310,
	  				height : 270,				
			};

			var chart = new google.visualization.PieChart(document.getElementById('chart_div1'));
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
		        title: '방문 분석',
		        width:310,
		        height:270
		      };
		 
				var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
				chart.draw(data2, options);
		    }
		
		
	</script>
	


				<c:set var="list2" value="<%=resList %>" />
				<tbody>
				<c:forEach var="item" items="${list2 }">
					
						<tr>
							<td class="td-short">${item.orderId }</td>
							<td>${item.tableNo }</td>
							<td class="td-short">${item.custId }</td>
							<td>${item.resDate }</td>
							<td>${item.resTime }</td>
							<td>${item.orderDate }</td>
							<td>${item.progress }</td>
							<td class="td-short">${item.headCount }</td>
							<td>${item.msg }</td>
						</tr>
						
					
				</c:forEach>
					<tr >
						<td colspan="9" ><a href="admin_res_list.jsp" class="more">-더보기-</a></td>
					</tr>
					</tbody>
					
				</table>	
			</div>		
		</div>
		<div class="graph-grid">
			<div class="graph-item first">
				<p class="graph-title">월간 예약 건수</p>
				<div id="chart_div1"></div>				
			</div>
			
			<div class="graph-item two">
				<p class="graph-title">주간 예약 건수</p>
				<div id="chart_div2"></div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>