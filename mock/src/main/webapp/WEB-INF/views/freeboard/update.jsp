<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 글수정 </title>
</head>
<script>
function check()
{ 
	var title=document.update.title.value;
	var titlelen=title.trim();
	var titlelen=titlelen.length;
	  
	var content=document.update.content.value;
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
				 	return submit();	
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
<body>
<div id="main">
	  <form name="update" method="post" action="update_ok" onsubmit="return check()">
	  <input type="hidden" name="f_id" value="${bdto.f_id}">
	  <h3> 글수정 </h3>
	  <input type="hidden" name="userid" value="${bdto.userid}">
	  제목 <input type="text" name="title" style="width:700px;" onkeyup="title_hide()" value="${bdto.title}"> <p>
	  내용 <textarea cols="100" rows="20" name="content" onkeyup="content_hide()">${bdto.content}</textarea> <p>
	  <span id="title_len"></span>
	  <span id="content_len"></span>
	  <p> <input type="submit" value="수정"> </p>
	  </form>
	  </div>
</body>
</html>
