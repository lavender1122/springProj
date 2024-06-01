<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/*
	value : 높이를 px, ex, pi 등으로 지정하며, 기본 단위는 px 임
	function() : 선택 항목. 선택한 요소의 새 높이를 반환하는 함수를 지정함
	index : 요소의 인덱스 위치를 반환
	currentheight : 선택한 요소의 현재 높이를 반환
	*/
	$(function(){
	    $("button").click(function(){
	        $("#demo").text("Height of div: " + 
	        		$("div").height() + " " + 
					"Width of div: "  + 
					$("div").width());
	    });
	});
</script>
</head>
<body>
	<div style="height:100px;width:300px;padding:10px;margin:3px;border:1px solid blue;
                background-color:lightblue;"></div><br>
	<button>Display the height/width</button>
    <p id="demo"></p>
</body>
</html>
