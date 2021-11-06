<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>testAjax</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/data.js"></script>

<script src="https://code.highcharts.com/stock/indicators/indicators-all.js"></script>
<script src="https://code.highcharts.com/stock/modules/drag-panes.js"></script>

<script src="https://code.highcharts.com/modules/annotations-advanced.js"></script>
<script src="https://code.highcharts.com/modules/price-indicator.js"></script>
<script src="https://code.highcharts.com/modules/full-screen.js"></script>

<script src="https://code.highcharts.com/modules/stock-tools.js"></script>

<script src="https://code.highcharts.com/stock/modules/heikinashi.js"></script>
<script src="https://code.highcharts.com/stock/modules/hollowcandlestick.js"></script>
</head>
<body>
<script>
$(document).ready(function(){
	var reqData = {
			code: "A005380"
		}
	
	$.ajax({
		// contentType:'application/json',
		url:"./testData2",
		type:'POST',
		dataType: "json",	// 받아올 데이터 타입
		data: JSON.stringify(reqData), //보낼 데이터 제이슨 파싱
		//timeout: 2*60*60*1000, //2 hours,
		success: function(data) {
			
			alert(data[0]);
		//console.log('data: ',data);
		}
	});
	
	
	
});



</script>

<div id="main">


</div>

<div id="container" class="chart"></div>
</body>
</html>