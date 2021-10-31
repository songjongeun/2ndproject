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
	 open("userid_search","","width=400,height=250");
 }
 function userpwd_search()
 {
	 open("pwd_search","","width=400,height=300");
 }
</script>
<style>
  #log_f{
    line-height:50px;
    color:red;
  }
</style>
</head>
<body>
  <div id="main" style="padding-right:70px;">
	<form name="login" method="post" action="login_ok">
		<h3 style="text-align:center">로그인</h3>
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
		<div class="form-group" style="text-align:center" >
			<input type="submit" value="로그인"><p style="line-height:0.8;">&nbsp;</p>
		</div>
		
		<table width="500" align="center"  style="padding-right:35px;">
		  <tr style="text-align:center">
		    <td><a href="javascript:userid_search()"> 아이디 찾기</a></td>
		    <td><a href="javascript:userpwd_search()"> 비밀번호 찾기</a></td>
		    <td><a href="user/member"> 회원가입</a></td>
		  </tr>
		</table>
	</form>	
	</div>
</body>
</html>
