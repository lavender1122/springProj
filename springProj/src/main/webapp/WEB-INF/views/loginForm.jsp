<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="login-box" style="margin:0 auto;">
   <div class="card">
      <div class="card-body login-card-body">
         <p class="login-box-msg">Sign in to start your session</p>
         <form action="/login" method="post">
            <div class="input-group mb-3">
            	<!-- 아이디 -->
               <input type="text" name="username" id="username" class="form-control" placeholder="아이디">
               <div class="input-group-append">
                  <div class="input-group-text">
                     <span class="fas fa-envelope"></span>
                  </div>
               </div>
            </div>
            <div class="input-group mb-3">
               <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호"/>
               <div class="input-group-append">
                  <div class="input-group-text">
                     <span class="fas fa-lock"></span>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-8">
                  <div class="icheck-primary">
                  <!-- 로그인 상태 유지 체크박스.
                        체크 시 : PERSISTENT_LOGINS 테이블에 로그인 로그 정보가 insert 됨
                      -->
                     <input type="checkbox" name="remember-me" id="remember"> <label
                        for="remember"> 자동 로그인 </label>
                  </div>
               </div>
               <div class="col-4">
                  <button type="submit" class="btn btn-primary btn-block">Sign In</button>
               </div>
            </div>
            <!-- csrf: Cross Site Request Forgery -->
            <sec:csrfInput/>
         </form>
      </div>
   </div>
</div>