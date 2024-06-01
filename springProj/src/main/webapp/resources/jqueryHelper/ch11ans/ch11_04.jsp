<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/*
	- 애니메이션의 속성 값을 show, hide 또는 toggle로 지정할 수 있음
	- toggle은 show와 hide의 연속임.
	*/
	$(function(){
		//이미지의 width를 중심으로 버튼을 클릭할 때마다 이미지가 나타나고 사라지는 것을 반복수행
    	$("button").click(function(){
	        $("#hydrangeas").animate({width:'toggle'
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
