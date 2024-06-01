<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("button").click(function(){
			//함수를 사용하여 각 선택된 요소를 감싸는 대상을 지정함
			//return 값으로 <div> 태그를 가져오고,
			//	<p> 요소에 이를 적용함
	        $("p").wrap(function(){
				return "<div></div>"
	        });
    	});
	});
</script>
<style>
	div { background-color: yellow; }
</style>
</head>
<body>
	<p>This is a paragraph.</p>
	<button>Wrap a div element</button>
</body>
</html>
