package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.vo.Address;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;
@Slf4j
@Controller
public class MemberController {
	/*
	 URL 경로 상의 쿼리 파라미터 정보로 부터 요청 데이터 취득
	 
	 요청URI : /register?userId=hongkd&password=1234
	 요청파라미터(쿼리스트링) : userId=hongkd&password=1234
	 요청방식 : get
	 
	 스프링프레임워크에서는 파라미터를 매개변수로 받을 수 있음
	 */
	@ResponseBody
	@GetMapping("/register")
	public String registerByParameter(String userId,String password) {
		log.info("registerByParameter");
		
		log.info("userId:"+userId);//hongkd
		log.info("password:"+password);//1234
		//@ResponseBody 없으면 /views/success.jsp
		//@ResponseBody 있으면 "success" 데이터 응답
		return"success";
	}
	//URL 경로 상의 경로(path) 쿼리 파라미터 정보로부터 요청 데이터를 취득
	/*
	 요청URI:/register/hongkd
	 경로변수 :hongkd
	 요청방식 : get 
	 */
	@ResponseBody
	@GetMapping("/register/{userId}")
	public String  registerByPath(@PathVariable(value="userId") String userId) {
		log.info("registerByPath");
		
		log.info("userId:"+userId);
		
		return "success";
	}
	/*
	요청URI : /register01
	요청파라미터 : {userId=hongkd,password=1234,coin=100}
	요청방식 : post
	
	HTML 폼 필드명과 컨트롤로 매개변수명이 일치하면
      요청 데이터를 취득
    HTML 폼 필드값이 숫자일 경우 컨트롤러 매개변수 타입이 문자열이면 그대로 문자열 형태로 요청데이터 취득
     => 파라미터 모든 데이터 타입은 String 이다  그래서 숫자 -> String 으로 변환한다
    반면, 매개변수 타입이 숫자형이면 숫자로 타입변환됨
    
    //폼 텍스트 필드 요소 값을 자바빈즈 매개변수로 처리 가능
	 */
	@ResponseBody
	@PostMapping("/register01")
	public String register01(@RequestParam("userId")String  id
			, @RequestParam("password") String pwd
			,int coin
			,@DateTimeFormat(pattern="yyyy-MM-dd") Date regDate
			,MemberVO member) {
		log.info("id:"+id);
		log.info("pwd:"+pwd);
		log.info("coin:"+coin);
		log.info("regDate:"+regDate);
		log.info("member:"+member);
		
		return "success";
	}
	
