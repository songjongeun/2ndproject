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
    function del()
    {
    	var delform=document.getElementById("delform");
    	delform.style.visibility="visible";
    	delform.style.left=event.clientX+"px";
    	delform.style.top=event.clientY+"px";
    }
</script>
</head>
<body>
<div id="main">
	<h3> 마이페이지 </h3>
	<hr>
  <table width="500" align="center">
    <tr>
      <td> 아이디 </td>
      <td> ${udto.userid} </td>
    </tr>
    <tr>
      <td> 이름 </td>
      <td> ${udto.username} </td>
    </tr>
    <tr>
      <td> 비밀번호 </td>
      <td> ${udto.pwd} </td>
    </tr>
    <tr>
      <td> 이메일 </td>
      <td> ${udto.email} </td>
    </tr>
    <tr>
      <td align="center"> 
       <a href="/mock/mypage/mypage_update?userid=${udto.userid}"> 수정 </a>
       <a href="#" onclick="del()"> 삭제 </a>
      </td>
    </tr>
   </table>
   
	<form method="post" action="mypage_delete" id="delform">
	<input type="submit" value="삭제">
  </form>
  <%-- 
  <p style="margin-top:70px;">
  <table width="900" align="center">
      <c:if test="${buy!=1}">
        <tr align="center">
          <td>매수정보가 없습니다</td>
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
          <td>총 주 개수</td>
          <td>주당 평균 매수금</td>
          <td>총 매수금</td>
        </tr>
        <tr><td colspan="6"><hr></td></tr>
        <c:forEach items="${total3}" var="total3">
          <tr align="center">
            <td>${total3.code}</td>
            <td>${total3.name}</td>
            <td><fmt:formatNumber value="${total3.n_buying}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${total3.total / total3.n_buying}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${total3.total}" pattern="#,##0" /></td>
          </tr>
        </c:forEach>
        <tr><td>dd</td></tr>
        <c:forEach items="${b_total3}" var="b_total3">
          <tr align="center">
            <td>${b_total3.code}</td>
            <td>${b_total3.name}</td>
            <td><fmt:formatNumber value="${b_total3.n_buying}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${b_total3.total / b_total3.n_buying}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${b_total3.total}" pattern="#,##0" /></td>
          </tr>
        </c:forEach>
      </c:if>      
    </table> --%>
  <p style="margin-top:70px;">
  <div align="center">보유포인트 : <fmt:formatNumber value="${mileage}" pattern="#,##0" /></div>
  <p style="margin-top:70px;">
    <table width="900" align="center">
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
            <td>${bdto3.code}</td>
            <td>${bdto3.name}</td>
            <td><fmt:formatNumber value="${bdto3.n_buying}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${bdto3.ask_spread / bdto3.n_buying}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${bdto3.ask_spread}" pattern="#,##0" /></td>
            <td>${bdto3.b_day}</td>
          </tr>
        </c:forEach>
      </c:if>      
    </table>
  <p style="margin-top:70px;">
    <table width="900" align="center">
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
            <td>${sdto3.code}</td>
            <td>${sdto3.name}</td>
            <td><fmt:formatNumber value="${sdto3.n_selling}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${sdto3.bid_spread / sdto3.n_selling}" pattern="#,##0" /></td>
            <td><fmt:formatNumber value="${sdto3.bid_spread}" pattern="#,##0" /></td>
            <td>${sdto3.s_day}</td>
          </tr>
        </c:forEach>
      </c:if>
    </table>
  

 	
  
  </div>
</body>
</html>
