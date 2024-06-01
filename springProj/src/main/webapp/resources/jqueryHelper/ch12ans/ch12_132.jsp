<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* add() 메서드
	- 기존 요소 그룹에 요소를 추가함
	- 전체 문서에 요소를 추가하거나 context 매개변수가 지정된 경우 context 요소
		내부에 요소를 추가함
	- 달러(selector).add(element, context);
	- element : 필수 항목. 선택자 표현식. jQuery 객체. 하나 이상의 요소 또는
		HTML 일부를 기존 요소 그룹에 추가하도록 지정
	- context : 선택 항목. 선택자 표현식이 일치하기 시작해야 하는 문서의 지점을 지정
	*/
	$(function(){
		$("button").click(function(){
			//기존 p 요소에 HTML 일부인 br과 span 요소를 추가함
			//	HTML 일부를 추가하기 위해서는 appendTo() 메서드
			//	또는 prependTo() 메서드를 사용하여 
			//	추가할 위치를 지정함
// 	        $("p").add("<br /><span>A new span element.</span>");
			$("p").append("<br /><span>A new span element.</span>");
	    });
    });
</script>

</head>
<body>
	<button>Add a span element</button>
	<p>A p element.</p>

</body>
</html>
