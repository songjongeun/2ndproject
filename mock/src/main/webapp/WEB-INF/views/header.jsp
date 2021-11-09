<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{

}
.container{ /*헤더 전체 컨테이너로 설정*/
	display:grid;
  	place-items: center;
  	width:100%;
  	min-width:auto;
	height:100%;
	grid-gap:5px;
	grid-template-areas:
		"first"
		"second"
		"third"
		"main"
		"bottom";
	margin-top:50px;
}

#first{ /*찻반쩨 로고 및 로그인 css*/
	grid-area:first;
	width:100%;
	place-items: center;
	display:flex;
	justify-content: space-between; /*양끝으로 정렬. 아이템들 사이의 거리는 같음.*/
	height:80px;
	font-size:15px;
}
#first .item{

	padding-right:10px;
}

#first .item .login{
	margin-top: 10px;
	justify-content: center;
	text-align:center;
	margin: 0 auto;
}
#second{ /*메뉴*/
	grid-area:second;
	place-items: center;
	width:100%;
  	min-width:auto;
	height:30px;
	display:flex;
	justify-content: space-between;/*전체 같은 여백으로 정렬*/
}
#third{ /*메뉴 바 밑의 밑줄*/
	grid-area:third;
	width:100%;
	min-width:auto;
	height:5px;
	border-bottom:2px solid;
}
#main{ /*모든 메인 페이지 적용*/
	width:100%;
	min-width:auto;
	grid-area:main;
	place-items: center;
	margin:50px 0px;
}

/* 햄버거부분 */
#line-wrapper {
  width:36px;
  height:15px;
}

.line {
  background:#000000;/*아이콘 색상*/
  margin-bottom:4px;
  width:22px;
  height:3px; 
  border-radius:3px;
}

a:link {
	color:black;
	text-decoration: none;
}

a:visited {
	color:#999999;
	}

#second a:hover {
	border-bottom: 3px solid black;
	}

button{
	font-size:5px;
	text-align: center;
	text-decoration: none;

	display: inline-block;
	width: auto;

	border: none;
	border-radius: 4px;
	background:litepink;
	color: white;
}
#bottom{
	grid-area:bottom;
	width:100%;
	text-align:center;
	background-color:#C0C0C0;
	color:white;
	padding: 10px 0px;
}
 input[type="text"] { border: solid 1px #DC3545; }
 input[type="password"] { border: solid 1px #D2691E;}
</style>

</head>
<body>
<decorator:head/>
<div class="container">
	<div id="first">
		<div class="item w_logo"><a href="/mock/main_view"><img src="https://i.imgur.com/P7URtSx.png"></a></div>
		<div class="item login">
		<c:if test="${userid==null}">
			<a href="/mock/user/login">로그인</a>
			<a href="/mock/user/member">회원가입</a>
		</c:if>
		
		<c:if test="${userid!=null}">
			<button class="btn btn-outline-danger btn-sm"
			onclick="location.href='/mock/invest/in_regi'"
			style="width:80px;font-size:10px;"
			>모의신청</button><br>
			${username}님 &nbsp;&nbsp;
			<a href="/mock/user/logout">로그아웃</a>			
		</c:if>	
		</div>
	</div>

	<div id="second">
 		<div id="line-wrapper"><!-- 햄버거 아이콘 -->
   			<div class="line"></div>
   			<div class="line"></div>
  			<div class="line"></div>
 		</div>
 		<div class="item ai"><a href="/mock/">AI이슈 보기</a></div>
		<div class="item chart_menu"><a href="/mock/stocks/st_list">주식 차트</a></div>
		<div class="item my_market">
		  <c:if test="${userid==null }"> 
		    <a href="/mock/user/login">내 종목 보기 </a>
		  </c:if>
		  <c:if test="${userid!=null }">
		    <a href="/mock/user/my_interests">내 종목 보기 </a>
		  </c:if>
		</div>
		<div class="item m_free"><a href="/mock/freeboard/list">자유게시판</a></div>
		<div class="item Q&A"><a href="/mock/qa/list">공지사항</a></div>
		
		<div class="item mypage">
		   <c:if test="${userid==null }">  <!-- 로그인 안했을때 -->
		    <!-- 로그인 안했을 때 빈 페이지 표시 -->
		  </c:if>
		  
		  <c:if test="${userid!=null }">  <!-- 로그인 했을때 -->
		    <c:if test="${userid=='admin' }"> <!-- 관리자 -->
		      <a href="/mock/admin/adminpage">관리자페이지</a>
		    </c:if>                                        
		    <c:if test="${userid!='admin' }"> 	<!-- 일반 사용자 -->
		      <a href="/mock/mypage/mypage">마이페이지</a>
		    </c:if>						      			 
		   </c:if>                                   <!-- /로그인 했을때 -->
			   
		  </div>  <!--div item mypage 끝-->
		
		<!-- 아이템들 사이 조정을 위해 넣은 값 -->
		<div class="item"></div>
		<!-- 아이템들 사이 조정을 위해 넣은 값 -->
 	</div>
	<!-- 메뉴바 밑줄 꾸미기 위해 넣은 div -->
 	<div id="third">
	</div>
	<decorator:body/>
	<div id="bottom"> 
	상호명 : 경영기술개발원교육센터│대표자 : 한광두│사업자등록번호 : 334-81-00348│TEL : 1661-1429│FAX : 02-856-1094│<br>
	직업정보 제공사업 : 서울관악 제 2011-37호│주소 : (우)08292 서울특별시 구로구 구로중앙로34길 33-4(구로동, 경영기술개발원빌딩)│<br>
	Copyrightⓒ경영기술개발원교육센터. All Rights Reserved. 
	</div>
	</div>
</body>
</html>
