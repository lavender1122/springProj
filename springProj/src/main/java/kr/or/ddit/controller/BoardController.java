package kr.or.ddit.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.access.prepost.PreAuthorize;


//클래스 레벨 요청 경로 지정 
@RequestMapping(value="/board")
@Slf4j
@Controller
public class BoardController {

      /*
          1. 요청 경로 매핑

         - 요청 경로는 반드시 설정해야 하는 필수 정보이다.
         - 속성이 하나일 때는 속성명을 생략할 수 있다.
         - 컨트롤러의 클래스 레벨과 메서드 메벨로 지정할 수 있다.
         - 클레스 레벨로 요청 경로를 지정하면 메서드 레벨에서 지정한 경로의 기본 경로로 취급된다.
         - 클래스 레벨의 요청 경로에 메서드 레벨의 요청 경로를 덧붙인 형태가 최종 경로가 된다.
       */
      
      /*
       요청 URI : /board/register
       요청 파라미터:
       요청방식 : get
       */
	  @PreAuthorize("hasRole('ROLE_MEMBER')")
      @RequestMapping(value="/register",method=RequestMethod.GET)
      public String registerForm() {
         log.info("registerForm에 왔다");
         //ModelAndView가 없음
         //mav.setViewName("board//register") 생략
         
         //forwarding : jsp
         return "board/register";
      }
      
      /* 
      요청URI : /board/register
      요청파라미터 : 
      요청방식 : post
       */
      @RequestMapping(value="/register",method=RequestMethod.POST)
      public String registerPost() {
         log.info("registerPost에 왔다");
         
         //forwarding : /views/success.jsp 
         return "success";
      }
      
      /*
       속성이 하나일 때는 속성명을 생략할 수 있다.
       요청 URI : /baord/modify
       요청 파라미터:
       요청방식 : get
       */
      @RequestMapping(value= "/modify", method = RequestMethod.GET)
      public String modifyForm() {
         log.info("modifyForm에 왔다");
         
         //생략 시 (void) /views/board/modify.jsp를 forwarding
         //또는 
         return "success";   // /views/board/modify.jsp를 forwarding 
      }   
      
      
      @RequestMapping(value="/modify",method=RequestMethod.POST)
      public String modifyPost() {
         log.info("modifyPost에 왔다");
         return "success";
         // /views/board/modify.jsp를 forwarding 
      }   
      
      /*
       2. 경로 패턴 매핑
         요청 경로를 동적으로 표현이 가능한 경로 패턴을 지정할 수 있다.
        - URL 경로 상의 변하는 값을 경로 변수로 취급한다.
        - 경로 변수에 해당하는 값을 파라미터 변수에 설정할 수 있다.
       */
      /*
          요청URI : /board/read/100
          경로변수 : 100
          요청방식 : get
       */
      @RequestMapping("/read/{boardNo}")
      public String read(@PathVariable("boardNo")int boardNo) {
         log.info("read->boardNo : " + boardNo);
         
         //mav.setViewName("board/read")
         //forwarding
         return "board/read";
      }
      
      /*
          요청URI : /board/read/
          경로변수 : 
          요청방식 : get
       */
      @RequestMapping("/read")
      public String getRead() {
         log.info("getRead에 왔다");
         
         //forwarding
         return "read";
      }
      
      /*
             요청URI : /board/modify/100
          경로변수 : 100
             요청방식 : get
       */
      @RequestMapping("/modify/{boardNo}")      
      public String modify(@PathVariable("boardNo")int boardNo) {
         log.info("modify->boardNo : " + boardNo);
         
         return "board/modify";
      }

      /*
          요청URI : /board/formHome
          파라미터 : 
                요청방식 : get
       */
      @RequestMapping("/formHome")
      public String formHome() {
         log.info("formHome에 왔다");
         
         //forwarding : /views/formHome.jsp
         return "formHome";
         
      }
      /*
       4. Params 매핑
      요청 파라미터를 매핑 조건으로 지정하는 경우에는 params 속성을 사용함
      버튼이나 링크에 따라 호출할 메서드를 바꿔야 할 때 사용함
       */
      /*
       요청 URI : /board/list
       요청파라미터 : 
       요청방식 : GET
       */
      @RequestMapping("/list")
      public String list() {
         log.info("list에 왔다");
         
         //forwarding : /views/board/list.jsp
         return "board/list";
      }
      
      /*Params 매핑
      요청URI : /board/get?register
      params : register
      요청방식 : get
      */
      @RequestMapping(value= "/get",
            method=RequestMethod.GET,
            params="register")
      public String getRegister() {
         log.info("GetRegister에 왔다");
         
         //forwarding
         return "board/register";
      }
      
      /*Params 매핑
      요청URI : /board/get?modify
      params : modify
      요청방식 : get
      */
      @RequestMapping(value= "/get",
            method=RequestMethod.GET,
            params="modify")
      public String getModify() {
         log.info("getModify에 왔다");
         
         //forwarding
         return "board/modify";
      }
      
      /* 
      요청URI : /board/post?register
      params : register
      요청방식 : post
      */
      @RequestMapping(value="/post"
            , method=RequestMethod.POST
            , params="register")
      public String postRegister() {
         log.info("postRegister에 왔디");
         //forwarding : /views/board/list.jsp
         return "board/list";
      }
      
      
      /* 
      요청URI : /board/post?modify
      params : modify
      요청방식 : post
      */ 
      
      @RequestMapping(value="/post"
            , method=RequestMethod.POST
            , params="modify")
      public String postModify() {
         log.info("postModify에 왔디");
         //forwarding : /views/board/list.jsp
         return "board/list";
      }
      /* 
      요청URI : /board/post?list
      params : list
      요청방식 : post
       */ 
      
      @RequestMapping(value="/post"
    		  , method=RequestMethod.POST
    		  , params="list")
      public String postList() {
    	  log.info("postList에 왔디");
    	  //forwarding : /views/board/list.jsp
    	  return "board/list";
      }
      /* 
      요청URI : /board/post?remove
      params : remove
      요청방식 : post
       */ 
      
      @RequestMapping(value="/post"
    		  , method=RequestMethod.POST
    		  , params="remove")
      public String postRemove() {
    	  log.info("postRemove에 왔디");
    	  //forwarding : /views/board/list.jsp
    	  return "board/list";
      }
      
      /*
              요청URI : /board/ajaxHome
    	요청파라미터 : 
    	요청방식 : get
       */
      @RequestMapping(value="/ajaxHome")
      public String ajaxHome() {
    	  log.info("ajaxHome에 왔다");
    	  //forwarding : /views/ajaxHmoe.jsp
    	  return"ajaxHome";
    	  
      }
      /*
      요청URI : /board/12
      요청파라미터 :(json타입의 텍스트): {boardNo=12,title=개똥이,content=개똥이짱,writer=김개똥}
      			json 타입 쓸려면 @RequestBody 써야함!
      요청방식 : put
      */
      @RequestMapping(value="/{boardNo}"
    		         , method =RequestMethod.PUT
    		         , headers = "X-HTTP-Method-Override"
    		         , consumes = "application/json")
      public ResponseEntity<String> ajaxModify(@PathVariable("boardNo") int boardNo,
    		  @RequestBody BoardVO boardVO) {
    	  log.info("agaxModify에 왔다");
    	  log.info("ajaxModify-> boardVO:"+boardVO);
    	  
    	  ResponseEntity<String> entity = 
    			  new ResponseEntity<String>("SUCCESS",
    					  HttpStatus.OK);
    	  return entity;
      }
      
}