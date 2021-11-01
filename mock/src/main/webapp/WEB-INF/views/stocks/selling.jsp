<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<div id="main" class="main">
	<table>
	  <tr>
	  	<td rowspan="3">여긴 차트가 올 거에요</td>
	  	<td colspan="2">여긴 포인트</td>
	  </tr>
	  
	  <tr>
	  	<td colspan="2">${sdto.get(0).bid}</td>
	  </tr>
	  
	  <tr>
	  	<td colspan="2">ai 한마디?</td>
	  </tr>
	</table>
</div>
</html>