	/*
	 URL 경로 상의 경로 변수가 여러 개일 때 PathVariable 애너테이션을
        사용하여 특정한 경로 변수명을 지정
        
        요청URI : /register/hongkd/100
        경로변수 : hongkd, 100
        요청방식 : get
	 */
	@ResponseBody
	@GetMapping("/register/{userId}/{coin}")
	public String registerByPath2(
			@PathVariable("userId") String userId, 
			@PathVariable("coin") int coin
			) {
		log.info("userId:"+userId);
		log.info("coin:"+coin);
		
		return "success";
	}
	/* 5. Date 타입 처리
    스프링 MVC는 Date 타입의 데이터를 처리하는 여러 방법을 제공.
    따로 지정하지 않으면 변환에 적합한 문자열 형식은 yyyy/MM/dd
    */
	/*
	   쿼리 파라미터(dateOfBirth=2018-09-08)로 전달받은 값이
	   날짜 문자열 형식에 맞지 않아 Date 타입으로 변환 실패
	   =>@DateTimeFormat(pattern="yyyy-MM-dd") 안 넣어서 인식이 안됨 그래서 에러
	요청URI : /registerByGet01?userId=hongkd&dateOfBirth=2018-09-08
			   요청파라미터 : userId=hongkd&dateOfBirth=2018-09-08
			   요청방식 : get
	 */
	@ResponseBody
	@GetMapping("/registerByGet0102")
	public String reregisterByGet0102(String userId,
			Date dateOfBirth) {
		log.info("userId:"+userId);
		log.info("dateOfBirth:"+dateOfBirth);
		
		return "success";
	}
	/*
	   쿼리 파라미터(dateOfBirth=20180908)로 전달받은 값이
	   날짜 문자열 형식에 맞지 않아 Date 타입으로 변환 실패 
	  => @DateTimeFormat(pattern="yyyy-MM-dd") 안 넣어서 인식이 안됨 그래서 에러
	요청URI : /registerByGet01?userId=hongkd&dateOfBirth=20180908
			   요청파라미터 : userId=hongkd&dateOfBirth=20180908
			   요청방식 : get
	 */
	@ResponseBody
	@GetMapping("/registerByGet0103")
	public String reregisterByGet0103(String userId,
			Date dateOfBirth) {
		log.info("userId:"+userId);
		log.info("dateOfBirth:"+dateOfBirth);
		
		return "success";
	}
	/*
	   쿼리 파라미터(dateOfBirth=2018/09/08)로 전달받은 값이
	   날짜 문자열 형식에 맞지 않아 Date 타입으로 변환 성공
	   => 따로 지정하니 않으면 기본값 yyyy/MM/dd 이다
	      결론)
   		따로 지정하지 않으면 변환에 적합한 날짜 문자열 형식은
   		yyyy/MM/dd이다.
	요청URI : /registerByGet0104?userId=hongkd&dateOfBirth=2018/09/08
			   요청파라미터 : userId=hongkd&dateOfBirth=2018/09/08
			   요청방식 : get
	 */
	@ResponseBody
	@GetMapping("/registerByGet0104")
	public String reregisterByGet0104(String userId,
			Date dateOfBirth) {
		log.info("userId:"+userId);
		log.info("dateOfBirth:"+dateOfBirth);
		
		return "success";
	}
	/* 6. DateTimeFormat 애너테이션
    	DateTimeFormat 애너테이션의 pattern 속성값에 
    	원하는 날짜 형식을 지정할 수 있음    
    */
	/*
	   요청URI : /registerByGet0105?userId=hongkd&dateOfBirth=1225
	   요청파라미터 : userId=hongkd&dateOfBirth=1225
	   요청방식 : get
	    */
	   @ResponseBody
	   @GetMapping("/registerByGet0105")
	   public String registerByGet0105(String userId,
	         @DateTimeFormat(pattern = "MMdd") Date dateOfBirth) {
	      
	      log.info("userId : " + userId);
	      log.info("dateOfBirth : " + dateOfBirth);
	      
	      return "success";
	   }
	   /*
	   요청URI : /registerByGet0106?userId=hongkd&dateOfBirth=2024-05-01
	   요청파라미터 : userId=hongkd&dateOfBirth=2024-05-01
	   요청방식 : get
	    */
	   @ResponseBody
	   @GetMapping("/registerByGet0106")
	   public String registerByGet0106(String userId,
	         @DateTimeFormat(pattern="yyyy-MM-dd") Date dateOfBirth) {
	      
	      log.info("userId : " + userId);
	      log.info("dateOfBirth : " + dateOfBirth);
	      
	      return "success";
	   }
	   /*
	   요청URI : /registerByGet0107?userId=hongkd&dateOfBirth=20240501
	   요청파라미터 : userId=hongkd&dateOfBirth=20240501
	   요청방식 : get
	    */
	   @ResponseBody
	   @GetMapping("/registerByGet0107")
	   public String registerByGet0107(String userId,
	         @DateTimeFormat(pattern="yyyyMMdd") Date dateOfBirth) {
	      
	      log.info("userId : " + userId);
	      log.info("dateOfBirth : " + dateOfBirth);
	      
	      return "success";
	   }
	   /*
	     1)폼 덱스트필드 요소값을 기본 데이터 타입인 문자열 타입 매개변수로 처리함
	   	 2) 폼 텍스트 필드 요소값을 자바빈즈 매개변수 처리
	   	 3) 폼 비밀번호 필드 요소값을 자바빈즈 매개변수로 처리
	    
	   요청URI: /registerUserId
	   요청파라미터:{userId=honggd}
	  요청방식 :post
	  결론  String[] 으로 받아라!
	    */
	   @ResponseBody
	   @PostMapping("/registerUserId")
	   public String registerUserId(String userId,
	            String password, String gender,
	            String nationality, String cars,
	            String[] carArray, 
	            ArrayList<String> carList,
	            String hobby,
	            String[] hobbyArray,
	            ArrayList<String> hobbyList,
	            String developer,
	            boolean foreigner,
	            Address address,
	            MemberVO member
	            ) { 
	      log.info("userId : " + userId);
	      log.info("password : " + password);
	      log.info("gender : " + gender);
	      log.info("nationality : " + nationality);
	      log.info("cars : " + cars);
	      log.info("developer : " + developer);
	      log.info("foreigner : " + foreigner);
	      log.info("address : " + address);
	      log.info("member : " + member);
	      
	      if(carArray!=null) {
	         log.info("------carArray------");
	         for(String car : carArray) {
	            log.info(car);
	         }
	         log.info("------------");
	      }
	      
	      // carList.size() : 0
	      if(carList!=null) {
	         log.info("------carList------");
	         for (int i=0;i<carList.size();i++) {
	            log.info(carList.get(i));
	         }
	         log.info("------------");
	      }
	      
	      
	      log.info("hobby : " + hobby);
	      
	      if(hobbyArray!=null) {
	         log.info("------hobbyArray------");
	         for(String hob : hobbyArray) {
	            log.info(hob);
	         }
	         log.info("------------");
	      }
	      
	      // hobbyList.size() : 0
	      if(hobbyList!=null) {
	         log.info("------hobbyList------");
	         for (int i=0;i<hobbyList.size();i++) {
	            log.info(hobbyList.get(i));
	         }
	         log.info("------------");
	      }
	      return "success";
	   }
}
