<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
		//mouseenter, mouseleaver, click 이벤트를 <p>에 적용함
		//on() 메서드를 사용하면 여러 메서드를 정의하고,
		//	각 메서드에 대한 각각의 함수를 적용할 수 있음
	    $("p").on({
	    	//마우스가 <p> 태그의 텍스트 위로 이동할 때
	    	//배경을 밝은 회색으로 바꿈
    	    mouseenter : function(){
        	    $(this).css("background-color", "lightgray");
			},
			//마우스가 <p> 태그의 텍스트를 빠져 나올 때
			//배경을 밝은 청색으로 바꿈
    	    mouseleave : function(){
        	    $(this).css("background-color", "lightblue");
        	}, 
        	//마우스가 <p> 태그의 텍스트를 클릭하였을 때
        	//배경을 노란색으로 바꿈
    	    click : function(){
        	    $(this).css("background-color", "yellow");
       		}  
		});
	});
</script>
</head>
<body>
	<p>Click or move the mouse pointer over this paragraph.</p>
</body>
</html>
