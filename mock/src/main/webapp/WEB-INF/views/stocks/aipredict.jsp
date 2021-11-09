<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- 숫자서식을 위해 fmt 사용 -->'
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://code.highcharts.com/css/stocktools/gui.css">
<link rel="stylesheet" type="text/css" href="https://code.highcharts.com/css/annotations/popup.css">

<title>Insert title here</title>
<style type="text/css">
.main{
	display:grid;
	display:grid;
	place-items: center;
 	grid-template-columns: 5fr 30px 1fr 1fr 30px;	/*가로방향 비율*/
  	grid-template-rows: 5fr 1fr 1fr 1fr 5fr; /*세로방향 비율*/
	width:70%;
	height:100%;
  	grid-gap: 10px;
}
.sc_graph{
	grid-column:1;
  	grid-row:1/6;
}

.like{
	grid-column:2;
	grid-row:2;
}
.buy_con{
	grid-column:3;
  	grid-row:3;
}
.sell_con{
	grid-column:4;
  	grid-row:3;
}
.realtime{
	grid-column:3;
	grid-row:4;
}
.ai_con{
	grid-column:4;
  	grid-row:4;
}


</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
<div id="main" class="main">
	<div id="stock-graph" class="sc_graph">
	<img src="<spring:url value = '/img/${imgName}'/>" >
	</div>
	<div class="like">
		<button id="like"  class="btn btn-outline-danger btn-sm">♡</button>
	</div>
	<div id="predict">
	
	현재가  ${close}
	<c:if test="${close>cprice}">
	
	<span style="color:blue;"> ai 예측 다음날 가격 ${cprice} </span>
	</c:if>
	<c:if test="${close<cprice}">
	
	<span style="color:red;"> ai 예측 다음날 가격 ${cprice} </span>
	</c:if>

		<!-- 종가, 예측가 -->
	</div>
	
	<div class="buy_con">
		<button  class="btn btn-outline-danger btn-sm" onclick="location.href='/mock/stocks/buying?code=${code}'">매수</button>
	</div>
	
	<div class="sell_con">
		<button  class="btn btn-outline-danger btn-sm" onclick="location.href='/mock/stocks/selling?code=${code}'">매도</button>
	</div>
	
	<div class="realtime">
		<button  class="btn btn-outline-danger btn-sm" onclick="location.href='/mock/stocks/realtime?code=${code}'" >실시간데이터보기</button>
	</div>
	<div class="ai_con">
	<button  class="btn btn-outline-danger btn-sm" onclick="location.href='/mock/stocks/s_content?code=${code}'"> 데이터 보기</button>
	</div>

</div>
<script>



$(document).ready(function(){
	var imgName=null;
	imgName="${imgName}";
	
	if (imgName==null){
		alert("ai 분석 데이터가 없습니다");
		history.back();
	}
	
	
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