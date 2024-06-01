package kr.or.ddit.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.jaas.AuthorityGranter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;

/*   /notice/register -> loginForm -> 로그인 -> CustomLoginSuccessHandler(성공)
-> 사용자 작업.. -> /notice/register 로 리다이렉트 해줌
(스프링 시큐리티에서 기본적으로 사용되는 구현 클래스) 
*/

@Slf4j
public class CustomLoginSuccessHandler extends
   SavedRequestAwareAuthenticationSuccessHandler{
   
   //부모 클래스의 메소드를 재정의
      @Override
      public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication auth) throws ServletException, IOException {
         
         log.info("onAuthenticationSuccess");
         
         //auth.getPrincipal() : 사용자 정보를 가져옴
         //시큐리티에서 사용자 정보는 User 클래스의 객체로 저장됨(CustomUser.java를 참고)
         User costomUser = (User)auth.getPrincipal(); 
         
         //사용자 아이디를 리턴
         log.info("username : " + costomUser.getUsername());
         
         //auth.getAuthorities() -> 권한들(ROLE_MEMBER,ROLE_ADMIN)
         //authority.getAuthority() : ROLE_MEMBER
         List<String> roleNames = new ArrayList<String>();
         auth.getAuthorities().forEach(authority->{
            roleNames.add(authority.getAuthority());
         });
         
         log.info("roleNames : " + roleNames);
         
         
         //부모에게 줌
         //가던길 쭉 
         super.onAuthenticationSuccess(request, response, auth);
      }
} 