<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var myObj = { "name":"John", "age":31, "city":"New York" };
	   //JSON.stringify() 함수는 객체를 텍스트로 변환하는 메서드임
	   var myJSON = JSON.stringify(myObj);
	   console.log("myJSON : " + myJSON);
	   console.log("개똥이");
	   $('#putBtn').on('click', function(){
	   
	      let boardNo = $('#boardNo').val();
	      let title = $('#title').val();
	      let content = $('#content').val();
	      let writer = $('#writer').val();
	      
	   
	      console.log("boardNo : " + boardNo + ", title : " + title + ", content : " + content + ", writer : " + writer)
	      
	      let boardObject = {
	         "boardNo":boardNo,
	         "title":title,
	         "content":content,
	         "writer":writer
	      }
	   
	      console.log("boardObj"+boardObject);
	      
	    //아작나써유..(피)씨다타써
	      //ajax : Asynchronous JavaScript and XML
	      //contentType : 보내는 데이터 타입
	      //dataType : 응답되는 데이터 타입 (갔다가 왔을때 들어오는 타입)
	    /*
	   	 요청URL:/board/12
	   	 요청파라미터 :{boardNo=12, title=개똥이, content=개똥이짱, writer=개똥이 }
	        요청방식 : post
	    
	    */
	      $.ajax({
	          url:"/board/"+boardNo, /* 요청 */
	          headers:{"X-HTTP-Method-Override":"PUT"},
	          contentType:"application/json;charset=utf-8",
	          data:JSON.stringify(boardObject),
	          type:"put",
	          dataType:"text",
	          success:function(result){ /* 응답 */
	             console.log("result : ", result);
	          }
	       });
	   })
	})

</script>
<h3>ajaxHome.jsp</h3>
<hr/>
<form>
	<p><input type="text" id="boardNo" name="boardNo"></p>
	<p><input type="text" id="title" name="title"></p>
	<p>
		<textarea row="3" cols="30" id="content"
			name="content"></textarea>
	</p>
	<p><input type="text" id="writer" name="writer"></p>
	<p><button type="button" id="putBtn" > 비동기 전송</button></p>
</form>
<hr/>
<h2>Convert a JavaScript object into a JSON string, 
   and send it to the server.</h2>
   <h5>
   <p>JSON은 JavaScript Object Notation의 약자.</p>
   <p>JSON은 텍스트에 기반을 둔 데이터 저장 및 교환을 위한 구문임</p>
   <p>JSON은 자바스크립트 객체 표기법으로 작성된 텍스트임</p>
   <p>JSON은 브라우저와 서버 간에 데이터를 교환할 때 데이터는 텍스트일 뿐임</p>
   <p>모든 자바스크립트 객체를 JSON으로 변환하고 JSON을 서버로 보낼 수 있음</p>
   <p>서버에서 받은 JSON을 자바스크립트 객체로 변환할 수 있음</p>
   <!-- 
   client -> server (string 형식으로 전달)
   server -> client (string 형식으로 전달)
   string으로 받아온 데이터를 다시 Object로 변환하여 브라우저에 표기!
   object -> string 으로 변환하는 방식을 serialize 라고 한다!
   string -> object로 다시 변환하는 방식을 deserialize라고 함!
    -->
   </h5>