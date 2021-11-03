<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- 숫자서식을 위해 fmt 사용 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main{
	display:grid;
	place-items: center;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){/*숫자 증감 버튼*/
	$(function(){
		$('#minus').click(function(){
			var selling = $('.n_selling').val();
			var num = parseInt(selling,10);
			num--;
			if(num<0){
				alert('매수 할 수 없는 갯수 입니다.');
				num =1;
			}
			$('.n_selling').val(num);
		});
		$('#plus').click(function(){
			var selling = $('.n_selling').val();
			var num = parseInt(selling,10);
			num++;
			$('.n_selling').val(num);
		});
	});
});

$(function(){
$(".n_selling").on("change keyup paste", function(){
	alert("change");
});
});
</script>
</head>
<body>
<div id="main" class="main">
	<table>
	  <tr>
	  	<td rowspan="7">여긴 차트가 올 거에요</td>
	  	<td>포인트</td>
	  	<td><fmt:formatNumber value="${mileage}"/></td> <!--포인트 숫자서식으로 3자리씩 나눔 -->
	  </tr>
	  
	  <tr>
	   <td>매수가</td>
	  	<td><fmt:formatNumber value="${sdto.get(0).bid}"/></td><!--매수호가 -->
	  </tr>

	  <tr>
	  	<td colspan="2">
	  	<input type="button" id="minus" value="-">
	  	<input type="text" class="n_selling" name="n_selling" value="0" size="2">주<!-- 거래개수 -->
	  	<input type="button" id="plus" value="+">
	  	</td>
	  </tr>
	  
	  <tr>
	  	<td colspan="2"><span class="full_sel"></span></td>
	  </tr>
	  
	  <tr>
	  	<td colspan="2"><span class="full_point"></span></td>
	  </tr>
	  
	  <tr>
	  	<td colspan="2">ai 한마디?</td>
	  </tr>
	  
	  <tr>
	  	<td colspan="2">
	  		<input type="submit" value="구매">
	  	</td>
	  </tr>

	</table>
</div>
</html>