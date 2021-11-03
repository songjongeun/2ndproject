<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 글내용 </title>
</head>
<body>
	<h3> 글내용 </h3>
	<hr>
  <table width="500" align="center">
    <tr>
      <td> 제목 </td>
      <td> ${bdto.title} </td>
    </tr>
    <tr>
      <td> 이름 </td>
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
       <a href="list"> 목록가기 </a>
       <div></div>
       <c:if test="${userid=='userid'}">
       <c:if test="${userid=='username'}">
       <c:if test="${userid==null}">
       <a href="update?f_id=${bdto.f_id}"> 수정 </a>
       <a href="#" onclick="del()"> 삭제 </a>
       </c:if>
       </c:if>
       </c:if>
       </div>
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
</body>
</html>