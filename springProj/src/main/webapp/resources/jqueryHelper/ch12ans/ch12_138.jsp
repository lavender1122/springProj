<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* is() 메소드
	- 선택한 요소 중 하나가 selectorElement와 일치하는지 확인
	- 달러(selector).is(selectorelement,function(index,element))
	- selectorElement : 필수 항목. 현재 요소 세트를 일치시키는 선택자 표현식,
		요소 또는 jQuery 오브젝트를 지정함
	- function() : 선택 항목. 선택한 요소 그룹에 대해 실행할 함수를 지정
	- index : 요소의 인덱스 위치
	- element : 현재 요소
	*/
	$(function(){
	    $("#button").click(function(){
	    	//매개변수의 selectorElement는 지정된 매개변수로부터의 일치가
	    	//1개 이상 있는 경우는 true를, 그렇지 않은 경우는 false를 반환
	    	//p 요소의 부모가 div인지 확인함
	        if ($("p").parent().is("div")) {
	           $("#demo").text("Parent of p is div"); 
	        }
	    });
	});
</script>
</head>
<body>
	<div>
		<p id="button" >Click me.</p>
	</div>
    <p id="demo"></p>
</body>
</html>
