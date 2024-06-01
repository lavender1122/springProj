<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	function appendText() {
	    var txt1 = "<b>I </b>";
	    //jQuery를 사용하여 텍스트(love)에 이탤릭체를 적용함
	    var txt2 = $("<i></i>").text("love "); 
	    //JS/DOM을 사용하여 <b> 태그를 생성하고, 그 내용으로 jQuery!를 적용함
	    var txt3 = document.createElement("b"); 
	    txt3.innerHTML = "jQuery!";
	    //웹 페이지의 본문(태그 <body>)에 다음 append() 메서드를 사용하여 텍스트를 추가함
	    $("body").append(txt1, txt2, txt3);
	}
</script>
</head>
<body>
	<p>Click the button to insert text after the image.</p>
	<button onclick="appendText()">Insert after</button>
</body>
</html>
