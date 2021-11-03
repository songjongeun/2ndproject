<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<div align="center">
		<form name="pwd_search" method="post" action="/mock/user/ip_search_ok">
		<h3 style="text-align: center;">비밀번호 찾기</h3>
		<div class="form-group">
			<input type="text" placeholder="아이디" name="userid" maxlength="20">
		</div>
		<div class="form-group">
			<input type="text" placeholder="이름" name="username" maxlength="20">
		</div>
		<div class="form-group">  
			<input type="text" placeholder="이메일" name="email" maxlength="20">
		</div>
		<input type="submit" value="비밀번호 찾기">
		</form>	
	</div>
</body>
</html>
