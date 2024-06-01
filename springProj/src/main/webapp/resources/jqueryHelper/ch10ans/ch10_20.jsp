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
		//<p> 태그를 클릭하였을 때 각각의 함수를 호출하여 실행
	    $("body").on("click", "p", changeFontColor);
	    $("body").on("click", "p", changeBackgroundColor);
	    //버튼을 클릭하면 <p>태그를 클랙하는 메서드를 제거함
	    $("button").click(function(){
	        $("body").off("click", "p");
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
