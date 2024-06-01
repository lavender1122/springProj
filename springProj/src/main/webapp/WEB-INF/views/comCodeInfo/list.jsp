<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>공통 코드</h3>
<div class="row">
    <div class="col-md-6">
       <form action="/comCodeInfo/createPost" method="post">
           <div class="card card-primary">
               <div class="card-header">
                   <h3 class="card-title">공통 코드</h3>
               </div>
               <div class="card-body">
               			<!-- //공통 코드 목록 시작  -->
           			<table class="table table-bordered">
           				<thead>
           					<tr>
           						<th>공통 코드</th>
           						<th>공통 코드 명</th>
           					</tr>
           				</thead>
           				<tbody>
           				<c:forEach var="ComCodeInfoVO" items="${ComCodeInfoVOList}"
           					 varStatus="stat">
							<tr>
								<td>${ComCodeInfoVO.comCode}</td>
								<td>${ComCodeInfoVO.comCodeNm}</td>
							</tr>
							</c:forEach>           				
           				</tbody>
           			</table>
               		<!-- //공통 코드 목록 끝  -->
               </div>
               <div class="card-footer">
               <!-- 페이징 처리 -->
               </div>
           </div>
           <sec:csrfInput/>
        </form>
    </div>
    <div class="col-md-6">
        <div class="card card-info">
            <div class="card-header">
                <h3 class="card-title">공통 상세 코드</h3>
            </div>
            <div class="card-body">
                 <!-- //공통 상세 코드 목록 시작  -->
           			<table class="table table-bordered">
           				<thead>
           					<tr>
           						<th>공통 상세 코드</th>
           						<th>공통 상세 코드 명</th>
           						<th>공통 코드 </th>
           					</tr>
           				</thead>
           				<tbody>
           				<c:forEach var="ComDetCodeInfoVO" items="${ComDetCodeInfoVOList}"
           					 varStatus="stat">
							<tr>
								<td>${ComDetCodeInfoVO.comDetCode}</td>
								<td>${ComDetCodeInfoVO.comDetCodeNm}</td>
								<td>${ComDetCodeInfoVO.comCode}</td>
							</tr> 
							</c:forEach>           				
           				</tbody>
           			</table>
               		<!-- //공통 코드 목록 끝  -->
            <div class="card-footer">
            </div>
        </div>
    </div>
</div>