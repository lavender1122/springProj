<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//wrapAll() 메서드 : 선택한 모든 요소 주위에 지정된 HTML 요소를 래핑함
	//wrappingElement에 올 수 있는 값은 HTML 요소, jQuery 객체, DOM 요소
	$(function(){
	    $("button").click(function(){
	    	//<div>로 래핑하였지만 wrapAll()은 
	    	//<div> 전체에 스타일이 적용되었고,
	    	//wrap()는 <div>내의 각 <p>에 스타일이 적용 됨
	        $("p").wrapAll("<div></div>");
	    });
	});
</script>
<style>
	div{background-color: yellow;}
</style>
</head>
<body>
	<p>This is a paragraph.</p>
	<p>This is another paragraph.</p>
	<button>Wrap a div </button>
</body>
</html>
