<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#selComCode").on("change",function(){
		let comCode=$(this).val();//change 됬을때 value 값 가져옴
		console.log("comCode:",comCode);
		
		let  data ={
				"comCode":comCode
		}
		
		$.ajax({
			url:"/ComDetCodeInfo/getNextComCode",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			dataType:"text",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(result){
				console.log("result:",result);
				
				$("#comDetCode").val(result)
			}
		})//ajax end
	})
});//$function end
</script>
<h3>공통 코드</h3>
<div class="row">
    <div class="col-md-6">
       <form action="/comCodeInfo/createPost" method="post">
           <div class="card card-primary">
               <div class="card-header">
                   <h3 class="card-title">공통 코드</h3>
               </div>
               <div class="card-body">
               <div class="form-group">
                       <label for="comCode">공통 코드</label>
                       <input type="text" id="comCode" name="comCode" class="form-control"
                           placeholder="공통 코드" required />
               </div>
               <div class="form-group">
                       <label for="comCodeNm">공통 코드 명</label>
                       <input type="text" id="comCodeNm" name="comCodeNm" class="form-control"
                           placeholder="공통 코드 명" required />
               </div>
               <div class="form-group">
                       <label for="descriptions">설명</label>
                       <textarea name="descriptions" id="descriptions"
                           cols="30" rows="5" class="form-control"
                           placeholder="설명" required></textarea>
               </div>
               </div>
               <div class="card-footer">
                   <button type="submit" class="btn btn-primary">공통 코드 등록</button>
               </div>
           </div>
           <sec:csrfInput/>
        </form>
    </div>
    <div class="col-md-6">
    	<form action="/ComDetCodeInfo/createPost" method="post">
        <div class="card card-info">
            <div class="card-header">
                <h3 class="card-title">공통 상세 코드</h3>
            </div>
            <div class="card-body">
	            <div class="form-group">
	                    <label for="selComCode">공통 코드</label>
	                    <select id="selComCode" name="comCode" class="form-control custom-select">
	                    	<option selected disabled>공통 코드 선택</option>
	                    	<c:forEach var="comCodeInfoVO" items="${comCodeInfoVOList}" varStatus="stat">
	                    		<option value="${comCodeInfoVO.comCode}">${comCodeInfoVO.comCodeNm}</option>
	                    	</c:forEach>
	                    </select>
	            </div>
	            <div class="form-group">
	                    <label for="comDetCode">공통 상세 코드</label>
	                    <input type="text" id="comDetCode" name="comDetCode" class="form-control"
	                        placeholder="공통 상세 코드" required />
	            </div>
	            <div class="form-group">
	                    <label for="comDetCodeNm">공통 상세 코드 명</label>
	                    <input type="text" id="comDetCodeNm" name="comDetCodeNm" class="form-control"
	                        placeholder="공통 상세 코드 명" required />
	            </div>
	            <div class="form-group">
	                    <label for="descriptions2">설명</label>
	                    <textarea name="descriptions" id="descriptions2"
	                        cols="30" rows="5" class="form-control"
	                        placeholder="설명" required></textarea>
	            </div>
            </div>
            <div class="card-footer">
                <button type="submit" class="btn btn-primary">공통 상세 코드 등록</button>
            </div>
        </div>
        <sec:csrfInput/>
        </form>
    </div>
</div>