<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://code.highcharts.com/css/stocktools/gui.css">
<link rel="stylesheet" type="text/css" href="https://code.highcharts.com/css/annotations/popup.css">
<style>
#stock-graph {
    max-height: 800px;
    min-height: 75vh;
}

</style>
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



<div id="stock-graph"></div>



<script>


$(document).ready(function(){

	var getCode='A005930';
	var reqData={code:getCode};

	Highcharts.ajax({  
		url:"./testData2",
		type:'post',
		data:reqData,
		dataType:'json',
		timeout: 2000,
	    success: function(data) {  
	        // Split the lines  
	        var lines = data.split('\n');  
	        lines.forEach(function(line, lineNo) {  
	            var items = line.split(',');  
	              
	            // header line containes categories  
	            if (lineNo == 0) {  
	                items.forEach(function(item, itemNo) {  
	                    if (itemNo > 0) options.xAxis.categories.push(item);  
	                });  
	            }  
	              
	            // the rest of the lines contain data with their name in the first position  
	            else {  
	                var series = {   
	                    data: []  
	                };  
	                items.forEach(function(item, itemNo) {  
	                    if (itemNo == 0) {  
	                        series.name = item;  
	                    } else {  
	                        series.data.push(parseFloat(item));  
	                    }  
	                });  
	                  
	                options.series.push(series);  
	    
	            }  
	              
	        });  
	          
	        Highcharts.chart('container', options);  
	    },  
	    error: function (e, t) {  
	        console.error(e, t);  
	    }  
	});


	});



</script>

</body>
</html>