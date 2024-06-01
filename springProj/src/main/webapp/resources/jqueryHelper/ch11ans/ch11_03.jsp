<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
    	$("button").click(function(){
	        $("#hydrangeas").animate(
	        		{width:'+=10px', height:'+=10px',
					 left:'+=10px', opacity : '-=0.1'
			});
	    });
	});
</script> 
</head>
<body>
	<button>Start Animation</button><br><br>
   	<img id="hydrangeas" src="/images/hydrangeas.jpg" alt="hydrangeas" 
              width="300" height="200" style="position:absolute" />
</body>
</html>
</body>
</html>
