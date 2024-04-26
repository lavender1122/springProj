<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
   <div class="col-12">
      <div class="card">
         <div class="card-header">
<!--             <h3 class="card-title">Responsive Hover Table</h3> -->
            <div class="card-tools">
               <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search keyword"
                     class="form-control float-right" placeholder="Search">
                  <div class="input-group-append">
                     <button type="button" class="btn btn-default">
                        <i class="fas fa-search"></i>
                     </button>
                  </div>
               </div>
            </div>
         </div>
<!-- <p> -->
<%-- ${ContUsVOList} --%>
<!-- </p> -->
         <div class="card-body table-responsive p-0">
            <table class="table table-hover text-nowrap">
               <thead>
                  <tr>
                     <th>cuCode</th>
                     <th>Name</th>
                     <th>E-Mail</th>
                     <th>Subject</th>
                     <th>Message</th>
                  </tr>
               </thead>
               <tbody>
               <c:forEach var="contUsVO" items="${ContUsVOList}" varStatus="stat">
                  <tr>
                     <td>${contUsVO.cuCode}</td>
                     <td>${contUsVO.name}</td>
                     <td>${contUsVO.email}</td>
                     <td>${contUsVO.subject}</td>
                     <td><span class="tag tag-success">${contUsVO.message}</span></td>
                  </tr>
				</c:forEach>
               </tbody>
            </table>
         </div>

      </div>

   </div>
</div>