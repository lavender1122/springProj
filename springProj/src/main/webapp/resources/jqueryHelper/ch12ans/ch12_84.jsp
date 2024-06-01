<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    $("button").click(function(){
	    	//contents() 메서드는 선택된 요소의 텍스트 및 주석 노드를 포함한
	    	//	모든 직접 하위를 반환함
	    	//텍스트 노드는 요소가 표시하는 실제 텍스트임
	    	//텍스트 노드와 주석 노드를 반환한다는 점을 제외하고는 children() 메서드와 비슷.
	    	//contents() 메서드는 동일한 도메인에 있는 iframe의 HTML에도 엑세스할 수 있음
	    	//<div> 요소 안에 있는 모든 <em>의 텍스트 노드를 검색하여 <b> 요소로 묶음
	        $("div").contents().filter("em").wrap("<b/>");
	    });
	});
</script>
</head>
<body>
	<div><em>Hello world! What a beautiful day!</em></div>
	<p>we search for all the text nodes inside the div element and wrap them </p>
	<button>Find all text nodes in div and wrap them</button><br>
</body>
</html>
