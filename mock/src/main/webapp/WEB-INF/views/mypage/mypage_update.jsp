<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 내 정보 수정 </title>
</head>
<body>
<div>
	  <form name="mypage_update" method="post" action="mypage_update_ok">
	  <h3> 내 정보 수정 </h3>
	  아이디 <input type="text" name="userid" value="${sessionScope.userid}"><p>
	  이름 <input type="text" name="username" value="${sessionScope.username}"> <p>
	  비밀번호 <input type="text" name="pwd" value="${sessionScope.pwd}"> <p>
	  이메일 <input type="text" name="email" value="${sessionScope.email}"> <p> 
	  <input type="submit" value="수정">
	  </form>
	  </div>
</body>
</html>
