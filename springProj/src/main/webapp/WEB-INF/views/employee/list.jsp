<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<title>직원 목록</title>
<script type="text/javascript">
	$(function() {
		$(".clsEmpNo").on("click",function(){
			console.log("clsEmpNo에 왔다");
			//this : 동일 클래스 속성의 오브젝트 배열 중에서 클릭한 바로 그 오브젝트
			//클릭 :<td class="clsEmpNo" data-toggle="modal" data-target="#modal-lg" data-emp-no="A004">A004</td>
			let empNo = $(this).data("empNo"); //A014
			console.log("empNo:",empNo);
			//JSON오브젝트
			let data ={
					"empNo":empNo
			};
			console.log("data:",data);
			
			
			/*
		    요청URI : /employee/detailAjax
		    요청파라미터(JSON.stringify) : {"empNo":"A013"}
		    요청방식 : post
		    */
		    $.ajax({
		    	url:"/employee/detailAjax",
		    	contentType:"application/json;charset=utf-8",
		    	data:JSON.stringify(data),
		    	type:"post",
		        beforeSend:function(xhr){
		               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		            },
		    	success:function(result){
		    		console.log("result",result)
		    		$("#empNo").val(result.empNo);
		    		$("#empName").val(result.empName);
		    		$("#empAddress").val(result.empAddress);
		    		$("#empTelno").val(result.empTelno);
		    		$("#empSalary").val(result.empSalary);
		    		$("img[name='filename']").attr("src","/resources/upload/"+result.filename);
		    	}
		    })
		});
		$("#btnSearch").on("click", function() {
			let keyword = $("#keyword").val();
			console.log("keyword:" + keyword);
			let data = {
				"keyword" : keyword
			};
			console.log("data:" + data);
			$(this).parent().submit();

		});
	});//$function end
</script>
</head>
<body>
	<h3>직원 목록</h3>
	<p>
		<%-- ${employeeVOList} --%>
	</p>
	<p>
	<form>
		<input type="text" name="keyword" value="" placeholder="검색어 입력하세요">
		<!-- submit /button/ reset -->
		<button type="button" id="btnSearch">검색</button>
	</form>
	<a href="./create">직원등록</a>
	</p>
	<table border=1>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>급여</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="employeeVO" items="${articlePage.content}"
				varStatus="stat">
				<tr>
					<td class="clsEmpNo" data-toggle="modal" data-target="#modal-lg"
						data-emp-no="${employeeVO.empNo}">${employeeVO.empNo}</td>
					<td><a href="/employee/detail?empNo=${employeeVO.empNo}">${employeeVO.empName}</a></td>
					<td>${employeeVO.empAddress}</td>
					<td>${employeeVO.empTelno}</td>
					<td>${employeeVO.empSalary}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p data-toggle="modal" data-target="#modal-lg">Open Modal</p>
	<!-- 직원 상세 모달 지삭 -->
	<p>
	<div class="modal fade" id="modal-lg">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Large Modal</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				  <p><input type="text"  id="empNo" name="empNo" placeholder="직원 번호" /></p>
			      <p><input type="text"  id="empName" name="empName" class="formdata" placeholder="직원 명" /></p>
			      <p><input type="text"  id="empAddress" name="empAddress"  class="formdata" placeholder="직원 주소" /></p>
			      <p><input type="text"  id="empTelno" name="empTelno"  class="formdata" placeholder="직원 연락처" /></p>
			      <p><input type="number"id="empSalary" name="empSalary"  class="formdata" placeholder="직원 급여" /></p>
			      <p>
			         <img src="" name="filename" class="formdata"  />
			      </p>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	</p>
	<!-- 직원 상세 모달 끝 -->
	<hr />
	<div class="row">
		<div class="col-sm-12 col-md-7">
			<div class="dataTables_paginate paging_simple_numbers"
				id="example2_paginate">
				<ul class="pagination">
					<li
						class="paginate_button page-item previous 
						<c:if test="${articlePage.startPage lt 6}">disabled</c:if>
					"
						id="example2_previous"><a
						href="/employee/list?currentPage=${articlePage.startPage-5}"
						aria-controls="example2" data-dt-idx="0" tabindex="0"
						class="page-link">Previous</a></li>
					<c:forEach var="pNo" begin="${articlePage.startPage}"
						end="${articlePage.endPage}">
						<li
							class="paginate_button page-item 
						<c:if test="${pNo==param.currentPage}">active</c:if>
					"><a
							href="/employee/list?currentPage=${pNo}" aria-controls="example2"
							data-dt-idx="1" tabindex="0" class="page-link">${pNo}</a></li>
					</c:forEach>
					<li
						class="paginate_button page-item next
						<c:if test="${articlePage.endPage==articlePage.totalPages}">disabled</c:if>
					"
						id="example2_next"><a
						href="/employee/list?currentPage=${articlePage.startPage+5}"
						aria-controls="example2" data-dt-idx="7" tabindex="0"
						class="page-link">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>