<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 검색 결과 </title>
 <script>
   window.onload=function()
   {
	   document.pkc.field.value="${field}";
   }
 </script>
</head>
<body>
<div id="main">
  <table width="900" align="center">
     <tr>
	  <td colspan="5" align="center"> 
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

       <!-- 현재페이지 이전 1페이지 이동 -->

       <!-- 현재페이지 기준으로 이동할 수 있는 페이지  -->

        
     
      </td>     
      </tr>
      </table>
      <p>
      
    <!-- search 시작 -->
    <table width="500" align="center">
     <tr>
       <td colspan="3" align="center">
        <form name="pkc" method="post" action="list2">
          <select name="field">
            <option value="title"> 제목 </option>
            <option value="content"> 내용 </option>
            <option value="userid"> 아이디 </option>
          </select>
          <input type="text" name="word" value="${word}">
          <input type="submit" value="검색">
        </form>
       </td>
     </tr>
  </table>
	<!-- search 끝 -->
     
</div>
</body>
</html>