<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/*
	MouseOver/Out : 지정된 태그 요소(혹은 자신)는 물론이며, 
		자식 요소가 있다면 해당 자식요소의 영역까지 포함됨
	MouseEnter/Leave : 지정된 태그 요소(혹은 자신)의 영역에만 해당되며, 
		만약 자식요소가 있다면 해당 자식요소의 영역은 제외됨
	*/
	$(function(){
	    $("div, p").mouseenter(function(event){
	        $("#msg").html("Related target is: " 
	        		+ event.relatedTarget.nodeName);
	    });
	});
</script>
</head>
<body>
	<div style="height:100px;border:solid">This is a div element 
	  <p style="background-color:pink">This is a paragraph</p>
	</div><br />
	<div id="msg" />

</body>
</html>
