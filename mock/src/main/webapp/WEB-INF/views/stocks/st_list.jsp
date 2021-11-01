<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>종목게시판</title>
<style>
.main{
	display:grid;
	place-items: center;
}
</style>
</head>
<body>
<div id="main" class="main">
  <table width="500">
    <caption>
    	<form method="post" action="st_list">
    	  <select>
    	  	<option value="code">종목코드</option>
    	  	<option value="name">종목명</option>
    	  </select>
    	  <input type="text" name="">
    	  <input type="submit" value="검색">
    	</form>
    </caption>
    
	<tr>
		<td>종목코드</td>
		<td>종목명</td>
		<td>매수</td>
		<td>매도</td>
		<td>대비</td>
		<td>날짜</td>
	</tr>
	
	<c:forEach items="${list}" var="sdto">
	<tr>
		<td>${sdto.code}</td>
		<td>${sdto.name}</td>
		<td><a href="/mock/stocks/selling?code=${sdto.code}">${sdto.bid}</a></td>
		<td><a href="/mock/stocks/buying?code=${sdto.code}">${sdto.offer}</a></td>
		<td>${sdto.diff}%</td>
		<td>${sdto.day}</td>
	</tr>
	</c:forEach>
  </table>
</div>

</body>
</html>