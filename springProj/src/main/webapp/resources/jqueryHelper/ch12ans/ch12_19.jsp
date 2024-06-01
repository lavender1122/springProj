<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	    $("button").click(function(){
	        $("p").css({"background-color" : "yellow", "font-size": "200%"});
		});
	});
</script>
</head>
<body>
	<h2>This is a heading</h2>
	<p style="background-color:#ff0000">This is a paragraph.</p>
	<p style="background-color:#00ff00">This is a paragraph.</p>
	<p style="background-color:#0000ff">This is a paragraph.</p>
	<p>This is a paragraph.</p>
	<button>Set multiple styles for p</button>

</body>
</html>
