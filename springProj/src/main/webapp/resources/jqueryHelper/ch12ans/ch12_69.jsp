<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<style>
.grandparent{
	display:block;border:2px solid orange;
	width:70%;position:absolute;left:10px;top:50px;
}
.parent{
	border:1px solid black;margin:10px;background-color:yellow;
}
</style>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
		    //offsetParent() 메서드 : 첫 번재로 위치한 부모 요소를 반환
		    //<p>요소의 가장 가까운 위치에 있는 부모 요소의 배경색을 설정함
			$("p").offsetParent().css("background-color","red");	    	
	    });
	});
</script>
</head>
<body>
	<button>Set background-color</button>
	<div class="grandparent">div (grandparent)
		<div class="parent">div (parent)
			<p> offsetParent method...  </p>
		</div>
	</div>
</body>
</html>
