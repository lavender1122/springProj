<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("#btn1").click(function(){
	    	//text() : 선택된 요소의 텍스트 내용을 설정하거나 반환
	    	//<b> 태그가 적용되지 않고 내용만 보여줌
	        document.getElementById("demo").innerHTML=$("#test1").text();
	    });
	    $("#btn2").click(function(){
	    	//html() : 선택한 요소의 내용을 설정하거나 반환
	    	//<b> 태그가 적용됨
	        console.log($("#test1").html());	        
			document.getElementById("demo").innerHTML=$("#test1").html();
	    });
		$("#btn3").click(function(){
			//val() : 선택한 요소의 value 특성을 설정하거나 반환(폼 요소의 경우) 함
	        document.getElementById("demo").innerHTML= $("#test2").val();
	    });
	});
</script>
</head>
<body>
	<p id="test1">This is some <b>bold</b> text in a paragraph.</p>
	<p>Name: <input type="text" id="test2" value="Mickey Mouse" /></p>
	<button id="btn1">Show Text</button>
	<button id="btn2">Show HTML</button>
	<button id="btn3">Show Value</button>
    <p id="demo"></p>
</body>
</html>
