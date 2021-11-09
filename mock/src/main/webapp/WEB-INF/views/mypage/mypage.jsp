<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 마이페이지 </title>
<style>
    #delform {
      position:absolute;
      visibility:hidden;
    }
</style>
<script>
</script>
</head>
<body>
<div id="main">
	<h3> 마이페이지 </h3>
	<hr>
  <table class="table table-striped table-hover" align="center">
    <tr>
      <td> 아이디 </td>
      <td> ${udto.userid} </td>
      <td> 이름 </td>
      <td> ${udto.username} </td>
      <td> 이메일 </td>
      <td> ${udto.email} </td>
    </tr>
    <tr>
      <td> 
      	<form method="post" action="./mypage_update">
      	<input type="hidden" name="userid" value="${udto.userid}">
      	
       	<button>정보 수정하기</button>
       </form>
      </td>

    </tr>
   </table>
  
  <p style="margin-top:70px;">
  
    <c:if test="${mileage!=null}">
    <table class="table table-striped table-hover" align="center">
      <c:if test="${buy!=1}">
        <tr align="center">
          <td>보유 주 정보가 없습니다</td>
        </tr>
      </c:if>
      <c:if test="${buy==1}">
        <tr align="center">
          <td colspan="6">보유 주 정보</td>
        </tr>
        <tr height="10"/>
        <tr align="center">
          <td>종목코드</td>
          <td>종목명</td>
          <td>보유 주 개수</td>
          <td>주당 평균 매수금</td>
          <td>총 매수금</td>
        </tr>
        <tr><td colspan="6"><hr></td></tr>
        <c:forEach items="${total3}" var="total3">
          <c:if test="${total3.n_buying!=0 }">
          <tr align="center">
            <td><a href="/mock/stocks/s_content?code=${total3.code}">${total3.code}</a></td>
            <td><a href="/mock/stocks/s_content?code=${total3.code}">${total3.name}</a></td>
            <td><fmt:formatNumber value="${total3.n_buying}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${total3.total / total3.n_buying}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${total3.total}" pattern="#,##0" /></td>
          </tr>
          </c:if>
        </c:forEach>
      </c:if>      
    </table> 
  <p style="margin-top:70px;">
  <div align="center">보유포인트 : <fmt:formatNumber value="${mileage}" pattern="#,##0" /></div>
  
  <p style="margin-top:70px;">
    <table class="table table-striped table-hover" align="center">
      <c:if test="${buy!=1}">
        <tr align="center">
          <td>매수정보가 없습니다</td>
        </tr>
      </c:if>
      <c:if test="${buy==1}">
        <tr align="center">
          <td colspan="6">매수정보</td>
        </tr>
        <tr height="10"/>
        <tr align="center">
          <td>종목코드</td>
          <td>종목명</td>
          <td>매수 주 개수</td>
          <td>주당 매수금</td>
          <td>총 매수금</td>
          <td>매수일</td>
        </tr>
        <tr><td colspan="6"><hr></td></tr>
        <c:forEach items="${bdto3}" var="bdto3">
          <tr align="center">
            <td><a href="/mock/stocks/s_content?code=${bdto3.code}">${bdto3.code}</a></td>
            <td><a href="/mock/stocks/s_content?code=${bdto3.code}">${bdto3.name}</a></td>
            <td><fmt:formatNumber value="${bdto3.n_buying}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${bdto3.ask_spread / bdto3.n_buying}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${bdto3.ask_spread}" pattern="#,##0" /></td>
            <td>${bdto3.b_day}</td>
          </tr>
        </c:forEach>
      </c:if>      
    </table>
  <p style="margin-top:70px;">
    <table class="table table-striped table-hover" align="center">
      <c:if test="${sel!=1}">
        <tr align="center">
          <td>매도정보가 없습니다</td>
        </tr>
      </c:if>
      <c:if test="${sel==1}">
        <tr align="center">
          <td colspan="6">매도정보</td>
        </tr>
        <tr height="10"/>
        <tr align="center">
          <td>종목코드</td>
          <td>종목명</td>
          <td>매도 주 개수</td>
          <td>주당 매도금</td>
          <td>총 매도금</td>
          <td>매도일</td>
        </tr>
        <tr><td colspan="6"><hr></td></tr>
        <c:forEach items="${sdto3}" var="sdto3">
          <tr align="center">
            <td><a href="/mock/stocks/s_content?code=${sdto3.code}">${sdto3.code}</a></td>
            <td><a href="/mock/stocks/s_content?code=${sdto3.code}">${sdto3.name}</a></td>
            <td><fmt:formatNumber value="${sdto3.n_selling}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${sdto3.bid_spread / sdto3.n_selling}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${sdto3.bid_spread}" pattern="#,##0" /></td>
            <td>${sdto3.s_day}</td>
          </tr>
        </c:forEach>
      </c:if>
    </table>
  

 
  
  </c:if>
 	<table class="table table-striped table-hover" align="center">
 	<td>
 	
  <button id="withdrawal">탈퇴하기</button>
  </td>
	</table>
  </div>
</body>
</html>
          