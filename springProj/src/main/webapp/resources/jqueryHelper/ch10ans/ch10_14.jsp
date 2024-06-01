<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* scroll 메서드 
	- 사용자가 지정된 요소에서 스크롤 할 때 발생함	
	- 모든 스크롤이 가능한 요소와 윈도우 객체(브라우저 윈도우)에 적용됨
	*/
	var x=0;
	$(function(){
		//사용자가 <div> 태그 내에 대한 스크롤을 하면 스크롤한 횟수를 인쇄함
	    $("div").scroll(function(){
	        $("span").text( x+= 1);
	    });
	});
</script>
</head>
<body>
	<p>Try the scrollbar in the div</p>
	<div style="border:1px solid black;width:200px;height:100px;overflow:scroll;">
    	In my younger and more vulnerable years my father gave me some advice that 
        I've been turning over in my mind ever since.
	<br /><br />
		'Whenever you feel like criticizing anyone,' he told me, just remember that
         all the people in this world haven't had the advantages that you've had.'
	</div>
	<p>Scrolled <span>0</span> times.</p>
</body>

</html>
