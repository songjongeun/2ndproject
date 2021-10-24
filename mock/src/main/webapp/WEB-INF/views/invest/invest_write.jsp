<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="inv_write_ok">
	<table width="300" align="center">
		<tr>
		<td>투자 기간</td>
		<td>
			<select>
			<option value="1">1달</option>
			<option value="3">3달</option>
			<option value="6">6달</option>
			</select>
		</td>
		</tr>
		
		<tr>
		<td>투자 금액</td>
		<td>
			<select>
				<option value="3000000">300만원</option>
				<option value="5000000">500만원</option>
				<option value="10000000">1,000만원</option>
			</select>
		</td>
		</tr>
	</table>	
	</form>
</body>
</html>