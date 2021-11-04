<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP게시판  웹사이트</title>
<script>
function win_close()
{
	  close();
}
</script>
</head>
<body>
	<c:if test="${chk!=null }">
		<div class="jumbotron" style="padding-top: 50px;" align="center">
			<c:if test="${chk==1}">
			<form method="post" action="/mock/user/userid_search">
			</c:if>
			<c:if test="${chk==2}">
			<form method="post" action="/mock/user/pwd_search">
			</c:if>
				<div class="form-group">
					<div>잘못된 정보입니다</div>
				</div>
				<input type="submit" value="다시 입력하기">
			</form>	
		</div>
    </c:if>
	<c:if test="${chk==null }">
		<div class="jumbotron" style="padding-top: 50px;" align="center">
			<div>${username }님의 
			<c:if test="${user==1}">
			아이디는 ${userid }
			</c:if>
			<c:if test="${user==2}">
			비밀번호는 ${pwd }
			</c:if>
			입니다.</div><p>
			<input type="button" value="닫기" onclick="win_close()">
		</div>
    </c:if>
</body>
</html>
