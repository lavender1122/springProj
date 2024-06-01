<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	/* submit 메서드
	- 양식이 제출될 때 발생 함
	- <form> 요소에서만 사용할 수 있음	
	
	if(jQuery.trim(lprodNm)==""){
		alert("상품분류명을 작성해주세요");
		$("#lprodNm").focus();
		return false;
	}
	*/
	$(function(){
		//[submit]버튼이 클릭되면 실행 함.
	    $("form").submit(function(){
	       alert("제출되었습니다...!");
	    });
	});
</script>
</head>
<body>
	<form action="">
		First name: <input type="text" name="FirstName" value="Mickey" /><br />
		Last name: <input type="text" name="LastName" value="Mouse" /><br />
		<input type="submit" value="Submit" />
	</form>
</body>

</html>
