<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
>>>>>>> 0cf8fd16438c0a877719b83a0c5a997f8b2a86b3
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 마이페이지 </title>
</head>
<body>
<<<<<<< HEAD
=======
<div id="main">
>>>>>>> 0cf8fd16438c0a877719b83a0c5a997f8b2a86b3
	<h3> 마이페이지 </h3>
	<hr>
  <table width="500" align="center">
    <tr>
      <td> 아이디 </td>
<<<<<<< HEAD
      <td> ${sessionScope.userid} </td>
    </tr>
    <tr>
      <td> 이름 </td>
      <td> ${sessionScope.username} </td>
    </tr>
    <tr>
      <td> 비밀번호 </td>
      <td> ${sessionScope.pwd} </td>
    </tr>
    <tr>
      <td> 이메일 </td>
      <td> ${sessionScope.email} </td>
    </tr>
    <tr>
      <td align="center"> 
       <a href="mypage_update?userid=${udto.userid}"> 수정 </a>
=======
      <td> ${udto.userid} </td>
    </tr>
    <tr>
      <td> 이름 </td>
      <td> ${udto.username} </td>
    </tr>
    <tr>
      <td> 비밀번호 </td>
      <td> ${udto.pwd} </td>
    </tr>
    <tr>
      <td> 이메일 </td>
      <td> ${udto.email} </td>
    </tr>
    <tr>
      <td align="center"> 
       <a href="/mock/mypage/mypage_update?userid=${udto.userid}"> 수정 </a>
>>>>>>> 0cf8fd16438c0a877719b83a0c5a997f8b2a86b3
       <a href="#" onclick="del()"> 삭제 </a>
      </td>
    </tr>
   </table>
   
	<form method="post" action="mypage_delete" id="delform">
	<input type="submit" value="삭제">
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
  </script>
  
<<<<<<< HEAD
=======
  </div>
>>>>>>> 0cf8fd16438c0a877719b83a0c5a997f8b2a86b3
</body>
</html>
