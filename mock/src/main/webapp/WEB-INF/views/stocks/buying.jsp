<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- 숫자서식을 위해 fmt 사용 -->'
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main{
	display:grid;
}
.sub_main{
	display:grid;
	place-items: center;
	width:30%;
	height:100%;
	grid-template-columns:1fr 1fr;
	grid-template-rows:50px repeat(6, 30px);
  	grid-gap:10px;

  	font-size:15px;
  	justify-items:end;
}
.s_name{
	grid-column:1/3;
  	grid-row:1;
	text-decoration: underline;
	text-underline-position: under;/*텍스트 밑의 밀줄을 간격을 좀 더 띄움*/
	margin-bottom:50px;
}

.mil_name{
	grid-column:1;
  	grid-row:2;
  	border: 1px solid;
  	width:100%;
  	text-align:right;
  	padding: 3px 0;
}

.mil_num{
	grid-column:2;
  	grid-row:2;
}

.price{
	grid-column:1;
  	grid-row:3;
}

.price_num{
	grid-column:2;
  	grid-row:3;
}

.week{
	grid-column:1;
  	grid-row:4;
}

.week_num{
	grid-column:2;
  	grid-row:4;
}

.sum{
	grid-column:1;
  	grid-row:5;
}

.sum_num{
	grid-column:2;
  	grid-row:5;
}

.cuur_mil{
	grid-column:1;
  	grid-row:6;
}

.cuur_mil_num{
	grid-column:2;
  	grid-row:6;
}

.mock_list{
	grid-column:1;
  	grid-row:7;
}

.submit_ok{
	grid-column:2;
  	grid-row:7;
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
		num = Number($(".n_buying").val());
		mil = Number($("#mileage").val()); //받은 포인트
		curr = Number($("#curr").val()); //매수가
		num--;
		
		if(num<=0){
			alert('최저 매수 갯수는 1주입니다.');
			num =1;
		}
		
		sum_mil = curr*num;
		curr_mil = mil-sum_mil;
		
		$(".n_buying").val(num);
		$(".sum_mil").val(sum_mil);
		$(".curr_mil").val(curr_mil);
		
	});
	$("#plus").click(function(){
		num = Number($(".n_buying").val());
		mil = Number($("#mileage").val());
		curr = Number($("#curr").val());
		var maxbuy=parseInt(${mileage}/${sdto.open});
		num++;
		if(maxbuy<num){
			alert("마일리지 한도 이상을 구매할 수 없습니다.");
			num=maxbuy;
		}
 
		sum_mil = curr*num;
		curr_mil = mil-sum_mil;
		
		$(".n_buying").val(num);
		$(".sum_mil").val(sum_mil);
		$(".curr_mil").val(curr_mil);
	});
}); 

var buyval;
$(function(){//숫자를 직접 입력했을 경우 실시간 계산
	$(".n_buying").on("propertychange change keyup paste input",function(){
		var inputval = $(this).val();
		if(inputval == buyval){
			return;
		}
	buyval = inputval;
	mil = Number($("#mileage").val()); //받은 포인트
	curr = Number($("#curr").val()); //매수가
	
	sum_mil = curr*buyval;
	curr_mil = mil-sum_mil;
	
	$(".sum_mil").val(sum_mil);
	$(".curr_mil").val(curr_mil);
	});
});

function diff_mil(){
	curr_mil= Number($(".curr_mil").val());
	num= Number($(".n_buying").val());
	var maxbuy=parseInt(${mileage}/${sdto.open});
	if(curr_mil<0){ //최종 마일리지의 값이 마이너스가 되면 구매할 수 없다.
		alert("마일리지 한도 이상을 구매할 수 없습니다.");
		num=maxbuy;
		$(".n_buying").val(num);
		num2 = Number($(".n_buying").val());
		mil = Number($("#mileage").val()); //받은 포인트
		curr = Number($("#curr").val()); //매수가
		
		sum_mil = curr*num2;
		curr_mil = mil-sum_mil;
		
		$(".sum_mil").val(sum_mil);
		$(".curr_mil").val(curr_mil);
		return false;
		
	}else if(num==0){
		alert("최소한 하나 이상 구매해야합니다.");
		num=1;
		return false;
	}
	else{
		return true;
	}
}


</script>
<style>

</style>
</head>
<body>
<div id="main" class="main">
	<form class="sub_main" method="post" action="/mock/buying_ok" onsubmit="return diff_mil()">

		<div class="s_name"><h1>${sdto.name} 매수</h1>
		<input type="hidden" name="code" value="${sdto.code}">
		</div>
		<div class="mil_name">포인트</div>
		<div class="mil_num">
			<c:if test="${mileage==0}">
		  	<a href="/mock/invest/in_regi">모의 투자 신청하세요</a>
		  	</c:if>
		  	
		  	<c:if test="${mileage!=0}">
		  	<fmt:formatNumber value="${mileage}"/>
		  	<input id="mileage" type="hidden" value="${mileage}">
		  	 <!--포인트 숫자서식으로 3자리씩 나눔 -->
		  	</c:if>
		</div>
		<div class="price">주당 매수가</div>
		<div class="price_num">
			<fmt:formatNumber value="${sdto.open}"/>
		  	<input id="curr" type="hidden" name="ask_spread" value="${sdto.open}">
		  	<!--매수호가 -->
	  	</div>
		<div class="week">거래주</div>
		<div class="week_num">
		<input type="button" id="minus" class="btn btn-outline-danger btn-sm" value= "-"
		style="font-size:12px;margin-bottom:5px;">
	  	<input type="text" class="n_buying" name="n_buying" value="1" size="4"
	  	style="text-align:right;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>&nbsp;주<!-- 거래개수 -->
	  	<input type="button" id="plus" class="btn btn-outline-danger btn-sm" value="+" 
	  	style="font-size:12px;margin-bottom:5px;">
		</div>
		<div class="sum">거래 합계</div>
		<div class="sum_num">
		<input type="text" name="ask_spread" class="sum_mil" size="4" value="${sdto.open}" readonly
		style="width:150px;text-align:right;">
		</div>
		<div class="cuur_mil">
			남은 마일리지
		</div>
		<div class="cuur_mil_num">
		<c:if test="${mileage==0}">
		  	마일리지 없음
		</c:if>
		 <c:if test="${mileage!=0}">
		  	<input type="text" class ="curr_mil" name="curr_mil" value="${mileage-(sdto.open*diff)}"size="4" readonly
		  	style="width:150px;text-align:right;">	
		  </c:if>
		</div>
		
		<div class="mock_list">
			<a href="/mock/stocks/st_list">주식 목록</a>
		</div>
		
		<div class="submit_ok">
		<c:if test="${mileage!=0}">
			<input class="btn btn-outline-danger btn-sm" type="submit" value="구매">
		</c:if>
		
		</div>
	</form>
</div>
</body>
</html>