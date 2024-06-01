<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Untitled Document</title>
<script src="/js/jquery.min.js"></script>
<script>
	$(function(){
	    var objPerson = {
	        name: "John Doe",
	        age: 32,
	        test: function(){
	            $("p").after("Name: " + this.name + "<br /> Age: " 
	            		+ this.age);
	        }
	    };
	    //기존 함수를 가져와 특정 구문을 가진 새 함수로 반환. 
	    //객체에 포함된 값으로 함수 내용 변경
	    //(= proxy메서드 = 프록시 메서드)
	    //objPerson => var objPerson
	    //test => objPerson의 test :
	    $("button").click($.proxy(objPerson, "test"));
	});
</script>
</head>
<body>
	<button>Run test function</button>
    <p></p>
</body>
</html>
