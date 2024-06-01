<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<style>
.descendants * { 
    display: block;
    border: 2px solid orange;
    color: blue;
    padding: 5px;
    margin: 15px;
}
</style>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
		$("button").click(function(){
			//필터 매개변수에 콤마(,)로 구분된 여러 필터 값으로 검색 범위를
			//	더욱 축소할 수 있음
			//<h2> 요소부터 <h3> 요소까지 검색
			//	그 과정에서 클래스 이름이 first, second, third인 요소를 선택함
		    $("h2").nextUntil("h5", ".first,.second,.third")
		    .css({"color": "red", "border": "2px solid green"});
		});
	});
</script>
</head>
<body>
	<div style="width:500px;" class="siblings">
		<p>p In this example</p>
		<span>span In this example</span>
		<h2>h2 In this example</h2>
		<h3>h3 In this example</h3>
		<p>p In this example</p>
		<p class="first">p class "first"</p>
		<p>p In this example</p>
		<span class="second">span class "second"</span>
		<span class="second">span also class "second"</span>
		<span>span</span>
		<h5 class="third">h5 class "third"</h3>
	</div>
	<button>실행</button>
<p>In this example</p>
</body>
</html>
