<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
//e : onchange 이벤트
function handleImg(e){
   //<p id="pImg"></p> 영역에 이미지 미리보기를 해보자
   //이벤트가 발생 된 타겟 안에 들어있는 이미지 파일들을 가져와보자
   let files = e.target.files;
   //이미지가 여러개가 있을 수 있으므로 이미지들을 각각 분리해서 배열로 만듦
   let fileArr = Array.prototype.slice.call(files);
   //파일 타입의 배열 반복. f : 배열 안에 들어있는 각각의 이미지 파일 객체
   /*
   let arr = ["피자","떡볶이","탕수육"];
   //*******
   arr.forEach(function(str){
      console.log("str : " + str);
   });
   
   $.each(arr,function(idx,str){
      console.log("str[" + idx + "] : " + str);
   });
   */
   fileArr.forEach(function(f){
      //이미지 파일이 아닌 경우 이미지 미리보기 실패 처리(MIME타입)
      if(!f.type.match("image.*")){
         alert("이미지 확장자만 가능합니다.");
         //함수 종료
         return;
      }
      //이미지 객체를 읽을 자바스크립트의 reader 객체 생성
      let reader = new FileReader();
      
      $("#pImg").html("");
      
      //e : reader가 이미지 객체를 읽는 이벤트
      reader.onload = function(e){
         //e.target : f(이미지 객체)
         //e.target.result : reader가 이미지를 다 읽은 결과
         let img_html = "<img src=\"" + e.target.result + "\" style='width:50%;' />";
         //p 사이에 이미지가 렌더링되어 화면에 보임
         //객체.append : 누적, .html : 새로고침, .innerHTML : J/S
         $("#pImg").append(img_html);
      }
      //f : 이미지 파일 객체를 읽은 후 다음 이미지 파일(f)을 위해 초기화 함
      reader.readAsDataURL(f);
   });//end forEach
}
$(function(){
	//이미지미리보기 시작
	$("#uploadFile").on("change",handleImg);
	//이미지미리보기 끝
	$("#btnSave").on("click",function(){
		let data=$("#frm").serialize();
		let dataArray=$("#frm").serializeArray();
		
		console.log("data:", data);
		console.log("dataArray:", dataArray);
		let param={};
		
		dataArray.map(function(data,index){
		//    key				value
			param[data.name] = data.value;
		});
		console.log("param:", param);
		//-------------------------------------
		let title=$("input[name='title']").val();
		let category=$("input[name='category']").val();
		let price=$("input[name='price']").val();
		
		//<form></form>
		let formData= new FormData();
		formData.append("title",title);
		formData.append("category",category);
		formData.append("price",price);
		
		/*
		<form>
	      <input type="text" name="title" value="개똥이데이" />
	      <input type="text" name="category" value="영화" />
	      <input type="text" name="price" value="12000" />
	      <input type="file" name="pictures"  />
	      <input type="file" name="pictures"  />
	      <input type="file" name="pictures"  />
	    </form>
	    */
		let inputFile = $("#uploadFile");
	    let files = inputFile[0].files;
	    console.log("file.length:"+files.length);
	    for(let i=0;i<files.length;i++){
	    	formData.append("pictures",files[i]);
	    }
		$.ajax({
			url:"/createFormData",
			processData:false,
			contentType:false,
			data:formData,
			type:"post",
			dataType:"text",
			success:function(result){
				console.log("result",result)
			}
		})
// 		let jsonObj = {
// 				"title":title,
// 				"category":category,
// 				"price":price
// 		}
// 		console.log("jsonObj:", jsonObj);
		
		//post : I/U/D(DB 변화 있음)
		//get : select(DB 변화 없음)
// 		$.ajax({
// 			url:"/createAjax",
// 			contentType:"application/json;charset=utf-8",
// 			data	:JSON.stringify(param),
// 			type:"post",
// 			dataType:"json",
// 			success:function(result){
// 				console.log("result:",result);
// 				if(result!=null){
// 					location.href="/list";
// 				}
// 			}
// 		});
		
	});
});
</script>
</head>
<body>
<h1>책 등록</h1>
<!-- BookController.java에서 mav.addObject("title", "도서생성"); -->
<h5>${title}</h5>
<!-- 
요청URI : /crate
요청파라미터 : {title=개똥이의 모험, category=소설, price=12000,pictures=파일객체들}
요청방식 : post
-->
<!-- /create URL 같지만 방식이 다르다 그래서 다른 요청이다 -->
<form id="frm" action="/create" method="post" enctype="multipart/form-data">
	<!-- 폼데이터 -->
	제목 : <input type="text" name="title" placeholder="제목"> <br>
	카테고리 : <input type="text" name="category"placeholder="카테고리"><br>
	가격 : <input type="number" name="price" placeholder="가격"><br>
	<p id ="pImg"></p>
	<p> 도서이미지: <br>
		<input type="file" id ="uploadFile" name="pictures" multiple>
	</p>
	<input type="button" id="btnSave" value="저장">
</form>
</body>
</html>