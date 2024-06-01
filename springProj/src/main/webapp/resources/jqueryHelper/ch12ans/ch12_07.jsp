<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
  $("button").click(function(){
      var txt = "";
      txt += "Width of div: " + $("#div1").width() + "</br>";
      txt += "Inner width of div: " + $("#div1").innerWidth() + "</br>";
      txt += "Outer width of div: " + $("#div1").outerWidth() + "</br>";
      txt += "Outer width of div (margin included): " + $("#div1").outerWidth(true) 
	         + "</br>" + "</br>";
      txt += "Height of div: " + $("#div1").height() + "</br>";   
      txt += "Inner height of div: " + $("#div1").innerHeight() + "</br>";
      txt += "Outer height of div: " + $("#div1").outerHeight() + "</br>";
      txt += "Outer height of div (margin included): " + $("#div1").outerHeight(true)
	         + "</br>";
      $("#div1").html(txt);
  });
});
</script>
</head>
<body>
	<div id="div1" style="height:180px;width:300px;padding:10px;margin:4px;
                          border:2px solid blue;background-color:lightblue;"></div>
	<br>
	<button>Display dimensions of div</button>
</body>
</html>
