<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="res.Reservation"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Update</title>
<link rel="stylesheet" href="css/res-update-form.css" />
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
String temp = request.getParameter("orderId");
int orderId = Integer.parseInt(request.getParameter("orderId"));

Class.forName("oracle.jdbc.driver.OracleDriver");
String url ="jdbc:oracle:thin:@localhost:1521:xe";

Connection conn = DriverManager.getConnection(url, "c##pro", "1234");
PreparedStatement pstmt;
String sql = "select * from reservations where orderId = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, orderId);
ResultSet rs = pstmt.executeQuery();
while(rs.next()) {
	
%>
    <section class="admin-update-section">
    <form action="admin_res_updatePro.jsp?orderId=<%=orderId %>" method="post">
      <table class="admin-update-table">
        <tr>
          <td colspan="2" id="top-td">예약정보 수정</td>
        </tr>
        <tr>
          <th>주문 번호</th>
          <td><%=orderId %></td>
        </tr>
        <tr>
          <th>테이블 번호</th>
          <td>
            <input type="number" name="tableNo" value="<%=rs.getInt(2)%>" />
          </td>
        </tr>
        <tr>
          <th>고객 번호</th>
          <td><%=rs.getInt(3)%></td>
        </tr>
        <tr>
          <th>예약 날짜</th>
          <td>
            <input type="text" name="resDate" value="<%=rs.getDate(4)%>" />
          </td>
        </tr>
        <tr>
          <th>예약 시간</th>
          <td>
            <input type="text" name="resTime" value="<%=rs.getString(5)%>" />
          </td>
        </tr>
        <tr>
          <th>주문 날짜</th>
          <td><%=rs.getDate(6)%></td>
        </tr>
        <tr>
          <th>예약 진행</th>
          <td>
            <input type="text" name="progress" value="<%=rs.getString(7)%>" />
          </td>
        </tr>
        <tr>
          <th>인원 수</th>
          <td>
            <input type="number" name="headCount" value="<%=rs.getInt(8)%>" />
          </td>
        </tr>
        <tr>
          <th>메세지</th>
          <td><input type="text" name="msg" value="<%=rs.getString(9)%>" /></td>
        </tr>
        <tr>
          <td colspan="2" id="bottom-td"><input type="submit" value="수정하기" id="submit-button"/></td>
        </tr>
      </table>
    </form>
  <%
  } %>
  </section>
</body>
</html>