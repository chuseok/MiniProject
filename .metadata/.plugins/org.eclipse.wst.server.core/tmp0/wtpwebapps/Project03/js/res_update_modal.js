var vs = 0;
var action='';
var type='';
var action='';
$(document).ready(function(){
	$("#modify").click(function(){
		action='modify';
		type="PUT";
		orderId = this.value;
		
		var row = $(this).parent().parent().parent('tr');
		var td = row.children();
	
		
		var tableNo = td.eq(1).text();
		var custId =  td.eq(2).text();;
		var resDate = td.eq(3).text();
		var resTime = td.eq(4).text();
		var orderDate = td.eq(5).text();
		var progress = td.eq(6).text();
		var headCount = td.eq(7).text();
		var msg = td.eq(8).text();
		
		$("#modal-title").text("수정");
		
		$("#orderId").val(orderId);
		$("#tableNo").val(tableNo);
		$("#custId").val(custId);
		$("#resDate").val(resDate);
		$("#resTime").val(resTime);
		$("#orderDate").val(orderDate);
		$("#progress").val(progress);
		$("#headCount").val(headCount);
		$("#msg").val(msg);
		
		$('#MyModal').show();
	});
		$('#MyModal').on('hidden.bs.modal', function () {
		    $(this).find('form').trigger('reset');
		    $(".modal-body input").val("")

		})
})