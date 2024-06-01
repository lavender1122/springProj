<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	    $("button").click(function(){
        	$("p").offsetParent().css("background-color", "red");
	    });
	});
</script>
</head>
<body>
	<button>Set background-color</button>
	<div style="border:1px solid black;width:70%;position:absolute;left:10px;top:50px">
		<div style="border:1px solid black;margin:50px;background-color:yellow">
			<p>Click button to set the background color of the first parent</p>
		</div>
	</div>
</body>
</html>
