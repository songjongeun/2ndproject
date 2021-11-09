<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 내 정보 수정 </title>
</head>
<body>
<div id="main">
	  <h3> 내 정보 수정 </h3>
	  <hr>
	  <form name="mypage_update" method="post" action="mypage_update_ok" align="center">
	  <tr>
      <td> 아이디 </td>
      <td> ${udto.userid} </td>
      </tr> <p>
	  이름 <input type="text" name="username" value="${udto.username}"> <p>
	  비밀번호 <input type="password" name="pwd"> <p>
	  이메일 <input type="text" name="email" value="${udto.email}"> <p> 
	  <input type="submit" value="수정">
	  </form>
	  </div>
</body>
</html>
