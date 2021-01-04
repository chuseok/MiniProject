  var count;
  
  function starmark(item)
  {
	  count=item.id[0];
	  sessionStorage.starRating = count;
	  var subid= item.id.substring(1);
	  for(var i=0;i<5;i++)
	  {
		  if(i<count)
		  {
			  document.getElementById((i+1)+subid).style.color="orange";
			  document.reviewform.starRate.value = count;
		  }
		  else
		  {
			  document.getElementById((i+1)+subid).style.color="black";
		  }
	  }
  }

  function checkForm() {
/*	  var rateComment = document.reviewform.comment
*/	  if(comment.value.length<=3) {
		  window.alert("3자 이상 입력하세요.")
		  return false;
	  }
	  else if(count == "" || count == null ||count ==undefined) {
		  window.alert("별점을 선택해 주세요.")
		  return false;
	  }
	  return true;
  }  

  function resultAlert() {
	  alert('감사합니다!')
  }