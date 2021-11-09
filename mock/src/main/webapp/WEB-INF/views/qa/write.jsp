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
	var auto=document.write.auto_check.checked;
	if(auto) {
		  document.write.auto.value="1";}
	
	var title=document.write.title.value;
	var titlelen=title.trim();
	var titlelen=titlelen.length;
	  
	var content=document.write.content.value;
	var contentlen=content.trim();
	var contentlen=contentlen.length;
	
	if(titlelen<1)
	  {
		  document.getElementById("titlelen").innerHTML="<br><b style='color:red;font-size:15px'> 제목을 입력해주세요 </b>";
	  }
		 	 else if(contentlen<1)
			 {
		 		//alert("이름은 1자 이상 입력하셔야 합니다")
				document.getElementById("contentlen").innerHTML="<br><b style='color:red;font-size:15px'> 내용을 입력해주세요 </b>";
		     }
		 	 	else
		     	{
				 	document.write.submit();	
	 		 	}
}
</script>
</head>
<body>
<div id="main">	
	  <form name="write" method="post" action="write_ok">
	  <h3> 글쓰기 </h3>
	  제목 <input type="text" name="title"> <p>
	  내용 <textarea cols="100" rows="20" name="content"></textarea> <p>
	  <input type="submit" value="저장">
	  </form>
	  </div>
</body>
</html>
