<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- 숫자서식을 위해 fmt 사용 -->'
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>buying</title>
<style type="text/css">
.main{
	display:grid;
}
.sub_main{
	display:grid;
	place-items: center;
	width:70%;
	height:100%;
	grid-template-columns:4fr 1fr 2fr;
	grid-template-rows:repeat(7, 1fr)
  	grid-gap: 10px;

}
.s_name{
	grid-column:1;
  	grid-row:1;
}
.graph{
	grid-column:1;
  	grid-row:2/8;
  	justify-items:center;
  	align-self:center;
	background:pink;
}

.mil_name{
	grid-column:2;
  	grid-row:1;
}

.mil_num{
	grid-column:3;
  	grid-row:1;
}

.price{
	grid-column:2;
  	grid-row:2;
}

.price_num{
	grid-column:3;
  	grid-row:2;
}

.week{
	grid-column:2;
  	grid-row:3;
}

.week_num{
	grid-column:3;
  	grid-row:3;
}

.sum{
	grid-column:2;
  	grid-row:4;
}

.sum_num{
	grid-column:3;
  	grid-row:4;
}

.cuur_mil{
	grid-column:2;
  	grid-row:5;
}

.cuur_mil_num{
	grid-column:3;
  	grid-row:5;
}

.ai{
	grid-column:2/4;
  	grid-row:6;
}

.mock_list{
	grid-column:2;
  	grid-row:7;
}

.submit_ok{
	grid-column:3;
  	grid-row:7;
}

</style>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

</head>


<body onload="defaultValue()">
<div id="main" class="main">

	<h1> ${codeName}</h1>
	<div id="point">현재 포인트: ${mileage}</div>
	<div id="1price">1주당 가격 : ${price}</div>
	<div id="total">총 구매 가격 : ${price}</div>
	<div id="balance">남는 포인트:<c:out value="${mileage-price}" />  </div>
	
	
	<form class="sub_main" method="post" action="./buying_ok">
	<input type="hidden" name="userid" value="${sessionScope.userid}">
	<input type="hidden" name="code" value="${code}">
	<input type="hidden" name="ask_spread" value="${price}">
	<select id="buyNum" name="n_buying">
		<c:forEach var="cnt" begin="1" end="${buyLen}">

		<option value="${cnt}"> ${cnt}주</option>
		</c:forEach>
		
	</select>
		<input type="submit" value="구매하기">
	</form>
	

</div>

<script>
$(document).ready(function(){
	
	$("#buyNum").on("change",getValue);
	
});

function defaultValue(){
	
}

function getValue(){
	
	var n_buying= $("#buyNum").val();
	var price = ${price};
	var ask_spread=n_buying*price;
	var mileage=${mileage}-ask_spread;
	$("#total").text("총 구매 가격: "+ask_spread);
	$("#balance").text("남는 포인트: "+mileage);
	$("input[name=ask_spread]").val()=ask_spread;
}
</script>
</body>
</html>