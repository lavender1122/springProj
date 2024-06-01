<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script src="/js/jquery.min.js">
</script>
<script>
	/* :first-child 선택자
	부모 태그를 기준으로 자식 요소 중에서 첫 번째 해당 태그의 요소를 선택함
	*/
	$(function(){
	    $("button").click(function(){
	    	//부모 노드(body)의 첫 번재 자식 노드 요소를 선택(단,<p>태그에 한하여..)
       		$("p:first-child").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<!-- 이 문장이 첫 번째 자식 노드인데 <p> 태그가 아니므로 어떠한 요소도 선택되지 않음  -->
<!-- 	<h2>This is a heading</h2> -->
	<p>This is oth paragraph.</p>
	<p>This is first paragraph.</p>
    <p>This is second paragraph.</p>
    <p>This is third paragraph.</p>
	<button>Click me</button>
</body>
</html>
