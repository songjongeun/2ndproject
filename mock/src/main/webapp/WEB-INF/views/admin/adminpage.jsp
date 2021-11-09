<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자페이지</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
  <div id="main" align="center">
	<h3> 관리자페이지 </h3>
	
	<h3>매수 현황</h3>
	<table class="table table-striped table-hover" >
        <tr style="text-align:center">
	      <td> 유저 </td>
	      <td> 총 매수주 </td>
	      <td> 매수 총 가격 </td>
        </tr>
        
        <c:forEach items="${bdto}" var="bdto">
          <c:if test="${bdto.userid!='admin'}">
            <tr style="text-align:center">
	          <td> ${bdto.userid} </td>
	          <td> ${bdto.totalNum} </td>
	          <td> ${bdto.total} </td>
            </tr>
          </c:if>
        </c:forEach>
    </table>
	<hr>
	<h3>매도 현황</h3>
	<table class="table table-striped table-hover" >
        <tr style="text-align:center">
	      <td> 유저 </td>
	      <td> 총 매도주 </td>
	      <td> 매도 총 가격 </td>
        </tr>
        
        <c:forEach items="${sdto}" var="sdto">
          <c:if test="${sdto.userid!='admin'}">
            <tr style="text-align:center">
	          <td> ${sdto.userid} </td>
	          <td> ${sdto.totalNum} </td>
	          <td> ${sdto.total} </td>
            </tr>
          </c:if>
        </c:forEach>
    </table>
    <hr>
    <h3> 회원관리 </h3>
    <table class="table table-striped table-hover" >
        <tr style="text-align:center">
	      <td> 아이디 </td>
	      <td> 이름 </td>
	      <td> 이메일 </td>
        </tr>
        <c:forEach items="${adto}" var="adto">
          <c:if test="${adto.userid!='admin'}">
            <tr style="text-align:center">
	          <td> ${adto.userid} </td>
	          <td> ${adto.username} </td>
	          <td> ${adto.email} </td>
            </tr>
          </c:if>
        </c:forEach>
    </table>
  </div>
</body>
</html>