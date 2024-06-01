<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
		//<h1>, <h2> 태그 요소를 클릭하면 그것의 내용을 <p> 요소로 반환
	    $("h1, h2").click(function(event){
	    	//선택한 현재의 DOM 요소(<p>)를 선택하고
	    	//innerHTML에 의해 해당 요소의 내용을 text로 지정함
			$("p").text(event.currentTarget.innerHTML);
	    });
	});
</script>
</head>
<body>
	<h1> Heading 1</h1>
    <h2> Heading 2</h2>
    <p></p>
</body>
</html>
