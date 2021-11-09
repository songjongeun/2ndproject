<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 </title>
 <script>
  function dat_update(n,id)
   {
	   // 1. 작성자를 폼태그에 넣기
	   document.inform.userid.value=document.getElementsByClassName("userid")[n].innerText;
	   // 2. 댓글내용은 폼태그에 넣고
	   document.inform.content.value=document.getElementsByClassName("content")[n].innetText;
	   // 3. submit 버튼의 value를 수정으로 변경
	   document.inform.submit.value="수정";
	   // 4. action="dat_update.jsp"
	   document.inform.action="dat_update";  
	   // 5. 수정폼의 name="id"인곳에 id값을 전달
	   document.inform.q_id.value=q_id;
	   // 6. 수정취소버튼을 보이기 
	   document.getElementById("upbtn").style.display="inline";
   }
  function init()  // 수정폼을 입력폼으로 
  {
	  // 1. 작성자와 내용칸을 빈칸으로 
	  document.inform.userid.value="";
	  document.inform.content.value="";
	  // 2. submit 버튼의 value를 저장으로 변경
	  document.inform.submit.value="저장";
	  // 3. action="dat_ok.jsp"
	  document.inform.action="dat_write_ok.jsp";
	  // 4. 수정 취소버튼을 숨기기
	  document.getElementById("upbtn").style.display="none";
  }
  </script>
</head>
<body>
<div id="main">
	<h3> Q&A </h3>
	<hr>
  <table class="table table-striped table-hover" width="500" align="center">
    <tr>
      <td><h1> ${qdto.title}</h1> </td>
    </tr>
    <tr>
      <td>${qdto.userid} ⏰ ${qdto.writeday}  👀${qdto.hit} </td>
    </tr>
    <tr height="255">
      <td>${qdto.content} </td>
    </tr>
    <tr>
      <td colspan="2"> 
      
        <!-- 로그인을 안 했을 때 -->
	    <c:if test="${empty sessionScope.userid}">
		<a href="list"> 목 록 </a>
		<a href="/mock/user/login">로그인 </a>
		</c:if>
	 
	    <!-- 로그인을 한 상태로 다른 사람이 쓴 글에 들어왔을 때 -->
	    <c:if test="${userid!=null}"> 
		<a href="list"> 목 록 </a>
		  <c:if test="${userid=='admin'}">
		    <a href="update?q_id=${qdto.q_id}"> 수정 </a>
	        <a href="#" onclick="del()"> 삭제 </a>
	      </c:if>  
		</c:if>	

   	</td>
   </tr>         
  </table>

  <form method="post" action="delete" id="delform">
   <input type="hidden" name="q_id" value="${qdto.q_id}">
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
</div>
</body>
</html>
