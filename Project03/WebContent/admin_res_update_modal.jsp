<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/res_update_modal.js"></script>

</head>
<body>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
	
		<!-- Modal content-->
		<div class="modal-content">
		
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 id="modal-title" class="modal-title"></h4>
			</div>
			
			<div class="modal-body">
				<table class="table">
					<tr>
						<td>주문 번호</td>
						<td><b><input type="number" name="orderId" id="orderId" readonly></b></td>
					</tr>
					<tr>
						<td>테이블 번호</td>
						<td><input type="text" name="tableNo" id="tableNo"></td>
					</tr>
					<tr>
						<td>고객 번호</td>
						<td><b><input type="number" name="custId" id="custId" readonly></b></td>
					</tr>
					<tr>
						<td>예약 날짜</td>
						<td><input type="text" name="resDate" id="resDate"></td>
					</tr>
					<tr>
						<td>예약 시간</td>
						<td><input type="text" name="resTime" id="resTime"></td>
					</tr>
					<tr>
						<td>주문 날짜</td>
						<td><input type="text" name="orderDate" id="orderDate" readonly></td>
					</tr>
					<tr>
						<td>예약 진행</td>
						<td><input type="text" name="progress" id="progress"></td>
					</tr>
					<tr>
						<td>인원 수</td>
						<td><input type="number" name="headCount" id="headCount"></td>
					</tr>
					<tr>
						<td>메세지</td>
						<td><textarea name="msg" id="msg"></textarea></td>
				</table>
			</div>
			
			<div class="modal-footer">
			<button id="modalSubmit" type="button" class="btn btn-success">Submit</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
		</div>
	</div>
</div>
</body>
</html>