<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("p").each(function(i){
	    	//각 <p> 요소를 클릭하여 on() 메서드로 전달된 데이터를 반환함	    	
	        $(this).on("click", {x:i}, function(event){
	            console.log("The " + $(this).index() 
	            		+ ". paragraph has data: " 
	            		+ event.data.x);
	        });
	    });
	});
</script>
</head>
<body>
	<h2>event.data </h2>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<p>This is another paragraph.</p>
</body>
</html>
