<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 글목록 </title>
</head>
<body>
<div id="main">
	<h3> 글목록 </h3>
	<hr>
 	<table width="900" align="center" class="table table-striped table-hover">
 	 <tr>
	  <td colspan="5" align="center"> 

      <c:if test="${userid != null}">
      <!-- 로그인을 했을 경우 -->
  	  <a href="write"> 글쓰기 </a> 
      </c:if> 
      </td>
      </tr>
      
     <tr>
      <td> 글번호 </td>
      <td> 아이디 </td>
      <td> 제목 </td>
      <td> 조회수 </td>
      <td> 작성일 </td> 
     </tr>
     
    <c:forEach items="${list}" var="bdto">
     <tr>
      <td> ${bdto.f_id} </td>
      <td> ${bdto.userid} </td>
      <td> <a href="hit?f_id=${bdto.f_id}"> ${bdto.title} </a></td>
      <td> ${bdto.hit} </td>
      <td> ${bdto.writeday} </td>
     </tr>
    </c:forEach> 
     
     <!-- 페이지 시작 -->
     <tr>
     <td colspan="5" align="center"> 
      <!-- 현재 페이지 기준 이전 10페이지 이동 -->
      <c:if test="${pstart != 1}"> 
       <a href="list?page=${pstart-1}"> 
       </a> </c:if>
      <c:if test="${pstart == 1}"> 
       ◁
      </c:if>
       <!-- 현재페이지 이전 1페이지 이동 -->
      <c:if test="${page != 1}"> 
       <a href="list?page=${page-1}"> < </a>
      </c:if>
      <c:if test="${page == 1}"> 
       <
      </c:if>
       <!-- 현재페이지 기준으로 이동할 수 있는 페이지  -->
        <c:forEach begin="${pstart}" end="${pend}" var="i">
          <!-- 현재페이지 색은 다르게 => 빨강 -->
         <c:if test="${page != i}"> 
          <a href="list?page=${i}"> ${i} </a>
         </c:if>
         <c:if test="${page == i}"> 
          <a href="list?page=${i}" style="color:red"> ${i} </a>
         </c:if>
        </c:forEach>
        
        <!-- 현재페이지 기준 다음1페이지 이동 -->
       <c:if test="${page != page_cnt}"> 
        <a href="list?page=${page+1}"> > </a>
       </c:if>
     
       <c:if test="${page == page_cnt}"> > </c:if>
      <c:if test="${page_cnt != pend}"> 
       <a href="list?page=${pend+1}"> ▷ </a>
      </c:if>
      <c:if test="${page_cnt == pend}"> 
       ▷
      </c:if> 
      </td>     
      </tr>
   </table>
   
    <!-- search 시작 -->
    <table width="500" align="center">
     <tr>
       <td colspan="3" align="center">
        <form name="pkc" method="get" action="list2">
          <select name="field">
            <option value="title"> 제목 </option>
            <option value="content"> 내용 </option>
            <option value="userid"> 아이디 </option>
          </select>
          <input type="text" name="word" value="${word}">
          <input type="submit" value="검색" class="btn btn-danger btn-sm">
        </form>
       </td>
     </tr>
  </table>
	<!-- search 끝 -->
   
</div>
</body>
</html>
