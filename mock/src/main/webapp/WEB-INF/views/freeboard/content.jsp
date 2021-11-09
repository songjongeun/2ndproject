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
  <table width="900" align="center">
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
      <td colspan="2" align="center">  
        <!-- 로그인을 안 했을 때 -->
	    <c:if test="${empty sessionScope.userid}">
		<a href="list"> 목록가기 </a>
		<a href="/mock/user/login">로그인 </a>
		</c:if>
	 
	    <!-- 로그인을 한 상태로 다른 사람이 쓴 글에 들어왔을 때 -->
	    <c:if test="${userid!=null}"> 
		<a href="list"> 목록가기 </a>
		<a href="write"> 글쓰기 </a> 
		<!--  로그인을 한 상태로 내가 쓴 글에 들어왔을 때 / 'admin'으로 들어왔을 떄 -->
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
  
  <!--------------------------------------->
  <!-- 댓글관련 내용 -->
  <h3> 댓글 </h3>
  	<c:if test="${empty sessionScope.userid}">
	<table class="clist" width="800" border="1" align="center" >
     <tr align="center">
     <!-- 로그인을 안 했을 때 댓글창 시작 -->
      <td align="center"> 아이디 </td>
      <td align="center"> 내용 </td>
      <td align="center"> 작성일 </td> 
     </tr>
        
    <c:forEach items="${clist}" var="cdto">
     <tr>
      <td align="center"> ${cdto.userid} </td>
      <td> ${cdto.content} </td>
      <td align="center"> ${cdto.writeday} </td>
     </tr>
    </c:forEach> 
    
    <!-- 페이지 시작 -->
     <tr>
     <td colspan="5" align="center"> 
      <!-- 현재 페이지 기준 이전 10페이지 이동 -->
      <c:if test="${cpstart != 1}"> 
       <a href="list?f_id?cpage=${cpstart-1}"> 
       </a> </c:if>
      <c:if test="${cpstart == 1}"> 
       ◁
      </c:if>
       <!-- 현재페이지 이전 1페이지 이동 -->
      <c:if test="${cpage != 1}"> 
       <a href="list?f_id?cpage=${cpage-1}"> < </a>
      </c:if>
      <c:if test="${cpage == 1}"> 
       <
      </c:if>
       <!-- 현재페이지 기준으로 이동할 수 있는 페이지  -->
        <c:forEach begin="${cpstart}" end="${cpend}" var="i">
          <!-- 현재페이지 색은 다르게 => 빨강 -->
         <c:if test="${cpage != i}"> 
          <a href="content?f_id?cpage=${i}"> ${i} </a>
         </c:if>
         <c:if test="${cpage == i}"> 
          <a href="content?f_id?cpage=${i}" style="color:red"> ${i} </a>
         </c:if>
        </c:forEach>
        
        <!-- 현재페이지 기준 다음1페이지 이동 -->
       <c:if test="${cpage != cpage_cnt}"> 
        <a href="content?f_id?cpage=${cpage+1}"> > </a>
       </c:if>
     
       <c:if test="${cpage == cpage_cnt}"> > </c:if>
      <c:if test="${cpage_cnt != cpend}"> 
       <a href="content?f_id?cpage=${cpend+1}"> ▷ </a>
      </c:if>
      <c:if test="${cpage_cnt == cpend}"> 
      ▷
      </c:if> 
      </td>     
      </tr>
    </c:if>
    <!--  페이지 끝 -->
   
    <!-- 로그인을 안 했을 때 댓글창 끝 -->
    <!-------------------------------------->
    
    <!-- 로그인을 한 상태로 다른 사람이 쓴 글에 들어왔을 때 -->
    <c:if test="${userid!=null}"> 
     <table class="clist" width="800" border="1" align="center" >
      <tr align="center">
	      <td align="center"> 아이디 </td>
	      <td align="center"> 내용 </td>
	      <td align="center"> 작성일 </td> 
	      <!--  로그인을 한 상태로 내가 쓴 글에 들어왔을 때 / 'admin'으로 들어왔을 떄 -->
		  <c:if test="${userid==bdto.userid || userid=='admin'}">
	      <td align="center"> 수정 </td> 
	      <td align="center"> 삭제 </td> 
      </tr>
      
     <c:forEach items="${clist}" var="cdto">
     <tr>
         <td align="center"> ${cdto.userid} </td>
         <td> ${cdto.content} </td>
         <td align="center"> ${cdto.writeday} </td>
         <!-- 로그인을 한 상태로 다른 사람이 쓴 글에 들어왔을 때 댓글창 끝 -->
         <td align="center"> <a href="javascript:cmt_update(${cdto.c_id},'${cdto.content }')"> 수정 </a></td>
         <td align="center"> <a href="cmt_delete?c_id=${cdto.c_id}&f_id=${bdto.f_id}"> 삭제 </a></td>
        </tr>
       </c:forEach> 
       
       
       
       </table>
       </c:if>
       </table>
       </c:if>
   <script>
    function cmt_update(c_id,content)
    {
        document.inform.content.value=content;
        document.inform.c_id.value=c_id;
  
        document.inform.action="cmt_update_ok";
        document.inform.submit.value="댓글수정";
    }
   </script>    
       
     <%--   <!-- 페이지 시작-->
     <tr>
     <td colspan="5" align="center"> 
      <!-- 현재 페이지 기준 이전 10페이지 이동 -->
      <c:if test="${cpstart != 1}"> 
       <a href="content?cpage=${cpstart-1}"> 
       </a> </c:if>
      <c:if test="${cpstart == 1}"> 
       ◁
      </c:if>
       <!-- 현재페이지 이전 1페이지 이동 -->
      <c:if test="${cpage != 1}"> 
       <a href="content?cpage=${cpage-1}"> < </a>
      </c:if>
      <c:if test="${cpage == 1}"> 
       <
      </c:if>
       <!-- 현재페이지 기준으로 이동할 수 있는 페이지  -->
        <c:forEach begin="${cpstart}" end="${cpend}" var="i">
          <!-- 현재페이지 색은 다르게 => 빨강 -->
         <c:if test="${cpage != i}"> 
          <a href="content?cpage=${i}"> ${i} </a>
         </c:if>
         <c:if test="${cpage == i}"> 
          <a href="content?cpage=${i}" style="color:red"> ${i} </a>
         </c:if>
        </c:forEach> --%>
        
        <%-- <!-- 현재페이지 기준 다음1페이지 이동 -->
       <c:if test="${cpage != cpage_cnt}"> 
        <a href="content?cpage=${cpage+1}"> > </a>
       </c:if>
     
       <c:if test="${cpage == cpage_cnt}"> > </c:if>
      <c:if test="${cpage_cnt != cpend}"> 
       <a href="content?cpage=${cpend+1}"> ▷ </a>
      </c:if>
      <c:if test="${cpage_cnt == cpend}"> 
       ▷
      </c:if> 
      </td>     
      </tr>
     </c:if>
    </c:if>
    </table>
    <!--로그인을 한 상태로 내가 쓴 글에 들어왔을 때 / 'admin'으로 들어왔을 떄 댓글창 끝 -->
    <!--------------------------------------> --%>
    
 
  
  <!-- 댓글 입력폼 -->
  <p>
   <tr>
  	<!-- 로그인을 안 했을 때 -->
	<c:if test="${empty sessionScope.userid}">
	<form align="center">
	<a href="list"> 목록가기 </a>
	<a href="/mock/user/login">로그인 </a>
	</form>
	</c:if>

	<!-- 로그인을 한 상태 -->
	<!-- 댓글 작성 시작 -->
	<c:if test="${userid!=null}">
	
	<form name="inform" method="post" action="cmt_write_ok" align="center">
	<input type="hidden" name="c_id">
	<input type="hidden" name="f_id" value="${bdto.f_id}"> 

  	<textarea cols="80" rows="7" name="content"></textarea>
  	<input type="submit" value="댓글 작성"  name="submit">
	  </form>
  	</c:if>
  	</tr>
  <!-- 댓글 입력 폼 끝 -->
  
</div>
</body>
</html>