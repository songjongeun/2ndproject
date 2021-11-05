<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://code.highcharts.com/css/stocktools/gui.css">
<link rel="stylesheet" type="text/css" href="https://code.highcharts.com/css/annotations/popup.css">
<style>
#container {
    max-height: 800px;
    min-height: 75vh;
}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/data.js"></script>
<script src="https://code.highcharts.com/stock/modules/drag-panes.js"></script>


</head>
<body>




<div id="stock-graph"></div>

<h1>stockchart</h1>


<script>

$(document).ready(function(){
	var reqData={code:"A035720"}
	// var data=[]
	
	$.ajax({
		url:"./testData",
		type:'get',
		data:reqData,
		dataType:'json',
		timeout: 1000,
		success:function(data){
				Highcharts.stockChart('stock-graph',{
				rangeSelector:{
				selected: 1
				},
				title:{
					text: 'AAPL Stock Price'
				},
				
				series:[{
					name: 'AAPL',
					data:data,
					tooltip:{
						valueDecimals:2
					}
				
				
				}]

			});

		}
		
		
	})
	


	});



</script>

</body>
</html>