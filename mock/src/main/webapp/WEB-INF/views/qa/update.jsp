<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 글수정 </title>
</head>
<body>
<div id="main">
	  <form name="update" method="post" action="update_ok">
	  <input type="hidden" name="q_id" value="${qdto.q_id}">
	  <h3> 글수정 </h3>
	  <input type="hidden" name="userid" value="${qdto.userid}" readonly>
	  제목 <input type="text" name="title" value="${qdto.title}"> <p>
	  내용 <textarea cols="80" rows="20" name="content">${qdto.content}</textarea> <p>
	  <input type="submit" value="수정">
	  </form>
	  </div>
</body>
</html>

