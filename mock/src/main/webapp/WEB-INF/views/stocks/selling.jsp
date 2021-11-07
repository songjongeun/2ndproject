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
<script>
var num;
var curr; // 매도가
var mil; // 남아있는 마일리지
var sum_mil; //매수가*주
var curr_mil; // 매도가+sum_mil
var diff = Number($(".diff").val());; //매수의 총합
$(function(){/*숫자 증감 버튼*/
	$("#minus").click(function(){
		num = Number($(".n_selling").val());
		mil = Number($("#mileage").val()); //받은 포인트
		curr = Number($("#curr").val()); //매도가
		num--;
		
		if(num<=0){
			alert('최저 매도 갯수는 1주입니다.');
			num =1;
		}
		sum_mil = curr*num;
		curr_mil = mil+sum_mil;
		
		$(".n_selling").val(num);
		$(".sum_mil").val(sum_mil);
		$(".curr_mil").val(curr_mil);
		
	});
	 $("#plus").click(function(){
	      num = Number($(".n_selling").val());
	      mil = Number($("#mileage").val());
	      curr = Number($("#curr").val());
	      diff = Number($(".diff").val());
	      num++;
	      if(num>diff){
	         alert("가지고 있는 주 이상을 매도할 수 없습니다.");
	         num=diff;
	      }

	      else{
	         sum_mil = curr*num;
	         curr_mil = mil+sum_mil;
	         
	         $(".n_selling").val(num);
	         $(".sum_mil").val(sum_mil);
	         $(".curr_mil").val(curr_mil);
	      }
	   });
	}); 


var sellval;
$(function(){//숫자를 직접 입력했을 경우 실시간 계산
	$(".n_selling").on("propertychange change keyup paste input",function(){
		var inputval = $(this).val();
		if(inputval == sellval){
			return;
		}
	sellval = inputval;
	mil = Number($("#mileage").val()); //받은 포인트
	curr = Number($("#curr").val()); //매도가
	
	sum_mil = curr*sellval;
	curr_mil = mil+sum_mil;
	
	$(".sum_mil").val(sum_mil);
	$(".curr_mil").val(curr_mil);
	});
});

var sellval;
$(function(){//숫자를 직접 입력했을 경우 실시간 계산
	$(".n_selling").on("propertychange change keyup paste input",function(){
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
	num = Number($(".n_selling").val());
    diff = Number($(".diff").val());
	if(num>diff){
		alert("매수 주를 초과하여 매도할 수 없습니다.");
		return false;
	}else{
		return true;
	}
}
</script>
<style>

</style>
</head>
<body>
<div id="main" class="main">
	<form class="sub_main" method="post" action="/mock/selling_ok" onsubmit="return diff_mil()">

		<div class="s_name">${sdto.name} ${sdto.code}
		<input type="hidden" name="code" value="${sdto.code}">
		</div>
		<div class="graph">차트 그래프</div>
		<div class="mil_name">포인트</div>
		<div class="mil_num">
			<c:if test="${mileage==0}">
		  	<a href="/mock/invest/in_regi">모의 투자 신청</a>
		  	</c:if>
		  	
		  	<c:if test="${mileage!=0}">
		  	<fmt:formatNumber value="${mileage}"/>
		  	<input id="mileage" type="hidden" value="${mileage}">
		  	 <!--포인트 숫자서식으로 3자리씩 나눔 -->
		  	</c:if>
		</div>
		<div class="price">주당매도가</div>
		<div class="price_num">
			<fmt:formatNumber value="${sdto.open}"/>
		  	<input id="curr" type="hidden" name="bid_spread" value="${sdto.open}">
		  	<!--매수호가 -->
	  	</div>
		<div class="week">거래주
		<input type="hidden" class="diff" value="${diff}">
		</div>
		<div class="week_num">
		<input type="button" id="minus" value= "-">
	  	<input type="text" class="n_selling" name="n_selling" value="${diff}" size="4">주<!-- 거래개수 -->
	  	<input type="button" id="plus" value="+" >
		</div>
		<div class="sum">거래 합계</div>
		<input type="text" class="sum_mil" size="4" value="${sdto.open*diff}" readonly>
		
		<div class="cuur_mil">
			남은 마일리지
		</div>
		<div class="cuur_mil_num">
		<c:if test="${mileage==0}">
		  	마일리지 없음
		</c:if>
		 <c:if test="${mileage!=0}">
		  	<input type="text" class ="curr_mil" name="curr_mil" value="${mileage-(sdto.open*diff)}" size="4" readonly>	
		  </c:if>
		</div>
		
		<div class="ai">ai 한마디?</div>
		
		<div class="mock_list">
			<a href="/mock/stocks/st_list">주식 목록</a>
		</div>
		
		<div class="submit_ok">
		<c:if test="${mileage!=0}">
			<input type="submit" value="판매">
		</c:if>
		
		</div>
	</form>
</div>
</body>
</html>