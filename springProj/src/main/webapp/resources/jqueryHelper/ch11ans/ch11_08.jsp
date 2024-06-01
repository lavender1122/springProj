<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	    $(".btn1").click(function(){
			$("#p1").animate({margin: "+=10px"});
	    });
	    $(".btn2").click(function(){
			$("#p1").animate({margin: "-=10px"});
	    });
	});
</script>
</head>
<body>
	<button class="btn1">Animate +</button>
	<button class="btn2">Animate -</button>
	<p>This is a paragraph.</p>
	<p id="p1" style="border:1px solid blue;">
    			This is an animated paragraph.</p>
	<p>This is another paragraph.</p>
</body>
</html>
