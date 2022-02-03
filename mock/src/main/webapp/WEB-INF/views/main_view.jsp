<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<title>Insert title here</title>
<style>
   .main_view{
      margin:auto;
      display:grid;
      place-items: center;
      width:80%;
      height:100%;
      grid-gap:10px;
      grid-template-columns:1fr 1fr;
      grid-template-rows:1fr 3fr;
      }
   .main_head{
      grid-column:1/3;
        grid-row:1;
   }
   
   .mainside_left{
      grid-column:1;
        grid-row:2;
   }
   .mainside_right{
      grid-column:2;
        grid-row:2;
   }
</style>
</head>
<body> <!-- main_view 로그인 확인용 샘플(없에도 됨) -->
<div id="main" class="main_view">
 
	<div class="main_head">
		  	<img src="<spring:url value = '/img/U0001.png'/>">
 		  	<img src="<spring:url value = '/img/U2001.png'/>">
	</div>
	
	<div class="mainside_left">
			  	<img src="<spring:url value = '/img/U4001.png'/>">
	</div>
	<div class="mainside_right">
				<img src="<spring:url value = '/img/U3001.png'/>">
 	</div> 
 	</div>
 
</body>
</html>
