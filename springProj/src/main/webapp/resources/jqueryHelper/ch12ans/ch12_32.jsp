<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* detach() 메서드
	- 모든 텍스트 및 자식 노드를 포함하여 선택된 요소를 제거함.
	- 데이터 및 이벤트를 유지함
	- 제거된 요소의 복사본도 유지하므로 나중에 다시 삽입할 수 있음
	- 요소와 해당 데이터 및 이벤트를 제거하려면 remove() 메서드를 사용
	- 선택한 요소에서 내용만 제거하려면 empty() 메서드를 사용
	*/
	$(function(){
	    var x;
	    $("#btn1").click(function(){
	    	//<p> 요소를 detach하여 화면에서 지움.
	    	//화면에서는 지워지지만 지워진 내용은 변수 x에 저장됨
	        x = $("p").detach();
	    });
	    $("#btn2").click(function(){
	    	//변수 x에 저장된 <p>의 요소를 <body>의 앞부분에 삽입함	    	
	        $("body").prepend(x);
	    });
	});
</script>
</head>
<body>
	<p>This is a paragraph.</p>
	<button id="btn1">Remove p element</button>
	<button id="btn2">Restore p element</button>


</body>
</html>
