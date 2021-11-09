<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script>
 function userid_search()
 {
	 // window.open();
	 open("/mock/user/userid_search","","width=300,height=150");
 }
 function userpwd_search()
 {
	 open("/mock/user/pwd_search","","width=300,height=180");
 }
</script>
<style>
  #log_f{
    line-height:50px;
    color:red;
  }
  .main{
  	display:grid;
  	place-items: center;
  }
  .main_login{
  	display:grid;
  	width:300px;
  	border:1px solid silver;
  	place-items: center;
  }
  .id_search{
  	margin-top:20px;
  	display:flax;
  	justify-content:space-between;
  }
</style>
</head>
<body>
  <div id="main" class="main">
  <div class="main_login">
	<form name="login" method="post" action="/mock/user/login_ok">
		<h3 style="text-align:center; margin-top:10px;">로그인</h3>
		<p id="log_f" align="center">
		
		<c:if test="${chk==1 }">
	      잘못된 정보입니다
	    </c:if>
		<c:if test="${chk!=1 }">
	     &nbsp;
	    </c:if>
	    
		   </p>
		<div class="form-group" style="text-align:center">
			<input type="text" placeholder="아이디" name="userid" maxlength="20">
		</div>
		<div class="form-group" style="text-align:center">
			<input type="password" placeholder="비밀번호" name="pwd" maxlength="20" style="margin-top:5px">
		</div>
		<div class="form-group" style="text-align:center;padding-top:5px" >
			<input class="btn btn-danger btn-sm" type="submit" value="로그인" style="width:190px;"><p style="line-height:0.8;">&nbsp;</p>
		</div>
		<div class="id_search">
		<input type="button" class="btn btn-outline-danger btn-sm" value="아이디 찾기" onclick="userid_search()">
		<input type="button" class="btn btn-outline-danger btn-sm" value="비밀번호 찾기" onclick="userpwd_search()">
		</div>
		<div>
		<input type="button" value="회원가입" class="btn btn-outline-danger btn-sm" 
		onclick="location.href='/mock/user/member'" style="width:202px; margin:5px 0px 20px 0px;">
		</div>
	</form>	
  </div>
		

	</div>
</body>
</html>
