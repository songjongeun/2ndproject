<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- main_view 로그인 확인용 샘플(없에도 됨) -->
	<div id="main" align="center" style="padding-top:100px">
       <c:if test="${userid==null }"><!-- 로그인을 안했을경우 -->
         로그인 안함
       </c:if>
       <c:if test="${userid!=null}"><!-- 로그인을 했을 경우 -->
		${username}님 로그인됨
        <a href="logout">로그아웃</a> 
        
      </c:if>
      
  </div> 

</body>
</html>
