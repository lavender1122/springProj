<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* empty() 메서드
	- 선택한 요소에서 모든 자식 노드와 내용을 제거함
	- detach() : 데이터 및 이벤트를 제거하지 않고 요소를 제거
	- remove() : 요소와 해당 데이터 및 이벤트를 제거
	*/
	$(function(){
    	$("#btn01").click(function(){
    		//박스 자체가 없어짐
    		//<div> 태그와 자식 노드인 <p>까지도 제거됨
	        $("#div1").remove();
	    });
    	$("#btn02").click(function(){
    		//선택된 요소들의 자식 요소만 제거되므로
    		//<p>만 제거되어 박스는 남아있음
	        $("#div1").empty();
	    });		
	});
</script>
</head>
<body>
	<div id="div1" style="height:100px; width:300px; border:1px solid black;
    		background-color:yellow;">
	         This is some test in the div.
		<p>This is a paragraph in the div</p>
		<p>This is another paragraph in the div</p>
    </div>
    <br />
	<button id="btn01">Remove div elements</button>
	<button id="btn02">Empty div elements</button>
    
</body>
</html>
