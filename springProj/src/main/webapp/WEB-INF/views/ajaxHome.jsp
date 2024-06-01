<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
/*
웹 브라우저는 다른 작업을 진행하다가 서버로부터 응답을 받았을 때 처리해야 할 일을
XMLHttpRequest 객체 속성의 콜백 함수로 지정함
1) onreadystatechange : readyState 속성이 변경될 때 호출할 함수를 정의함
  서버의 readyState 등록 정보의 값이 변경될 때 실행할 함수를 정의함
2) readyState : XMLHttpRequest의 상태를 보유함
  - 0 : 요청이 초기화되지 않음 : open() 호출 전의 상태
  - 1 : 서버 연결이 설정 됨 : send() 이전 상태
  - 2 : 서버에서 요청이 수신된 상태
  - 3 : 서버에서 처리 중인 상태
  - 4 : 서버에서 요청이 완료되고, 응답이 준비된 상태
3) status : 서버의 처리 결과 코드
  - 200 : OK(성공)
  - 403 : forbidden(접근 거부)
  - 404 : Page not found(파일/페이지 없음)
4) statusText : 상태 텍스트를 반환(ex : OK 또는 Not Found)
*/
$(function(){
	/*
	   요청URI : /register/hongkd
	   pathVariable : hongkd
	   요청방식 : get
	   */
	$("#registerBtn01").on("clikc",function(){
		$.get("/register2/hongkd",function(result){
// 			console.log("result:", result)
			if(result=="SUCCESS"){
			alret("SUCCESS");
			}
		});
	});
	$("#registerBtn02").on("click",function(){
		let userId= $("#userId").val();
		let password=$("#password").val();
		
		//json Object
		let userObject = {
				"userId":userId,
				"password":password
		};
		//달러.ajax() : 비동기 AJAX(Asynchronous Javascript Xml) 요청을 수행
	       //달러.ajaxSetup() : 향후 AJAX 요청에 대한 기본 값을 설정
	       //달러.ajax() 메서드를 사용하면 AJAX의 다양한 설정을 미리 할 수 있고,
	       //   응답이 성공했을 때의 처리, 응답이 실패했을 때츼 처리를 단락 형태로
	       //   구분하여 처리할 수 있음.
	       //   이들 작업이 완료된 후에 처리해야 할 것이 있으면 추가로 작업할 수 있도록 구분함
		$.ajax({
			url:"/register2/hongkd/pw01",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(userObject),//서버 보낼때 object 타입 사용할수 없어서 문자열로 변환
			type:"post",
			success:function(result){
				console.log("result", result);
				if(result==="SUCCESS"){
					alert("SUCCESS")
				}
			}
			,
	         error : function(xhr, ajaxSettings, thrownError) //응답이 실패했을 떄 처리
	         {
	             alert("수정하는데 오류가 발생하였습니다.");
	         },
	         complete : function()
	         {
	             location.replace();
	         }
		})
	});
	$("#registerBtn03").on("click",function(){
		let userId=$("#userId").val();
		let password=$("#password").val();
		
		let userObject={
			"userId":userId,
			"password":password
		}
		console.log("userObject",userObject);
		$.ajax({
			url:"/register03",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(userObject),
			type:"post",
			dataType:"text",
			success:function(result){
				console.log("result",result);
				if(result==="SUCCESS"){
					alert("SUCCESS")
				}
			}
		})
	});
	$("#registerBtn04").on("click",function(){
		let userId=$("#userId").val();
		let password=$("#password").val();
		
		let userObject={
			"userId":userId,
			"password":password
		};
		/*
	      요청URI : /register04
	      요청파라미터(JSON->String) : {userId:a001,password:java}
	      요청방식 : post
	      */
		$.ajax({
			url:"/register04",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(userObject),
			type:"post",
			dataType:"text",
			success:function(result){
				console.log("result",result);
				if(result==="FAIDED"){
					alert("FAIDED")
				}
			}
		})
	})
	$("#registerBtn05").on("click",function(){
		let userId=$("#userId").val();
		let password=$("#password").val();
		
		let userObject={
			"userId":userId,
			"password":password
		};
		console.log("userObject",userObject)
		/*
	      요청URI : /register05
	      요청파라미터(JSON->String) : {userId:a001,password:java}
	      요청방식 : post
	      */
		$.ajax({
			url:"/register05?userId="+userObject.userId+"&password="+userObject.password,
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(userObject),
			type:"post",
			dataType:"text",
			success:function(result){
				console.log("result",result);
				if(result==="SUCCESS"){
					alert("SUCCESS")
				}
			}
		})
	})
	$("#registerBtn0501").on("click",function(){
		let userId=$("#userId").val();
		let password=$("#password").val();
		
		let userObject={
			"userId":userId,
			"password":password
		};
		console.log("userObject",userObject)
		/*
	      요청URI : /register05
	      요청파라미터(JSON->String) : {userId:a001,password:java}
	      요청방식 : post
	      */
		$.ajax({
			url:"/register0501",
			data:userObject,
			type:"post",
			success:function(result){
				console.log("result",result);
				if(result==="SUCCESS"){
					alert("SUCCESS")
				}
			}
		})
	})
	$("#registerBtn06").on("click",function(){
		let userId=$("#userId").val();
		let password=$("#password").val();
		
		let userObject={
			"userId":userId,
			"password":password
		};
		console.log("userObject",userObject)
		$.ajax({
				url:"/register06/hongkd",
				contentType:"application/json;charset=UTF-8",
				data:JSON.stringify(userObject),
				type:"post",
				success:function(result){
					console.log("result:", result)
						if(result=="SUCCESS"){
							alert("SUCCESS");
						}
					}
				});
		});	
	$("#registerBtn07").on("click",function(){
		let userObjectArray=[
			{"userId":"name01","password":"pw01"},
			{"userId":"name02","password":"pw02"}
		];
		$.ajax({
			url:"/register07",
			contentType:"application/json;charset=UTF-8",
			data:JSON.stringify(userObjectArray),
			type:"post",
			success:function(result){
				console.log("result:",result);
				if(result==="SUCCESS"){
					alert("SUCCESS");
				}
			}
		})
	});	
	$("#registerBtn08").on("click",function(){
		let userId=$("#userId").val();
		let password=$("#password").val();
		
		let userObject={
			"userId":userId,
			"password":password,
			"address":{
				"postCode":"12345",
				"location":"대전"
			},
			/* List라서 대괄호[] 사용 ,자바빈{} 사용 */
			"cardList":[
				{"no":"2456","validMonth":"24/05"},
				{"no":"1234","validMonth":"27/02"}
			]
		};
		console.log("userObject",userObject)
		$.ajax({
			url:"/register08",
			contentType:"application/json;charset=UTF-8",
			data:JSON.stringify(userObject),
			type:"post",
			dataType:"text",
			success:function(result){
				console.log("result:",result);
				if(result==="SUCCESS"){
					alert("SUCCESS");
				}
			}
		})
	});	
	
	//파일업로드 Ajax 방식 요청 처리 
	//event => 체인지된 input태그 들어옴
	$("#inputFile").on("change",function(event){
		console.log("change");
		let userId=$("#userId").val();
		let password=$("#password").val();
		
		//event.target: <input type="file".../>
		let files= event.target.files;
		let file = files[0]; // [0]라고 꼭 말해야함
		console.log("file",file);
		//formData : <form></form> 생성
		let formData = new FormData();
		/* append : 부모의 마지막 자식요소 추가
		<form>
			<input type="text" name="userId" value="honggd"/>
			<input type="password" name="password" value="1234"/>
			<input type="file" name ="file"/>
		</form>
		*/
		formData.append("userId",userId)
		formData.append("password",password)
		formData.append("file",file)
		$.ajax({
			url:"/uploadAjax",
			processData:false,
			contentType:false,
			data:formData,
			type:"post",//파일업로드 할때 무조건 post 방식
			success:function(data){
				console.log("data",data);
				alert(data);
			}
			
		})
	});
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
	   
// 	      console.log("boardObj"+boardObject);
	      
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
	<p><input type="text" id="userId" name="userId"></p>
	<p><input type="password" id="password" name="password"></p>
	<p><button type="button" id="putBtn" > 비동기 전송</button></p>
	<p><button type="button" id="registerBtn01">경로변수01</button></p>
	<p><button type="button" id="registerBtn02">경로변수02</button></p>
	<p><button type="button" id="registerBtn03">경로변수03</button></p>
	<p><button type="button" id="registerBtn04">JSON오브젝트1</button></p>
	<p><button type="button" id="registerBtn05">JSON오브젝트5</button></p>
	<p><button type="button" id="registerBtn0501">JSON오브젝트0501</button></p>
	<p><button type="button" id="registerBtn06">JSON오브젝트06</button></p>
	<p><button type="button" id="registerBtn07">JSON오브젝트07</button></p>
	<p><button type="button" id="registerBtn08">JSON오브젝트08</button></p>
	<p><input type="file" name="inputFile" id="inputFile"/></p>
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