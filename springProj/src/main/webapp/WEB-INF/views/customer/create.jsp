<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" 
   rel="stylesheet">
<title></title>
</head>
<body>
   <div class="content-wrapper" style="min-height: 2646.44px;">

      <section class="content-header">
         <div class="container-fluid">
            <div class="row mb-2">
               <div class="col-sm-6">
                  <h1>Contact us</h1>
               </div>
               <div class="col-sm-6">
                  <ol class="breadcrumb float-sm-right">
                     <li class="breadcrumb-item"><a href="#">Home</a></li>
                     <li class="breadcrumb-item active">Contact us</li>
                  </ol>
               </div>
            </div>
         </div>
      </section>

      <section class="content">
         <form id="frm" action="/customer/create" method="post">
            <div class="card">
               <div class="card-body row">
                  <div
                     class="col-5 text-center d-flex align-items-center justify-content-center">
                     <div class="">
                        <h2>
                           Admin<strong>LTE</strong>
                        </h2>
                        <p class="lead mb-5">
                           123 Testing Ave, Testtown, 9876 NA<br> Phone: +1 234
                           56789012
                        </p>
                     </div>
                  </div>
                  <div class="col-7">
                     <div class="form-group">
                        <label for="inputName">번호</label>
                        <input type="text" name="cstNo"
                           id="inputName" class="form-control">
                     </div>
                     <div class="form-group">
                        <label for="inputEmail">직원이름</label>
                        <input type="email" name="cstName"
                           id="inputEmail" class="form-control">
                     </div>
                     <div class="form-group">
                        <label for="inputSubject">주소</label>
                        <input type="text" name="cstAddress"
                           id="inputSubject" class="form-control">
                     </div>
                     <div class="form-group">
                        <label for="inputMessage">전화번호</label>
                        <textarea id="inputMessage" name="cstTelno" class="form-control" rows="4"></textarea>
                     </div>
                     <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="등록">
                     </div>
                  </div>
               </div>
            </div>
         </form>
      </section>

   </div>
</body>
</html>