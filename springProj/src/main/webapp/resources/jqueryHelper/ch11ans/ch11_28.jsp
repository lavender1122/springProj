<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
    	$("#start").click(function(){
	        var div = $("div");  
	        div.animate({height: 300}, "slow");
	        div.animate({width: 300}, "slow");
	        div.queue(function () {
	            div.css("background-color", "red");  
	            div.dequeue();
	        });
	        div.animate({height: 100}, "slow");
	        div.animate({width: 100}, "slow");
	    });
	});
</script> 
</head>
<body>
	<p>The queue() and dequeue() method </p>
	<p><button id="start">Start Animation</button></p>
	<div style="background:blue;height:100px;width:100px;">
</body>
</html>
