<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
$(function(){
    $("button").click(function(){
    	/*prop() 메서드 : 선택한 요소의 속성과 값을 설정하거나 반환
    	1. .prop(property) : property의 값을 반화
    	2. .prop(property, value) : property의 값 설정
    	3. .prop(property, function(index,currentvalue)) : 함수를 사용한 property와 값 설정
    	4. .prop(property.value, property.value,...) :
    			여러 property와 값 설정
    	*/
    	/*    	
    	attr('checked'): checked
		prop('checked'): false
		css('background-color') : rgb(255, 0, 0)
		
		input checkbox 에서 체크된 값만 가져오기.

		$('input:checkbox[name=checkList]').each(function (index) {
			if($(this).is(":checked")==true){
		    	console.log($(this).val());
		    }
		}
		input checkbox 에서 전체 갯수
		
		$('input:checkbox[name=checkList]').length;
		input checkbox 에서 체크한 갯수
		
		$('input:checkbox[name=checkList]:checked').length;
		class나 id를 가진 태그 안에서 체크된값만 가져오기.
		
		$(".클래스/#아이디").find('input:checked').each(function(index){
		
		}
    	*/
    	//attr()은 그 값을 HTML에서 가져오고, 
    	//prop()는 값의 변화 상태에 따른 값을 다룸
        $("#p1").html("attr('checked'): " 
        	+ $("input").attr('checked')
        + "<br>prop('checked'): " 
        	+ $("input").prop('checked')
		+ "<br>css('background-color') : " 
		+ $("input").css('background-color'));
    });
});
</script>
</head>
<body>

<p><b>Note:</b> Check and uncheck the checkbox and 
then click the button to refresh content.</p>
<button>Check value of attr() and prop()</button>
<br /><br />

<input id="check1" type="checkbox" checked="checked" 
style="background-color:#ff0000" />
<label for="check1">Check me</label>
<p id="p1"></p>
</head>

<body>
</body>
</html>
