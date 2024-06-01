<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("#btn1").click(function(){
	        $("#test1").text("Hello world!");
	    });
	    $("#btn2").click(function(){
	        $("#test2").html("<b>Hello world!</b>");
	    });
	    $("#btn3").click(function(){
	        $("#test3").val("Dolly Duck");
	    });
	});
</script>
</head>
<body>
	<p id="test1">This is a paragraph.</p>
	<p id="test2">This is another paragraph.</p>
	<p>Input field: 
		<input type="text" id="test3" value="Mickey Mouse" />
	</p>
	<button id="btn1">Set Text</button>
	<button id="btn2">Set HTML</button>
	<button id="btn3">Set Value</button>

</body>
</body>
</html>
