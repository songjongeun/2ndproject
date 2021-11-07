<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
td{
	place-items: center;
	text-align: center;
}
</style>
<script>
	window.onload=function()
	{
		document.search_st.field.value="${field}";
	}
</script>
</head>
<body>
<div id="main" class="main">
   <form name="search_st" method="post" action="st_list">
    	<select name="field">
    	  	<option value="code">종목코드</option>
    	  	<option value="name">종목명</option>
    	 </select>
    	  <input type="text" name="word" value="${word}">
    	  <input type="submit" value="검색">
    </form>
  <table>
	<tr>
		<td>종목코드</td>
		<td>종목명</td>
	</tr>
	
	<c:forEach items="${list}" var="sdto">
	<tr>
		<td><a href="/mock/stocks/s_content?code=${sdto.code}">${sdto.code}</a></td>
		<td><a href="/mock/stocks/s_content?code=${sdto.code}">${sdto.name}</a></td>
	</tr>
	</c:forEach>
  </table>
</div>

</body>
</html>