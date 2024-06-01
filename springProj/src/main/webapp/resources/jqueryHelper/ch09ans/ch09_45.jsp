<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
	// :empty 선택자는 빈 요소를 선택
	// 빈 요소는 하위 요소나 텍스트가 없는 요소
	$(function(){
		$("#empty").click(function(){
			// 빈 요소의 배경색을 파란색으로 설정
		     $(":empty").css("background-color", "blue");
		});
	});
</script>
</head>
<body>
	<h1>Welcome to My Web Page</h1>
	<table border="1">
		<tr>
		    <th>대한민국</th>
		    <th></th>
		    <th>서울</th>
		</tr>
		<tr>
		    <td>프랑스</td>
		    <td>마크롤</td>
		    <td></td>
		</tr>
		<tr>
		    <td>독일</td>
		    <td></td>
		    <td>베를린</td>
		</tr>
	</table>
	<button id="empty">empty</button>
</body>
</html>
