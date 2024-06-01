<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<section class="content">
	<!-- 
	   요청URI : /contUs/createPost
	   요청파라미터 : {name=개똥이,email=test@test.com,subject=궁금해요,message=궁금한게 궁금해요}
	   요청방식 : post
   -->
	<form id="frm" name="frm" action="/contUs/createPost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<div class="card">
		<div class="card-body row">
			<div
				class="col-5 text-center d-flex align-items-center justify-content-center"
				id = "pImg">
			</div>
			<div class="col-7">
				<div class="form-group">
					<label for="name">Name</label> 
					<input type="text" maxlength="30" name="name"
						id="name" class="form-control" placeholder="작성자" required/>
				</div>
				<div class="form-group">
					<label for="email">E-Mail</label> 
					<input type="email" maxlength="50" name="email"
						id="email" class="form-control" placeholder="이메일" required />
				</div>
				<div class="form-group">
					<label for="subject">Subject</label> 
					<input type="text" name="subject"
						id="subject" class="form-control" placeholder="제목" required />
				</div>
				<div class="form-group">
					<label for="subject">file</label> 
					<input type="file" name="uploadFiles"
						id="uploadFiles" class="form-control" placeholder="파일"  multiple/>
				</div>
				<div class="form-group">
					<label for="message">Message</label>
					<div id="ckMessage"></div>
					<textarea id="message" name="message" class="form-control" rows="4" cols="30" 
					placeholder="문의글을 입력해주세요"></textarea>
				</div>
				<div class="form-group">
					<input type="reset" class="btn btn-secondary" value="초기화" />
					<input type="submit" id="btnSubmit" class="btn btn-primary"  value="문의하기" />
				</div>
			</div>
		</div>
	</div>
	<sec:csrfInput />
	</form>
</section>
<script type="text/javascript">
/*
ClassicEditor : ckeditor5.js에서 제공해주는 객체
uploadUrl : 이미지 업로드를 수행할 URL
window.editor-editor : editor 객체를 window.editor라고 부름
 */
ClassicEditor.create(document.querySelector('#ckMessage'),{ckfinder:{uploadUrl:'/image/upload?${_csrf.parameterName}=${_csrf.token}'}})
 .then(editor=>{window.editor=editor;})
 .catch(err=>{console.error(err.stack);});
 $(function(){
	 //ckeditor 내용 => textarea 로 복사
	 $(".ck-blurred").keydown(function(){
		 console.log("str : ", window.editor.getData());
		 $("#message").val(window.editor.getData());
	 })
	 $(".ck-blurred").on("focusout",function(){ //focusout되면   $("#message").val 값 복사
		 $("#message").val(window.editor.getData());
	 })
	 $("#uploadFiles").on("change",handleImg); //이미지 미리보기
	 $("#btnSubmit").on("click",function(){
		//일반데이터 
		 let name=$("#name").val();
		 let email=$("#email").val();
		 let subject=$("#subject").val();
		 let message=$("#message").val();
		 
		 let formData = new FormData();
						//"name",value
		 formData.append("name",name);//vo랑 같게 써야된다
		 formData.append("email",email);//vo랑 같게 써야된다
		 formData.append("subject",subject);//vo랑 같게 써야된다
		 formData.append("message",message);//vo랑 같게 써야된다
		 //폼데이터 
		 let fileObj =$("#uploadFiles");
		 console.log("fileObj: ",fileObj); //ok
		 //선택한 파일객체들
		 let files = fileObj[0].files;
		 console.log("files.lentgh: ",files.length);

		 for(let i =0;i<files.length;i++){
			formData.append("uploadFiles",files[i]);
			console.log(files[i]);//ok
		 }
// 		 $.ajax({
// 			url:"/contUs/createFormData",
// 			processData:false,
// 			contentType:false,
// 			data:formData,
// 			type:"post",
// 			dataType:"text",
// 			success:function(result){
// 				console.log("result:",result);
// 			}
// 		 })
	 })
 })
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
</script>
