<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script>
function check()
{ 
	  var auto=document.member.auto_check.checked;
      if(auto) {
    	  document.member.auto.value="1";
      }
	 
	  var userid=document.member.userid.value;
	  var idlen=userid.trim();
	  var idlen=idlen.length;
	  
	  var pwd=document.member.pwd.value;
	  var pwdlen=pwd.trim();
	  var pwdlen=pwdlen.length;
	  
	  var pwd2=document.member.pwd2.value;
	  var pwd2len=pwd2.trim();
	  var pwd2len=pwd2len.length;
	  
	  var namelen=document.member.username.value;
	  namelen=namelen.trim();
	  var namelen=namelen.length;
	  
	  var emaillen=document.member.email.value;
	  emaillen=emaillen.trim();
	  var emaillen=emaillen.length;
	  
	  if(idlen<4)
	  {
		  //alert("아이디는 4자 이상 입력하셔야 합니다")
		  document.getElementById("id_len").innerHTML="<br><b style='color:red;font-size:15px'>아이디는 4자 이상 입력하셔야 합니다 </b>";
	  }
		 	 else if(namelen==0)
			 {
		 		//alert("이름은 1자 이상 입력하셔야 합니다")
				document.getElementById("name_len").innerHTML="<br><b style='color:red;font-size:15px'>이름은 1자 이상 입력하셔야 합니다 </b>";
		     }
		 		 else if(pwdlen<4)
		 		 {
		 			//alert("비밀번호는 4자 이상 입력하셔야 합니다")
		 			document.getElementById("pwd_len").innerHTML="<br><b style='color:red;font-size:15px'>비밀번호는 4자 이상 입력하셔야 합니다 </b>";
			     }
			 		 else if(emaillen==0)
					 {
			 			//alert("이메일은 1자 이상 입력하셔야 합니다")
						document.getElementById("email_len").innerHTML="<br><b style='color:red;font-size:15px'>이메일은 1자 이상 입력하셔야 합니다 </b>";
					  }
				 		 else if(pwd!=pwd2)
				 		 {
				 			//alert("비밀번호확인은 비밀번호랑 같아야 합니다")
				 			document.getElementById("pwd2_len").innerHTML="<br><b style='color:red;font-size:15px'>비밀번호확인은 비밀번호랑 같아야 합니다 </b>";
					     }
						     else
						     {
								 document.member.submit();	
					 		 }
} 
function userid_hide()
{
	document.getElementById("id_len").innerHTML="";
}

function username_hide()
{
	document.getElementById("name_len").innerHTML="";
}

function pwd_hide()
{
	document.getElementById("pwd_len").innerHTML="";
}

function pwd2_hide()
{
	document.getElementById("pwd2_len").innerHTML="";
}

function email_hide()
{
	document.getElementById("email_len").innerHTML="";
}

 function userid_check()
 {  
 	 var chk=new XMLHttpRequest();
 	 var userid=document.member.userid.value;
     chk.open("get","/mock/user/userid_check?userid="+userid); 
     chk.send();
     chk.onreadystatechange=function()
     {
    	 if(chk.readyState==4) 
    	 {
    		 if(chk.responseText==1)
    		 {
    			 document.getElementById("id_chk").innerHTML="<br><b style='color:red;font-size:15px'>사용 불가능한 아이디 </b>";
    		 }
    		 else if(chk.responseText==0)
    		 {
    			 document.getElementById("id_chk").innerHTML="<br><b style='color:blue;font-size:15px'>사용 가능한 아이디 </b>";
    		 }
    		 else
    		 {
    			 document.getElementById("id_chk").innerHTML="<br><b style='color:blue;font-size:15px'>"+chk.responseText==0+" </b>";
    		 }
    	 }
     }
     
 }
 
 function pwd_check()
 {  
	 var pwd=document.member.pwd.value;
     var pwd2=document.member.pwd2.value;
     if(pwd==pwd2)
     {
    	 document.getElementById("pwd_chk").innerHTML="<br><b style='color:blue;font-size:15px'>비밀번호가 같습니다.</b>"; 
     }	 
     else
     {
    	 document.getElementById("pwd_chk").innerHTML="<br><b style='color:red;font-size:15px'>비밀번호가 틀립니다.</b>"; 
     }
 }
 
</script>
</head>
<body>
<div id="main" align="center" style="padding-right:70px;">
				<form name="member" method="post" action="/mock/user/member_ok" onsubmit="return check()">
				<h3 style="text-align: center;">회원가입</h3>
				<div class="form-group">
					<input type="text" placeholder="아이디" name="userid" onkeyup="userid_hide()" maxlength="20"><p>
					<input type="button" value="아이디 조회" onclick="userid_check()">
					<span id="id_chk"></span>
        		    <span id="id_len"></span>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름" name="username" onkeyup="username_hide()" maxlength="20">
					<span id="name_len"></span>
				</div><p>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="pwd" onkeyup="pwd_check(),pwd_hide()" maxlength="20">
					<span id="pwd_len"></span>
				</div><p>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호 확인" name="pwd2" onkeyup="pwd_check(),pwd2_hide()" maxlength="20">
					<span id="pwd_chk"></span>
  			        <span id="pwd2_len"></span>
				</div><p>
				<div class="form-group">
					<input type="text" placeholder="이메일" name="email" onkeyup="email_hide()" maxlength="20">
					<span id="email_len"></span>
				</div><p>
				<div class="form-group">
					회원가입 후 자동로그인<input type="checkbox" name="auto_check" >
					<input type="hidden" name="auto" value="0" >
				</div><p>
				<input type="button" value="회원 가입" onclick="check()"><p>
			    <c:if test="${f==1}">
			      <b style="color:red">아이디가 중복되었습니다</b>
			    </c:if>
				</form>	
		</div>
</body>
</html> 



