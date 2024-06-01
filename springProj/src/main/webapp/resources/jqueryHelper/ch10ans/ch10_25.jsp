<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
		test = function(){
		    this.txt = "This is an object property";
		    $("div").click($.proxy(this.myClick, this));
		};
		test.prototype.myClick = function(event){
		    console.log(this.txt);
		    console.log(event.currentTarget.nodeName);
		};
		var x = new test();
});
</script>
</head>
<body>
	<div>This is a div element.</div>
    
</body>
</html>
