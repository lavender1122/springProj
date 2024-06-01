<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	function afterText() {
	    var txt1 = "<b>I </b>";                
	    var txt2 = $("<i></i>").text("love ");
	    var txt3 = document.createElement("b");
	    txt3.innerHTML = "jQuery!";
	    $("img").after(txt1, txt2, txt3);
	}
</script>
</head>
<body>
	<img src="/images/yacht.jpg" alt="jQuery" width="300" height="140" /><br /><br />
	<p>Click the button to insert text after the image.</p>
	<button onclick="afterText()">Insert after</button>
</body>
</html>
