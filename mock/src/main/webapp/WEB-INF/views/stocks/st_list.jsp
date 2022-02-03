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

td:nth-chile(1){
	text-align:center;
	width:500px;
}
td:nth-chile(2){
	text-align: left;
	width:400px;
}

.search_st{
	margin-bottom:20px;
}
.st_page{
	margin-top:20px;
}
.st_listsize{
  	width:40%;
}
.search_sub{
	margin-bottom:3px;
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
	
   <form class="search_st" name="search_st" method="post" action="st_list">
    	<select name="field" class="search_st">
    	  	<option value="code">종목코드</option>
    	  	<option value="name">종목명</option>
    	 </select>
    	  <input type="text" name="word" value="${word}" size="10px">
    	  <input type="submit" class="btn btn-danger btn-sm search_sub" value="검색 " style="height:29px;">
    </form>
    <div class="st_listsize">
  <table class="table table-sm">
	<tr>
		<th>종목코드</th>
		<th>종목명</th>
	</tr>
	
	<c:forEach items="${list}" var="sdto">
	<tr>
		<td class="s_code"><a href="/mock/stocks/s_content?code=${sdto.code}">${sdto.code}</a></td>
		<td class="s_name"><a href="/mock/stocks/s_content?code=${sdto.code}">${sdto.name}</a></td>
	</tr>
	</c:forEach>
	</table>
	</div>
	<!-- 페이징 -->
	<div class="st_page">
		<c:if test="${page!=1}">
			<a href="/mock/stocks/st_list?page=${page-1}">[PREV]</a>
		</c:if>
		<c:if test="${page==1}">
		</c:if>
		
		<c:forEach begin="${startpage}" end="${lastpage}" var="i">
			<c:if test ="${page != i}">
				<a href="/mock/stocks/st_list?page=${i}">${i}</a>
			</c:if>
			<c:if test ="${page == i}">
				<a href="/mock/stocks/st_list?page=${i}" style="color:red">${i}</a>
			</c:if>
		</c:forEach>
				
		<c:if test="${page<totalpage}">
			<a href="/mock/stocks/st_list?page=${page+1}">[NEXT]</a>
		</c:if>
		<c:if test="${page==totalpage}">
		</c:if>
	</div>
	</div>


</body>
</html>