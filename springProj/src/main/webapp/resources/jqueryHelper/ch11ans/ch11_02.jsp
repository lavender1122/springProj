<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//animate()는 동시에 여러 속성을 애니메이션으로 만들 수 있음
	$(function(){
    	$("button").click(function(){
    		//이미지의 크기가 300px, 200px에서 400px, 300px로 커짐
    		//기존 위치는 왼쪽으로부터 100px만킁 이동, 투명도는 50%로 낮춤
	        $("#hydrangeas").animate(
	        		{width : 400, height : 300, left: '100px', 
									  opacity : '0.5'
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
