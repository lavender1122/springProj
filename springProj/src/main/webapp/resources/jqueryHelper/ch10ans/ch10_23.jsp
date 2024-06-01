<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* trigger() / triggerHandler() 메서드
	선택된 요소에 대해 지정된 이벤트와 이벤트의 기본 동작(ex : 양식 제출 등)을
	자동 실행함. 두 메서드는 유사함.
	triggerHandler() 메서드는 이벤트의 기본 작동을 자동 실행하지 않음
	
	$(selector).trigger(event,eventObj,param1,param2,...)
	- event : 필수 항목, 지정된 요소에 대해 자동 실행할 이벤트를 지정
	- param1, param2,... : 선택 사항, 이벤트 처리기에 던달할 추가 매개변수
	*/
	$(function(){	
		//<input> 태그에 대한 select 이벤트를 실행
	    $("input").select(function(){
	    	//<input> 태그 다음에 "text market"를 출력함
	        $("input").after(" Text marked!");
	    });
	  	//버튼 클릭 시 <input> 태그에 대해 trigger() 메서드를 실행함.이 때 매개변수로 
		//주어진 이벤트를 실행하게 됨
	    $("button").click(function(){
// 	        $("input").trigger("select");
	        $("input").triggerHandler("select");
	    });
	});
</script>
</head>
<body>
	<input type="text" value="Hello World" /><br /><br />
	<button>Trigger test</button>
</body>

</html>
