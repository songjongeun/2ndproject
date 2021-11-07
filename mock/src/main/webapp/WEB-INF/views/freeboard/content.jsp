<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 글내용 </title>
</head>
<body>
<div id="main">
	<h3> 글내용 </h3>
	<hr>
  <table width="500" align="center">
    <tr>
      <td> 제목 </td>
      <td> ${bdto.title} </td>
    </tr>
    <tr>
      <td> 아이디 </td>
      <td> ${bdto.userid} </td>
    </tr>
    <tr>
      <td> 조회수 </td>
      <td> ${bdto.hit} </td>
    </tr>
    <tr height="255">
      <td> 내용 </td>
      <td> ${bdto.content} </td>
    </tr>
    <tr>
      <td> 작성일 </td>
      <td> ${bdto.writeday} </td>
    </tr>
    <tr>
      <td colspan="2"> 
      
        <!-- 로그인을 안 했을 때 -->
	    <c:if test="${empty sessionScope.userid}">
		<a href="list"> 목록가기 </a>
		<a href="/mock/user/login">로그인 </a>
		</c:if>
	 
	    <!-- 로그인을 한 상태로 다른 사람이 쓴 글에 들어왔을 때 -->
	    <c:if test="${userid!=null}"> 
		<a href="list"> 목록가기 </a>
		<a href="write"> 글쓰기 </a> 
		  <c:if test="${userid==bdto.userid || userid=='admin'}">
		    <a href="update?f_id=${bdto.f_id}"> 수정 </a>
	        <a href="#" onclick="del()"> 삭제 </a>
	      </c:if>  
		</c:if>	

   	</td>
   </tr>         
  </table>

  <form method="post" action="delete" id="delform">
   <input type="hidden" name="f_id" value="${bdto.f_id}">
   <input type="submit" value="삭제">
   <input type="button" value="취소" onclick="hide()">
  </form>
  <style>
    #delform {
      position:absolute;
      visibility:hidden;
    }
  </style>
  <script>
    function del()
    {
    	var delform=document.getElementById("delform");
    	delform.style.visibility="visible";
    	delform.style.left=event.clientX+"px";
    	delform.style.top=event.clientY+"px";
    }
    function hide()
    {
    	document.getElementById("delform").style.visibility="hidden";
    }
  </script>
  <hr>
  
  <!-- 댓글 목록 시작 -->
	<table width="500" align="center">
     <tr>
      <td> 작성자 </td>
      <td> 내용 </td>
      <td> 작성일 </td> 
     </tr>
     
    <c:forEach items="${cmt_list}" var="cdto">
     <tr>
      <td> ${cdto.userid} </td>
      <td> ${cdto.content} </td>
      <td> ${cdto.writeday} </td>
     </tr>
    </c:forEach> 
    
    <!-- 페이지 시작 -->
     <tr>
     <td colspan="3" align="center"> 
      <!-- 현재 페이지 기준 이전 10페이지 이동 -->
      <c:if test="${pstart != 1}">
       <a href="list?page=${pstart-1}"> 
       </a> </c:if>
      <c:if test="${pstart == 1}"> 
       <<
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
       <a href="list?page=${pend+1}"> >> </a>
      </c:if>
      <c:if test="${page_cnt == pend}"> 
       >>
      </c:if> 
      </td>     
      </tr>
      </table>
  <!-- 댓글 목록 끝 -->
  
  <hr>
  
  <!-- 댓글 작성 시작 -->
  <div>
  <form name="cmt_write" method="post" action="cmt_write_ok">
  <!-- 로그인을 안 했을 때 -->
	<c:if test="${empty sessionScope.userid}">
	<a href="list"> 목록가기 </a>
	<a href="/mock/user/login">로그인 </a>
	</c:if>
	 
	<!-- 로그인을 한 상태 -->
	<c:if test="${userid!=null}"> 
	<form name="inform" method="post" action="cmt_write_ok.jsp">
  	<p> 아이디 <input type="text" name="userid" placeholder="작성자" size="6" value="${bdto.userid}"> </p> 
  	<textarea cols="70" rows="8" name="content" placeholder="댓 글" > 댓글 </textarea>
  	<input type="hidden" name="f_id" value="${content.f_id}">
  	<input type="submit" value="댓글 작성">
  	</c:if>
  </form>
  </div>
  <!-- 댓글 작성 끝 -->

</div>
</body>
</html>