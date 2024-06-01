<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	function changeFontColor() {
	    $(this).css("color", "green");
	}
	function changeBackgroundColor() {
	    $(this).css("background-color", "orange");
	}
	$(function(){
	    $("body").on("click", "p", changeFontColor);
	    $("body").on("click", "p", changeBackgroundColor);
	    
	    $("button").click(function(){
	    	//click이벤트 중에서 changeFontColor함수의 기능만을 제거함
	        $("body").off("click", changeFontColor);
	    });
	});
</script>
</head>
<body>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<p>Click any p element to increase size and letterspacing.</p>
	<button>Remove all click event handlers</button>
</body>

</html>
