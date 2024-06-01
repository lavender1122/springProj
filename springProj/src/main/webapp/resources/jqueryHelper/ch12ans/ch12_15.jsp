<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$(window).scroll(function() {
			if ($(document).scrollTop() > 50) {
				$("p").addClass("test");
		    } else {
		      $("p").removeClass("test");
		    }
		});
	});
</script>
<style>
	.test {
	    background-color: yellow;
	}
</style>
</head>
<body style="height:500px;">
	<p>Scroll down this page.</p>
	<p style="position:fixed;">When you have scrolled 50 pixels from the top, 
    	add the class "test" (yellow background color) to the paragraph. 
        Scroll up again to remove the class.</p>

</body>
</html>
