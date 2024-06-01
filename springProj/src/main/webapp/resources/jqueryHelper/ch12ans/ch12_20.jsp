<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/*
	append() 메서드 : 선택한 HTML 요소의 끝 부분에 내용을 삽입
	prepend() 메서드 : 선택한 HTML 요소의 앞부분에 내용을 삽입 
	*/
	$(function(){
		//append() 메서드를 사용하여 모든 <p>요소의 문장 끝에 내용을 추가
	    $("#btn1").click(function(){	    	
	        $("p").append(" <b>Appended text</b>.");
	    });
	    $("#btn2").click(function(){
	        $("ol").append("<li>Appended item</li>");
	    });
	    //prepend() 메서드에 의해 모든 <p>요소의 문장 앞과 목록의 앞에 내용을 추가
		$("#btn3").click(function(){
	        $("p").prepend("<b>Prepended text</b>. ");
	    });
	    $("#btn4").click(function(){
	        $("ol").prepend("<li>Prepended item</li>");
	    });
	});
</script>
</head>
<body>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<ol>
	  <li>List item 1</li>
	  <li>List item 2</li>
	  <li>List item 3</li>
	</ol>
	<button id="btn1">Append text</button>
	<button id="btn2">Append list items</button>
    <button id="btn3">Prepend text</button>
	<button id="btn4">Prepend list item</button>
</body>
</html>
