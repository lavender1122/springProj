<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("#btn1").click(function(){
	        $("div").height(100);
	    });
	    
	    //버튼을 클릭할 때마다 20px씩 높이가 늘어남
	    $("#btn2").click(function(){
	        $("div").height(function(n,c){
	       		return c + 20;
        	});
		});
    });
</script>
</head>
<body>
	<button id="btn1">Set height</button><br /><br />
    <button id="btn2">Use function</button><br /><br />
	<div style="height:50px;border:1px solid blue;
	background-color:lightblue;"></div>
</body>
</html>
