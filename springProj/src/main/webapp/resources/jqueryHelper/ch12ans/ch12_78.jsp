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
	/* find() 메서드
	- 선택된 요소의 모든 하위 요소를 반환
	- DOM 요소의 자손을 따라 아래쪽으로 이동하여 마지막 자손까지 내려감
	- 모든 하위 요소를 반환하려면 * 선택자를 사용하며,
		여러 자손을 반환하려면 각 표현식을 쉼표로 구분함
	*/
	$(function(){
		$("button").click(function(){
			//<html> 의 모든 자손을 선택함
		    $("html").find("*")
		    .css({"color": "red", "border": "2px solid green"});
		});
	});
</script>
</head>
<body>
	<div class="descendants" style="width:500px;">div (current element) 
		<p>p (child)
	    	<span>span (grandchild)</span>     
		</p>
		<p>p (child)
			<span>span (grandchild)</span>
		</p> 
	</div>
	<button>실행</button>
</body>
</html>
