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
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
var num;
var curr; // 매수가
var mil; // 남아있는 마일리지
var sum_mil; //매수가*주
var curr_mil; // 매수가-sum_mil
$(function(){/*숫자 증감 버튼*/
	$("#minus").click(function(){
		num = Number($(".n_selling").val());
		mil = Number($("#mileage").val()); //받은 포인트
		curr = Number($("#curr").val()); //매수가
		num--;
		
		if(num<=0){
			alert('최저 매수 갯수는 1주입니다.');
			num =1;
		}
		sum_mil = curr*num;
		curr_mil = mil-sum_mil;
		
		$(".n_selling").val(num);
		$(".sum_mil").val(sum_mil);
		$(".curr_mil").val(curr_mil);
		
	});
	$("#plus").click(function(){
		num = Number($(".n_selling").val());
		mil = Number($("#mileage").val());
		curr = Number($("#curr").val());
		num++;
 
		sum_mil = curr*num;
		curr_mil = mil-sum_mil;
		
		$(".n_selling").val(num);
		$(".sum_mil").val(sum_mil);
		$(".curr_mil").val(curr_mil);
	});
}); 
 
</script>
</head>
<body>
<div id="main" class="main">
<form method="post" action="" onsubmit="return stock()">
	<table>
	  <tr>
	  	<td rowspan="7">여긴 차트가 올 거에요</td>
	  	<td>포인트</td>
	  	<td><fmt:formatNumber value="${mileage}"/>
	  	<input id="mileage" type="hidden" value="${mileage}">
	  	</td> <!--포인트 숫자서식으로 3자리씩 나눔 -->
	  </tr>
	  
	  <tr>
	   <td>매수가</td>
	  	<td><fmt:formatNumber value="${sdto.get(0).open}"/>
	  	<input id="curr" type="hidden" value="${sdto.get(0).open}">
	  	</td><!--매수호가 -->
	  </tr>
	  
	  <tr>
	  	<td colspan="2">
	  	<input type="button" id="minus" value= "-">
	  	<input type="text" class="n_selling" name="n_selling" value="1" size="4">주<!-- 거래개수 -->
	  	<input type="button" id="plus" value="+" >
	  	</td>
	  </tr>
	  
	  <tr>
	  	<td colspan="2">
	 	<input type="text" class="sum_mil" size="2" value="${sdto.get(0).open}">
	  	</td>
	  </tr>
	  
	  <tr>
	  	<td colspan="2"><input type="text" class ="curr_mil" name="curr_mil" size="4"></td>
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
</form>
</div>
</html>