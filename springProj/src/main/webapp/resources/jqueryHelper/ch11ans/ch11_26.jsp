<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
    	$("#slideToggle").click(function(){
	        $("#hydrangeas").slideToggle("slow");
	    });
	});
</script>
</head>
<body>
	<h3> Show...hydrangeas...</h3>
	<button id="slideToggle">slideToggle..!</button><br /><br />
   	<img id="hydrangeas" src="hydrangeas.jpg" alt="hydrangeas" 
              width="300" height="200" style="display:none" />
</body>
</html>
