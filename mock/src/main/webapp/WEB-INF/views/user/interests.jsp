<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내종목보기</title>
</head>
<body>
  <div id="main" align="center">
    <table width="1000" >
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
        <c:forEach items="${udto2}" var="udto2">
          <tr onclick="${udto2.code}"><!-- 종목으로가기 -->
            <td>${udto2.name}</td>
            <td>${udto2.cprice}</td>
            <td>${udto2.diff}</td>
            <td>${udto2.vol}</td>
          </tr>
        </c:forEach>
      </c:if>
    </table>
  </div>
  
</body>
</html>