<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 마이페이지 </title>
</head>
<body>
	<h3> 마이페이지 </h3>
	<hr>
  <table width="500" align="center">
    <tr>
      <td> 아이디 </td>
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
  
</body>
</html>
