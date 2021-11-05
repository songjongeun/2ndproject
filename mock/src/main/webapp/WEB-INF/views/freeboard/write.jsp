<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 글쓰기 </title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<<<<<<< HEAD
<div>	
	  <form name="write" method="post" action="write_ok">
	  <h3> 글쓰기</h3>
	  이름 <input name="userid" id="userid" value="${sessionScope.username}"> <p>
=======
<div id="main">	
	  <form name="write" method="post" action="write_ok">
	  <h3> 글쓰기</h3>
	  작성자 <input name="userid" id="userid" value="${sessionScope.username}"> <p>
>>>>>>> 0cf8fd16438c0a877719b83a0c5a997f8b2a86b3
	  제목 <input type="text" name="title"> <p>
	  내용 <textarea cols="100" rows="20" name="content"></textarea> <p>
	  <input type="submit" value="저장">
	  </form>
	  </div>
</body>
</html>
<<<<<<< HEAD
=======

>>>>>>> 0cf8fd16438c0a877719b83a0c5a997f8b2a86b3
