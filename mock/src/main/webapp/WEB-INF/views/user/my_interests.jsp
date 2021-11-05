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
      <c:if test="${chk!=1}">
        <tr style="text-align:center">
          <td>종목명</td>
          <td>현재가</td>
          <td>등락(대비)</td>
          <td>거래량</td>
        </tr>
        <tr><td colspan="4"><hr></td></tr>
        <c:forEach items="${udto2}" var="udto2">
          <tr style="text-align:center">
		    <c:if test="${udto2.err==1}">  <!-- 관심종목은 있지만 정보가 없을시 -->
<<<<<<< HEAD
		      <td colspan="4"><a href="/mock/stocks/st_list?name=${udto2.name}">${udto2.name}의 정보가 없습니다</a></td>
=======
		      <td colspan="4"><a href="/mock/stocks/st_list?name=${udto2.name}">${udto2.name}의 정보를 찾을 수 없습니다</a></td>
>>>>>>> 0cf8fd16438c0a877719b83a0c5a997f8b2a86b3
		    </c:if>
		    <c:if test="${udto2.err!=1}"> 
              <td><a href="/mock/stocks/st_list?code=${udto2.code}">${udto2.name}</a></td><!-- 종목으로가기 -->
              <td><fmt:formatNumber value="${udto2.cprice}" pattern="#,##0" /></td>
<<<<<<< HEAD
              <td><fmt:formatNumber value="${udto2.diff}" pattern="#,##0" /></td>
=======
              <td><fmt:formatNumber value="${udto2.diff}" pattern="#,##0" />%</td>
>>>>>>> 0cf8fd16438c0a877719b83a0c5a997f8b2a86b3
              <td><fmt:formatNumber value="${udto2.vol}" pattern="#,##0" /></td>
            </c:if>
          </tr>
        </c:forEach>
      </c:if>
    </table>
  </div>
  
</body>
</html>
