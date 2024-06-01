<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/*
	- 3가지 가장 기본적인 필터링 방법은 first(), last() 및 eq()
	- 이 필터를 사용하면 요소 그룹에서 위치를 기반으로 특정 요소를 선택할 수 있음
	- filter()와 not()와 같은 다른 필터링 방법을 사용하면
		특정 기준과 일치하거나 일치하지 않는 요소를 선택할 수 있음
	- first() : 선택한 요소의 첫 번재 요소를 반환
	- last() : 선택한 요소의 마지막 요소를 반환
	- eq() : 선택된 요소의 특정 인덱스 번호를 가진 요소를 반환
	- filter() : 조건을 지정할 수 있음. 기준과 일치하지 않는 요소는
		선택 항목에서 제거되고, 일치하는 요소는 반환함
		- 달러(selector).filter(criteria, function(index))
		- criteria : 필수 항목, 선택자 표현식, jQuery 오브젝트 또는 선택된 요소
				그룹에서 리턴될 하나 이상의 요소를 지정
		- function() : 선택 항목, 세트의 각 요소에 대해 실행할 함수를 지정
				true를 반환하면 요소가 유지되고, false를 반환하면 요소가 제거됨
		- index : 세트 내의 요소의 인덱스 위치
	- not() : 조건과 일치하지 않는 모든 요소를 반환함
	*/
	$(function(){
		$("button").click(function(){
			//this : p 요소
			//p 요소들 중에서 p 요소 하위에 span 요소가 2개인 요소를 제외한 요소를 선택
		    $("p").not(function(){return $("span", this).length == 2;})
		    .css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<div>
		<p>A p element <span>with one span element.</span></p>
		<p>A p element <span>with</span> two <span>span elements.</span></p>
		<p>A p element <span>with one span element.</span></p>
		<p>A p element <span>with</span> two <span>span elements.</span></p>
		<p>A p element with no span element.</p>
	</div>
	<p>This example returns all p elements.</p>
	<button>실행</button>
</body>
</html>
