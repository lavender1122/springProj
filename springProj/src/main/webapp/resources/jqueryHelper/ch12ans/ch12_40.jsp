<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	
	$(function(){
	    $("button").click(function(){
	        $("p").removeAttr("id class");
	    });
	});
</script>
<style>
	#p1 { color: white;
		  background-color: green;
		  font-size: 20px;
		  padding: 5px;   }
	.blue { color: white;
			background-color: blue;
			font-size: 20px;
		    padding: 5px;   }
</style>
</head>
<body>
	<h1>This is a heading</h1>
	<p id="p1">This is a paragraph.</p>
	<p class="blue">This is another paragraph.</p>
	<button>Remove id and class attribute </button>





</body>
</html>
