<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자페이지</title>
</head>
<body>
  <div id="main" align="center">
	<h3> 관리자페이지 </h3>
    <table width="700" >
        <tr style="text-align:center">
	      <td> 아이디 </td>
	      <td> 이름 </td>
	      <td> 비밀번호 </td>
	      <td> 이메일 </td>
        </tr>
        <c:forEach items="${adto}" var="adto">
          <c:if test="${adto.userid!='admin'}">
            <tr style="text-align:center">
	          <td> ${adto.userid} </td>
	          <td> ${adto.username} </td>
	          <td> ${adto.pwd} </td>
	          <td> ${adto.email} </td>
            </tr>
          </c:if>
        </c:forEach>
    </table>
  </div>
</body>
</html>