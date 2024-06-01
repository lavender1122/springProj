<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
	//체크된 모든 체크 박스 또는 라디오 버튼을 선택
	$(function(){
		// :checked 선택자를 적용
		// checked 속성이 "checked"로 설정되어 있는 요소의 배경색을 
		// 빨간색으로 설정
		$(":checked").wrap("<span style='background-color:red'>");
	
		//checkbox 선택이 바뀌면 그 요소의 배경색을 파란색으로 바꿈
		$(":checkbox[name='vehicle']").on({
			change:function(e){
				$(this).wrap("<span style='background-color:blue'>");
				
				$("input[name='vehicle']").each(function(index){
					if($(this).is(":checked")==true){
						console.log($(this).val());
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<h2>기타 연산자</h2>
	<p>
		<img src="/images/ch09_37_01.jpg" />
	</p>
	<form action="">
		Name: <input type="text" name="user"><br>
		bike: <input type="checkbox" name="vehicle" value="Bike"><br>
		car: <input type="checkbox" name="vehicle" value="Car" checked="checked"><br>
		airplane: <input type="checkbox" name="vehicle" value="Airplane"><br>
</form>

</body>
</html>
