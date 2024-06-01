<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
	$(function(){
    	function aniDiv(){
    		//<div> 태그 중에서 인덱스가 "0"인 요소를 선택하여
    		//애니메이션을 실행함
    		//14번줄과 15번줄이 반복적으로 실행
	        $("div:eq(0)").animate({width: "50%"}, "slow");
	        $("div:eq(0)").animate({width: "100%"}, "slow", aniDiv);
	    }
    	//애니메이션 실행 함수를 호출(10번줄)
	    aniDiv();
	    
	    $(".btn1").click(function(){
	    	// :animated 선택자 => 현재 애니메이션이 적용된 모든 요소를 선택
	        $(":animated").css("background-color", "red");
	    });
	});
</script>
</head>
<body>
	<h1>기타 연산자</h1>
	<p>
		<img src="/images/ch09_40_01.jpg" />
	</p>
	<button class="btn1">Change color of the animated element</button>
	<div style="background:blue;">Div 1</div>
	<div style="background:green;">Div 2</div>
</body>
</html>
