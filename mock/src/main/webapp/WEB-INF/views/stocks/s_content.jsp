<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- 숫자서식을 위해 fmt 사용 -->'
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://code.highcharts.com/css/stocktools/gui.css">
<link rel="stylesheet" type="text/css" href="https://code.highcharts.com/css/annotations/popup.css">

<title>Insert title here</title>
<style type="text/css">
.st_main{
	display:grid;
	width:80%;
	grid-template-rows: 1fr 5fr;
	place-items: center;
	margin:auto;
}
.sc_graph{
}
.stcon{ /*그래프와 매도매수...를 div로 감싸 플렉스로 정렬*/
	display:grid;
	place-items: center;
	grid-template-columns: 3fr 1fr;
}

.con_menu{/*버튼 메뉴들을 grid로 지정*/
	display:grid;
	grid-template-columns: repeat(2,1fr);	/*가로방향 비율*/
  	grid-template-rows: repeat(4,1fr); /*세로방향 비율*/
  	grid-gap: 10px;
}
.buy_con{
	grid-column:1;
  	grid-row:2;
}
.sell_con{
	grid-column:2;
  	grid-row:2;
}
.realtime{
	grid-column:1;
	grid-row:3;
}
.ai_con{
	grid-column:2;
  	grid-row:3;
}

</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 차트 그래프 스크립트 ===================== -->
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
<!-- 차트 그래프 스크랩트 ==================== -->
</head>
<body>
<div id="main">
  <div class="st_main">
   <div class="stc_name">
   <h1>${name}
   <button id="like"  class="btn btn-outline-danger btn-sm">♡</button> </h1>  </div>
   <div class="stcon"> <!-- 그래프 및 매수매도 -->
	<div id="stock-graph" class="sc_graph"></div>
   <div class="con_menu">
	<div class="buy_con">
		<button  class="btn btn-outline-danger btn-sm" onclick="location.href='/mock/stocks/buying?code=${code}'"
		style="width:100%;">매수</button>
	</div>
	
	<div class="sell_con">
		<button  class="btn btn-outline-danger btn-sm" onclick="location.href='/mock/stocks/selling?code=${code}'"
		style="width:100%;">매도</button>
	</div>
	
	<div class="realtime">
		<button id="realtime" class="btn btn-outline-danger btn-sm" style="width:100%;">실시간 데이터</button>
	</div>
	<div class="ai_con">
	<button  class="btn btn-outline-danger btn-sm" onclick="location.href='/mock/stocks/aipredict?code=${code}'"
	style="width:100%;">Ai 분석</button>

	</div>
  </div>
  </div>
</div>
</div>
<script>

$(document).ready(function(){
	
	var param={userid:"${sessionScope.userid}", code:"${code}"};

	$.ajax({
	    type: "get",
	    url : "./like",
	    data : param,
	    contentType: "application/json",
	    dataType : "json",	// 받아오는 값
	    success : function(data){
	       var chk=	data.chk;
	       if (chk==1){
	    	   $("#like").text("♥");
	       }else{
	    	   $("#like").text("♡");
	       }
	    },error : function(){
	    	 alert("likeError");
	        //Ajax 실패시
	    }
	});
	
	$("#like").on('click',function(){
		
		$.ajax({
		    type: "get",
		    url : "./likeButton",
		    data : {userid:"${sessionScope.userid}", code:"${code}"},
		    contentType: "application/json",
		    dataType : "json",	// 받아오는 값
		    success : function(data){
		        //Ajax l
		    	var chk=	data.chk;
			       if (chk==1){
			    	   $("#like").text("♥");
			       }else{
			    	   $("#like").text("♡");
			       }
		    },error : function(){
		    	 alert("로그인 해주세요");
		        //Ajax 실패시
		    }
		});
	});
	
	
	var reqData={code:"<c:out value='${code}'/>"}	;// 변수

		$.ajax({
		url:"./testData2",
		type:'post',
		data:reqData,
		dataType:'json',
		timeout: 2000,
		success:function(data){

		    // split the data set into ohlc and volume
		    var ohlc = [],
		        volume = [],
		        dataLength = data.length,
		        i = 0;

		    for (i; i < dataLength; i += 1) {
		        ohlc.push([
		            data[i].date, // the date
		            data[i].open, // open
		            data[i].high, // high
		            data[i].low, // low
		            data[i].close // close
		        ]);

		        volume.push([
		            data[i].date, // the date
		            data[i].volume // the volume
		        ]);
		    }

		    Highcharts.stockChart('stock-graph', {
		        title: {
		            text: "<c:out value='${name}'/>" 
		        },
		        yAxis: [{
		            labels: {
		                align: 'left'
		            },
		            height: '80%',
		            resize: {
		                enabled: true
		            }
		        }, {
		            labels: {
		                align: 'left'
		            },
		            top: '80%',
		            height: '20%',
		            offset: 0
		        }],
		        tooltip: {
		            shape: 'square',
		            headerShape: 'callout',
		            borderWidth: 0,
		            shadow: false,
		            positioner: function (width, height, point) {
		                var chart = this.chart,
		                    position;

		                if (point.isHeader) {
		                    position = {
		                        x: Math.max(
		                            // Left side limit
		                            chart.plotLeft,
		                            Math.min(
		                                point.plotX + chart.plotLeft - width / 2,
		                                // Right side limit
		                                chart.chartWidth - width - chart.marginRight
		                            )
		                        ),
		                        y: point.plotY
		                    };
		                } else {
		                    position = {
		                        x: point.series.chart.plotLeft,
		                        y: point.series.yAxis.top - chart.plotTop
		                    };
		                }

		                return position;
		            }
		        },
		        series: [{
		            type: 'ohlc',
		            id: 'aapl-ohlc',
		            name: "<c:out value='${name}'/> 주식가격" ,
		            data: ohlc
		        }, {
		            type: 'column',
		            id: 'aapl-volume',
		            name: '거래량',
		            data: volume,
		            yAxis: 1
		        }],
		        responsive: {
		            rules: [{
		                condition: {
		                    maxWidth: 800
		                },
		                chartOptions: {
		                    rangeSelector: {
		                        inputEnabled: false
		                    }
		                }
		            }]
		        }
		    });

		}, error : function( ){
			
			alert('data가 없습니다');
			history.back();
		}
		
		
	});


	});


</script>
</body>
</html>