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
	display:grid;
	place-items: center;
 	grid-template-columns: 5fr 1fr 1fr;	/*가로방향 비율*/
  	grid-template-rows: 5fr 1fr 1fr 5fr; /*세로방향 비율*/
	width:70%;
	height:100%;
  	grid-gap: 10px;
}
.sc_graph{
	grid-column:1;
  	grid-row:1/5;
}
.buy_con{
	grid-column:2;
  	grid-row:2;
}
.sell_con{
	grid-column:3;
  	grid-row:2;
}
.ai_con{
	grid-column:2/4;
  	grid-row:3;
}

</style>
</head>
<body>
<div id="main" class="main">
	<div class="sc_graph">차트 그래프
	${code}
	</div>
	
	<div class="buy_con">
	<input type="button" onclick="location.href='/mock/stocks/buying?code=${code}'" value="매수">
	</div>
	
	<div class="sell_con">
	<input type="button" onclick="location.href='/mock/stocks/selling?code=${code}'" value="매도">
	</div>
	
	<div class="ai_con">
	<input type="button" value="Ai 분석">
	</div>

</div>
</body>
</html>