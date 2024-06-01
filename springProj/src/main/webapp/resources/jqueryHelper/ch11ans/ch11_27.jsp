<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	    $("button").click(function(){
	        var div = $("div");
	        div.animate({height: 300}, "slow");
	        div.animate({width: 300}, "slow");
	        div.animate({height: 100}, "slow");
	        div.animate({width: 100}, "slow");
	        $("span").text(div.queue().length);   
	    });
	});
</script>
</head>
<body>
	<button>Start Animation</button>
	<p>The queue length is: <span></span></p>
	<div style="width:50px;height:50px;position:absolute;
                left:10px;top:100px;background-color:red;"></div>
</body>
</html>
</body>
</html>
