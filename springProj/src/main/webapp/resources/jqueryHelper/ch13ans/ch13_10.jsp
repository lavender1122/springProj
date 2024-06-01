<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
$(function(){
    $("button").click(function(){
        $.ajax({
        	url: "/js/demo_ajax_script.js", 
        	dataType: "script"
        });
    });
});
</script>
</head>
<body>
	<div id="div1"><h2>Let jQuery AJAX Change This Text</h2></div>
	<button>Get External Content</button>
</body>
</html>
