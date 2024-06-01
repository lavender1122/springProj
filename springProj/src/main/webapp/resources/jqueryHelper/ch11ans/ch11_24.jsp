<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("button").click(function(){
	        $("#div1").fadeTo("slow", 0.15);
	        $("#div2").fadeTo("slow", 0.4);
        	$("#div3").fadeTo("slow", 0.7);
	    });
	});
</script>
</head>
<body>
	<p>Demonstrate fadeTo() with different parameters.</p>
	<button>Click to fade boxes</button><br><br>
	<div id="div1" style="width:80px;height:80px;background-color:red;">
    </div><br>
	<div id="div2" style="width:80px;height:80px;background-color:green;">
    </div><br>
	<div id="div3" style="width:80px;height:80px;background-color:blue;">
    </div>
</body>
</html>
