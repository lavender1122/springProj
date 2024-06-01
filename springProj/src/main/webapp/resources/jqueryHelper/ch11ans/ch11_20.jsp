<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	    $(".ex .hide").click(function(){
    	    $(this).parents(".ex").hide();
	    });
	});
</script>
<style> 
	div.ex {
    	background-color: #e5eecc;
	    padding: 7px;
    	border: solid 1px #c3c3c3;
	}
</style>
</head>
<body>
	<h3>Island Trading</h3>
	<div class="ex">
	  <button class="hide">Hide me</button>
	  <p>Contact: Helen Bennett<br> 
	  Garden House Crowther Way<br>
	  London</p>
	</div>
	<h3>Paris specialites</h3>
	<div class="ex">
	  <button class="hide">Hide me</button>
	  <p>Contact: Marie Bertrand 265, Boulevard Charonne Paris</p>
	</div>
</body>
</html>
