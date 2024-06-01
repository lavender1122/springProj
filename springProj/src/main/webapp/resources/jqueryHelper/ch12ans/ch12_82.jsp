<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<style>
.descendants * { 
    display: block;
    border: 2px solid orange;
    color: blue;
    padding: 5px;
    margin: 15px;
}
</style>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
		//<span> 요소를 jQuery 객체로 반환
	    var $findSpanElements = $("span");
	    //모든 <ul> 요소의 jQuery 컬렉션을 사용하여 자손 검색 필터링
	    //<ul> 요소의 자손인 모든 <span> 요소를 jQuery 객체로 반환
	    $("ul").find($findSpanElements).css({"color": "red", "border":
											  "2px solid green"});
	});
</script>
</head>
<body class="ancestors">body (great-grandparent)
	<div style="width:500px;">div (grandparent)
    	<ul>ul (direct parent)  
    		<li>li (child)
	        	<span>span (grandchild)
	            	<span>span (great-grandchild)
    	            	<span>span (great-great-grandchild)</span>
	                </span>
            	</span>
			</li>
		    <li>li (child)
				<span>span (grandchild)</span>
			</li>
    	</ul>   
	</div>
</body>
</html>
