<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
		//<span> 요소의 조상이 실제로 누구인지 보여줌
		$("button").click(function(){
		    var treeTraversal = $("span").parents().map(function(){
			    return this.tagName;}).get().join(", ");
			    $("span").after("<h2>" + treeTraversal + "<h2>");
		});
	});
</script>
</head>
<body>
  <div>    
    <p>             
      <span>This is is a span element. My ancestors are: </span>    
    </p>  
  </div>
	<button>Add classes to elements</button>
</body>
</html>
