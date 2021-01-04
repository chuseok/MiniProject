<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="https://jonthornton.github.io/jquery-timepicker/jquery.timepicker.js"></script>
<link rel="stylesheet" type="text/css" href="https://jonthornton.github.io/jquery-timepicker/jquery.timepicker.css">
</head>
<body>
<body>
  <section class="reservation">
    <div class="container__reserv">
      <h2 class="h2">예약하기 </h2>      
      <div class="table__wrap">
        <div class="reservation-content">
          <form  name="reservForm" action="resPro.jsp" method="post" >
            <p class="table__text">이름</p>
             <input class="table__inp" type="text" name="userName" required>
            <p class="table__text">이메일</p>
             <input class="table__inp" type="email" name="email" required >
            <p class="table__text">전화번호</p>
              <input class="table__inp"type="tel" name="phoneNo"required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
                type="###-####-####" placeholder="ex) 010-0000-0000">
            <p class="table__text">예약 날짜</p>
              <input class="table__inp"type='date' name='resDate'>
            <p class="table__text">예약 시간</p>
              <input class="table__inp"type="datetime" name="resTime" id="timepicker"min="10:00" max="18:00" step="1800"
              placeholder="예약할 시간을 선택해주세요"oninvalid="alert('예약 시간은 10 ~ 18시 30분 단위여야 합니다.')" required>
            <p class="table__text">인원 수</p>
              <select class="table__inp"name="headcount">
                <option value="1" selected>1명</option>
                <option value="2">2명</option>
                <option value="3">3명</option>
                <option value="4">4명</option>
                <option value="5">5명</option>
                <option value="6">6명</option>
                <option value="7">7명</option>
                <option value="8">8명</option>
              </select>
            <p class="table__text" id="table-No">테이블 번호</p>
            <select class="table__inp"name="tableNo">
              <option value="1" selected>1번</option>
              <option value="2">2번</option>
              <option value="3">3번</option>
              <option value="4">4번</option>
              <option value="5">5번</option>
            </select>
            <p class="table__text">전달 할 메세지</p>
            <textarea rows="4"cols="46" name="msg"></textarea>
            <button type="button" class="submit" name = "resButton" onclick= "doReserv()">예약하기</button>
          </form>
        </div>
      </div>
    </div>
  </section>
<script type="text/javascript">
	function doReserv(){
		if(confirm("예약하시겠습니까?")) {
			document.reservForm.submit();
		} else {document.reservForm.reset();}
	}
</script>
<script>
$("#timepicker").timepicker({
	'minTime': "10:00am",
	'maxTime': '20:00pm',
	step: 30,
	timeFormat: "H:i A"
});

</script>
</body>


</body>
</html>