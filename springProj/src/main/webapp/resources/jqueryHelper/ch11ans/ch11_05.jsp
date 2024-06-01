<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		/* Queue 기능
		- jQuery는 애니메이션 큐 기능을 제공함
		- 여러 개의 animate() 호출을 작성하면 jQuery는 이러한 메서드 호출에 대한 큐를 
			작성 후 하나씩 애니메이션을 호출하여 단계적으로 실행함
		- 서로 다른 애니메이션을 수행하려면 큐 기능을 활용하면 용이함
		*/
    	$("button").click(function(){
           	var div = $("#hydrangeas");
           	//이미지가 초기 화면에서 4단계에 거쳐 변함
           	//animate()가 순서적으로 큐에 저장되었다가 그 순서에 의해
           	//	애니메이션이 실행됨
	        div.animate({height: '300px', opacity: '0.4'}, "slow");
	        div.animate({width: '400px', opacity: '0.8'}, "slow");
	        div.animate({width: '100px', opacity: '0.4'}, "slow");
	        div.animate({height: '100px', opacity: '0.8'}, "slow");
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
