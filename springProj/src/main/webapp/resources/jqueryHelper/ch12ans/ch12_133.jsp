<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* each() 메소드
	- 일치하는 각 요소에 대해 실행할 함수를 지정함
	- return false를 사용하여 루프를 일찍 종료할 수 있음
	- 달러(selector).each(function(index, element))
	- function() : 필수 항목. 일치하는 각 요소에 대해 실행할 함수
	- index : 선택자의 인덱스 위치
	- element : 현재 요소(this 선택자도 사용할 수 있음)
	*/
	$(function(){
		var txt="each Text : ";
		//버튼을 클릭하면 각 li 요소 각각에 대해 함수가 적용됨
		//각 li 요소의 텍스트를 결합하여 p 태그에 출력함
	    $("button").click(function(){
	        $("li").each(function(){
				txt += $(this).text();
	        });
		    $("p").text(txt);
	    });
	});
</script>
</head>
<body>
	<button>the value of each list item</button>
	<ul>
		<li>Coffee </li>
		<li>Milk </li>
		<li>Soda </li>
	</ul>
    <p></p>

</body>
</html>
