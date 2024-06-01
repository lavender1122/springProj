<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Untitled Document</title>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
	$(function(){
	// :hidden 선택자는 숨겨진 요소를 선택 함
	// 숨겨진 요소?
	// - 표시하도록 설정 : 없음
	// - type="hidden"인 양식 요소
	// - 너비 및 높이를 0으로 설정
	// - 숨겨진 부모 요소(자식 요소도 숨김)
		$("#hidden").click(function(){
			//<p> 태그의 display 속성 값이 "none"으로
			//설정되어 초기 상태에는 화면에 나타나지 않았지만
			//버튼 클릭 시 3.5 초 동안 천천히 화면에 나타남
		    $("p:hidden").show(3500);
		});
	
	// :visible 선택자는 현재 보이는 모든 요소를 선택 함
	// 보이는 요소는 :hidden에서 정의된 숨겨진 요소가 아닌 경우임
		$("#visible").click(function(){
			//화면에 보이는 <p> 태그 요소를 선택
    		$("p:visible").css("background-color", "yellow");
		});
	});
</script>
</head>
<body>
	<h2>This is a heading</h2>
	<p>This is a pargraph.</p>
	<p>This is another paragraph.</p>
	<p style="display:none">This is a hidden paragraph.</p>
	<button id="hidden">hidden</button>
    <button id="visible">visible</button>
</body>
</html>
