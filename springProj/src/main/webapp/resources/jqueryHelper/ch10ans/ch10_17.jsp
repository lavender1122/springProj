<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	//요소에 사용자 지정된 네임 스페이스 이벤트를 첨부
	$(function(){
		//<p>에 대한 이벤트 "myOwnEvent"를 실행하고, 그에 따른 함수가 실행됨
		//이때 매개변수로 지정된 "showName"에는 "개똥이"가 지정됨
	    $("p").on("myOwnEvent", function(event, showName){
	    	//기존 <p>의 내용이 수정되어 출력됨
	        $(this).text(showName + "! What a beautiful name!")
	        	.show();
	    });
		//버튼을 클릭하면 <p> 요소에 네임 이벤트(여기에서는 "myOwnEvent")가
		//발생하고, 이 이벤트에 데이터("개똥이")가 주어졌고,
		//이벤트를 트리거하므로, 해당 이벤트가 지정된 곳으로 이동함
	    $("button").click(function(){
	        $("p").trigger("myOwnEvent", ["개똥이"]);
	    });
	});
</script> 
</head>
<body>
	<button>Trigger custom event</button>
	<p>Click the button to attach a customized event on this p element.</p>
</body>

</html>
