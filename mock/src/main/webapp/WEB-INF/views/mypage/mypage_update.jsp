<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8"%>
=======
    pageEncoding="UTF-8"%>   
>>>>>>> 0cf8fd16438c0a877719b83a0c5a997f8b2a86b3
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 내 정보 수정 </title>
</head>
<body>
<<<<<<< HEAD
<div>
	  <form name="mypage_update" method="post" action="mypage_update_ok">
	  <h3> 내 정보 수정 </h3>
	  아이디 <input type="text" name="userid" value="${sessionScope.userid}"><p>
	  이름 <input type="text" name="username" value="${sessionScope.username}"> <p>
	  비밀번호 <input type="text" name="pwd" value="${sessionScope.pwd}"> <p>
	  이메일 <input type="text" name="email" value="${sessionScope.email}"> <p> 
=======
<div id="main">
	  <h3> 내 정보 수정 </h3>
	  <hr>
	  <form name="mypage_update" method="post" action="mypage_update_ok" align="center">
	  아이디 <input type="text" name="userid" value="${udto.userid}"><p>
	  이름 <input type="text" name="username" value="${udto.username}"> <p>
	  비밀번호 <input type="text" name="pwd" value="${udto.pwd}"> <p>
	  이메일 <input type="text" name="email" value="${udto.email}"> <p> 
>>>>>>> 0cf8fd16438c0a877719b83a0c5a997f8b2a86b3
	  <input type="submit" value="수정">
	  </form>
	  </div>
</body>
</html>
