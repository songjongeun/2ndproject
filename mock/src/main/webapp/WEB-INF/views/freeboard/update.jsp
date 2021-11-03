<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 글수정 </title>
</head>
<body>
<div>
	  <form name="update" method="post" action="update_ok">
	  <input type="hidden" name="f_id" value="${bdto.f_id}">
	  <h3> 글수정 </h3>
	  이름 <input type="text" name="userid" value="${bdto.userid}"><p>
	  제목 <input type="text" name="title" value="${bdto.title}"> <p>
	  내용 <textarea cols="100" rows="20" name="content">${bdto.content}</textarea> <p>
	  <input type="submit" value="수정">
	  </form>
	  </div>
</body>
</html>
