<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	    $("#fadein").click(function(){
	        $("#penguins").fadeIn("slow");
	    }),
	    $("#fadeout").click(function(){
        	$("#penguins").fadeOut(1000);
    });
});
</script>
</head>
<body>
	<h3> Penguins fade In/out</p>
	<button id="fadein">Click to fade in</button><br><br>
   	<button id="fadeout">Click to fade out</button><br><br>
	<img id="penguins" src="penguins.jpg" alt="Penguins" width="300" 
             height="200" style="display:none" />
</body>
</html>
 