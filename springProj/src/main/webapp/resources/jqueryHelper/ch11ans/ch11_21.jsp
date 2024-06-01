<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	    $("button").click(function(){
	        $("#koala").show(1000);
	    });
	});
</script>
</head>
<body>
	<button>Show</button>
	<img id="koala" src="koala.jpg" alt="koala" width="150" height="100"
         style="display:none" />
</body>
</html>
