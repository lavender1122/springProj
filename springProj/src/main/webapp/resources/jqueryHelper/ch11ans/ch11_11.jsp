<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	    $(".animate").click(function(){
	        $("body").animate({
	            backgroundPositionX: "+=200px", 
	            backgroundPositionY: "+=100px"
	        });
	    });
	    $(".reset").click(function(){
	        $("body").animate({
	            backgroundPositionX: "0px", 
	            backgroundPositionY: "0px"
	        });
	    });
	});
</script>
</head>
	<body style="background-image:url(w3_img.png);background-repeat:no-repeat;position:fixed;">
	<button class="animate">Animate</button>
	<button class="reset">Reset</button>
</body>
</html>
