<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
    	$("#btn1").click(function(){
	        $("div").animate({height: "100px"});
	        $("div").animate({width: "100px"});
	        $("div").delay(1200).animate({height: "150px"});
	    });
	});
</script>
</head>
<body>
	<div style="background:purple;height:75px;width:75px;margin:6px;"></div>
	<p><button id="btn1">Animate</button></p>


</body>
</html>
