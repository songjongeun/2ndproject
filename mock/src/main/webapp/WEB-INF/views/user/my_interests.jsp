<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내종목보기</title>
</head>
<body>
  <div id="main" align="center">
    <table width="700" >
      <c:if test="${chk==1}">  <!-- 가져온 정보가 없을시 -->
        <div style="padding-right:70px;padding-top:70px;text-align:center;">관심종목이 없습니다<p>
        관심종목을 등록해주세요</div>
      </c:if>
      <c:if test="${chk!=1}">  <!-- 가져온 정보가 있을시 -->
        <tr style="text-align:center">
          <td colspan="4">실시간 종목</td>
        </tr>
        <tr style="text-align:center">
          <td>종목명</td>
          <td>현재가</td>
          <td>등락(대비)</td>
          <td>거래량</td>
        </tr>
        <tr><td colspan="4"><hr></td></tr>
        <c:forEach items="${udto2}" var="udto2">
          <tr style="text-align:center">
		    <%-- <c:if test="${udto2.err==1}">  <!-- 관심종목은 있지만 정보가 없을시 -->
		      <td colspan="4"><a href="/mock/stocks/st_list?name=${udto2.name}">${udto2.name}의 정보를 찾을 수 없습니다</a></td>
		    </c:if> --%>
		    <c:if test="${udto2.err!=1}"> 
              <td><a href="/mock/stocks/realtime">${udto2.name}</a></td><!-- 종목으로가기 -->
              <td><fmt:formatNumber value="${udto2.cprice}" pattern="#,##0" /></td>
              <td><fmt:formatNumber value="${udto2.diff}" pattern="#,##0" />%</td>
              <td><fmt:formatNumber value="${udto2.vol}" pattern="#,##0" /></td>
            </c:if>
          </tr>
        </c:forEach>
    </table>
    <table width="700" >
        <tr style="text-align:center;margin-top:100px;">
          <td colspan="6">모의투자 종목</td>
        </tr>
        <tr style="text-align:center">
		  <td>종목코드</td> 
		  <td>종목명</td>
		  <td>매수</td>
		  <td>매도</td>
		  <td>대비</td>
		  <td>날짜</td>
		</tr>
        <tr><td colspan="6"><hr></td></tr>
        <c:forEach items="${sdto}" var="sdto">
          <tr style="text-align:center">
            <c:if test="${sdto.err==1}">  <!-- 관심종목은 있지만 정보가 없을시 -->
		      <td colspan="6" style="text-align:center;"><a href="/mock/stocks/st_list?name=${sdto.name}">${sdto.name}의 정보를 찾을 수 없습니다</a></td>
		    </c:if>
		    <c:if test="${sdto.err!=1}"> 
			  <td>${sdto.code}</td>
			  <td>${sdto.name}</td>
			  <td><a href="/mock/stocks/buying?id=${sdto.id}"><fmt:formatNumber value="${sdto.offer}"/></a></td>
			  <td><a href="/mock/stocks/selling?id=${sdto.id}"><fmt:formatNumber value="${sdto.bid}"/></a></td>
			  <td>${sdto.diff}%</td>
		  	  <td>${sdto.date}</td>
            </c:if>
          </tr>
        </c:forEach>
      </c:if>
    </table>
  </div>
  
</body>
</html>
