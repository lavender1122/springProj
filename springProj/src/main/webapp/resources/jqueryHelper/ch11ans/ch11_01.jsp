<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* animate() 메서드
	- CSS 속성 집합의 사용자 정의 애니메이션을 수행함
	- CSS 스타일을 사용하여 요소를 한 상태에서 다른 상태로 변경하는 역할을 함
	- CSS 속성 값이 점진적으로 변경되어 애니메이션 효과를 만드는 것임
	- CSS 속성 값 중에서 숫자 값만 애니메이션으로 만들 수 있음
	- height값, width값, margin값 들은 숫자이므로 이 메서드에 의해
			CSS 속성 값을 바꿀 수 있음
	*/
	$(function(){
    	$("button").click(function(){
    		//이미지의 width 속성 값을 300px에서 400px로 바꿈
	        $("#hydrangeas").animate({width : 400});
	    });
	});
</script> 
</head>
<body>
	<button>Start Animation</button><br><br>
	<!-- 일반적으로 HTML 요소는 고정된 위치(static)에 있으며 이동할 수 없음
	위치를 조작하려면 먼저 요소의 CSS position 속성을 relative, fixed 또는
	absolute로 설정해야 함
	 -->
   	<img id="hydrangeas" src="/images/hydrangeas.jpg" alt="hydrangeas" 
              width="300" height="200" style="position:absolute" />
</body>
</html>
</body>
</html>
