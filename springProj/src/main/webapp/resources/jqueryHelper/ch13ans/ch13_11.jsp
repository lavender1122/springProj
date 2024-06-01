<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
$(function(){
    $("button").click(function(){
	   $.get("/upload/demo_get.jsp", function(data, status){
       	  console.log("Data: " + data + "\nStatus: " + status);
       });
	});	
    
    $("#btn2").click(function(){
    	$.ajax({
    		url:"/upload/abcde.txt",
    		async:false,
    		success:function(result){
    			$("#div").html(result);
    		}
    	});
    });
});
</script>
</head>
<body>
	<div id="div"></div>
	<button>Send an HTTP POST request to a page and get the result back</button>
	<button id="btn2">실행</button>
</body>
</html>
