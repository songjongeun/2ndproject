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
 	<table width="500" align="center">
     <tr>
      <td> 제 목 </td>
      <td> 내 용 </td>
      <td> 작성일 </td> 
     </tr>
     
    <c:forEach items="${list}" var="qdto">
     <tr>
      <td> <a href="content?q_id=${qdto.q_id}"> ${qdto.title} </a></td>
      <td> ${qdto.content} </td>
      <td> ${qdto.day} </td>
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
  	  <!--  페이지 끝 -->
   
      <tr>
	  <td colspan="3" align="right"> 
	  <!-- 로그인 및 회원가입 / 로그인을 했을 경우 글쓰기 탭-->
	  <c:if test="${userid == null}">
	  <!-- 로그인을 안했을 경우 -->
	  <a href="/mock/user/login"> 로그인 </a>  
	  <a href="/mock/user/member"> 회원가입 </a>
	  </c:if>

      <c:if test="${userid != null}">
      <!-- 로그인을 했을 경우 -->
  	  <a href="write"> 글쓰기 </a> 
      </c:if> 
      </td>
      </tr>
    
   </table>
   </div>
</body>
</html>

