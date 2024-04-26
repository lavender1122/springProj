<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<section class="content">
	<!-- 
	   요청URI : /contUs/createPost
	   요청파라미터 : {name=개똥이,email=test@test.com,subject=궁금해요,message=궁금한게 궁금해요}
	   요청방식 : post
   -->
	<form id="frm" name="frm" action="/contUs/createPost" method="post">
	<div class="card">
		<div class="card-body row">
			<div
				class="col-5 text-center d-flex align-items-center justify-content-center">
				<div class="">
					<h2>
						Admin<strong>LTE</strong>
					</h2>
					<p class="lead mb-5">
						123 Testing Ave, Testtown, 9876 NA<br> Phone: +1 234 56789012
					</p>
				</div>
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
					<label for="message">Message</label>
					<div id="ckMessage"></div>
					<textarea id="message" name="message" class="form-control" rows="4" cols="30" 
					placeholder="문의글을 입력해주세요"></textarea>
				</div>
				<div class="form-group">
					<input type="reset" class="btn btn-secondary" value="초기화" />
					<input type="submit" class="btn btn-primary" value="문의하기" />
				</div>
			</div>
		</div>
	</div>
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
 })
</script>
