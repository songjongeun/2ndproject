<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 글쓰기 </title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
function check()
{ 
	var title=document.write.title.value;
	var titlelen=title.trim();
	var titlelen=titlelen.length;
	  
	var content=document.write.content.value;
	var contentlen=content.trim();
	var contentlen=contentlen.length;
	
	if(titlelen<1)
	  {
		  document.getElementById("title_len").innerHTML="<br><b style='color:red;font-size:15px'> 제목을 입력해주세요 </b>";
	  }
		 	 else if(contentlen<1)
			 {
		 		
				document.getElementById("content_len").innerHTML="<br><b style='color:red;font-size:15px'> 내용을 입력해주세요 </b>";
		     }
		 	 	else
		     	{
				 	document.write.submit();	
	 		 	}
	
}
function title_hide()
{
	document.getElementById("titlelen").innerHTML="";
}

function content_hide()
{
	document.getElementById("contentlen").innerHTML="";
}
</script>
</head>
<body>
<div id="main">	
	  <form name="write" method="post" action="write_ok" onsubmit="return check()">
	  <h3> 글쓰기</h3>
	  <input type="hidden" name="userid" value="${bdto.userid}" readonly>
	  제목 <input type="text"  name="title" style="width:700px;" onkeyup="title_hide()"> <p>
	  내용 <textarea cols="100" rows="20" name="content" onkeyup="content_hide()"></textarea> <p>
	  <span id="title_len"></span>
	  <span id="content_len"></span>
	  <p> <input type="button" onclick="check()" value="글쓰기"> </p>
	  </form>
	  </div>
</body>
</html>