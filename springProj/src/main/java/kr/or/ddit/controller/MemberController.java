package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.ComCodeMapper;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.vo.Address;
import kr.or.ddit.vo.Card;
import kr.or.ddit.vo.ComCodeVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;
@Slf4j
@Controller
public class MemberController {
	//DI(의존성 주입) / IoC (제어의 역전)
	@Autowired
	MemberService memberService;
	@Autowired
	ComCodeMapper comCodeMapper;
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
//	      log.info("userId : " + userId);
//	      log.info("password : " + password);
//	      log.info("gender : " + gender);
//	      log.info("nationality : " + nationality);
//	      log.info("cars : " + cars);
//	      log.info("developer : " + developer);
//	      log.info("foreigner : " + foreigner);
//	      log.info("address : " + address);
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
	      
	      //insert/update/delete는  Controller에서 안함 -> 서비스계층에서 비즈니스 로직(기능) 수행!
	      //I/U/D의 return 타입 : int
	      int result = this.memberService.registerUserId(member);
	      log.info("registerUserId : result : " +result );
	      return "success";
	   }
	   /*
	    8. 파일 업로드 폼 방식 요청 처리
	    파일 업로드 폼 파일 요소값을 스프링 MVC가 지원한 MultipartFile 매개변수로 처리함
	    */
	   @GetMapping("/registerForm")
	   public String registerForm() {
		   
		   //forwaring:/views/registerForm.jsp
		   return "registerForm";
	   }
	   /*
	    요청URI : /registerFile01
	    요청파라미터 : {picture=파일객체}
	   요청방식 : post
	           <p><input type="file" name="picture"/></p> => name 이랑 매개변수 같아야 한다!!
	    */
	   @ResponseBody
	   @PostMapping("/registerFile01")
	   public String registerFile01(MultipartFile picture) {
		   log.info("registerFile01");
		   //원본파일명
		   String fileName = picture.getOriginalFilename();
		   //파일크기
		   long size = picture.getSize();
		   //contentType => 이미지 인지 동영상인지 구분
		   String contentType = picture.getContentType();
		   
		   log.info("fileName:"+fileName);
		   log.info("size:"+size);
		   log.info("contentType:"+contentType);
		   
		   return "success";
	   }
	   /*
	      파일업로드 폼 파일 요소값과 텍스트 필드 요소값을 
    	MultipartFile 매개변수와 문자열 매개변수로 처리함
    	요청URI : /registerFile02
		요청파라미터 : {userId = a001,password=1234,picture=파일객체}
		요청방식 : post
	    */
	   @ResponseBody
	   @PostMapping("/registerFile02")
	   public String registerFile02(String userId, String password,
			   MultipartFile picture ) {
//		   log.info("registerFile02");
		   log.info("userId:"+userId);
		   log.info("password:"+password);
		   
		   //원본파일명
		   String fileName = picture.getOriginalFilename();
		   //파일크기
		   long size = picture.getSize();
		   //contentType => 이미지 인지 동영상인지 구분
		   String contentType = picture.getContentType();
		   
		   log.info("fileName:"+fileName);
		   log.info("size:"+size);
		   log.info("contentType:"+contentType);
		   
		   return "success";
	   }
	   /*
	      파일업로드 폼 파일 요소값과 텍스트 필드 요소값을 
	    MultipartFile 매개변수와 자바빈즈 매개변수로 처리
	    
	    요청URI : //registerFile03
	    요청파라미터 : {userId = a001,password=1234,picture=파일객체}
	    요청방식 : post
	    */
	   @ResponseBody
	   @PostMapping("/registerFile03")
	   public String registerFile03(MultipartFile picture,
			   MemberVO member) {
		   log.info("registerFile03");
		   log.info("userId :"+ member.getUserId());
		   log.info("password :"+ member.getPassword());
		   
		   //원본파일명
		   String fileName = picture.getOriginalFilename();
		   //파일크기
		   long size = picture.getSize();
		   //contentType => 이미지 인지 동영상인지 구분
		   String contentType = picture.getContentType();
		   
		   log.info("fileName:"+fileName);
		   log.info("size:"+size);
		   log.info("contentType:"+contentType);
		   
		   return "success";
	   }
	   /*
	    파일업로드 폼 파일 요소값과 텍스트 필드 요소값을
	    Member 타입의 자바빈즈 매개변수로 처리
	    */
	   @ResponseBody
	   @PostMapping("/registerFile04")
	   public String registerFile04(MemberVO member) {
		   log.info("registerFile03");
		   log.info("userId :"+ member.getUserId());
		   log.info("password :"+ member.getPassword());
		   
		   MultipartFile picture =member.getPicture();
		   
		   //원본파일명
		   String fileName = picture.getOriginalFilename();
		   //파일크기
		   long size = picture.getSize();
		   //contentType => 이미지 인지 동영상인지 구분
		   String contentType = picture.getContentType();
		   
		   log.info("fileName:"+fileName);
		   log.info("size:"+size);
		   log.info("contentType:"+contentType);
		   
		   return "success";
	   }
	   /*
	    여러 개의 파일업로드 폼 파일 요소값을 여러 개의 
	    MultipartFile 매개변수로 처리
	    
	    요청URI : /registerFile05
	   요청파라미터 : {picture=파일객체,picture2=파일객체}
	   요청방식 : post
	    */
	   @ResponseBody
	   @PostMapping("/registerFile05")
	   public String registerFile05(
			   MultipartFile picture,
			   MultipartFile picture2 ) {
		   log.info("registerFile05");
		 //원본파일명
		   String fileName = picture.getOriginalFilename();
		   //파일크기
		   long size = picture.getSize();
		   //contentType => 이미지 인지 동영상인지 구분
		   String contentType = picture.getContentType();
		   
		   log.info("fileName:"+fileName);
		   log.info("size:"+size);
		   log.info("contentType:"+contentType);
		   //------------------------------------------------------
		   //원본파일명
		    fileName = picture2.getOriginalFilename();
		   //파일크기
		    size = picture2.getSize();
		   //contentType => 이미지 인지 동영상인지 구분
		    contentType = picture2.getContentType();
		   
		   log.info("fileName:"+fileName);
		   log.info("size:"+size);
		   log.info("contentType:"+contentType);
		   return "success";
	   }
	   /*
	    파일업로드 폼 파일 요소값과 텍스트 필드 요소값을
	    Member 타입의 자바빈즈 배열 매개변수로 
	    처리
	    
	    요청URI : /registerFile08
	   요청파라미터 : {userId=a001,password=1234,pictures=파일객체들}
	   요청방식 : post
	    */
	   @ResponseBody
	   @PostMapping("/registerFile08")
	   public String registerFile08(MemberVO member) {
		   log.info("registerFile08");
		   
		   int result = this.memberService.registerFile08(member);
		   log.info("registerFile08->result:"+result);
		   
		   return "success";
	   }
	   
	   /*
	   요청URI : /register/hongkd
	   pathVariable : hongkd
	   요청방식 : get
	   동일한 클래스 내에서 같은 이름의 메소드를 사용 : 오버로딩
	   */
	   @ResponseBody
	   @GetMapping("/register2/{userId}")
	   public String register01(
			   @PathVariable("userId") String userId
			   ) {
		    log.info("userId:"+userId);
		    return"SUCCESS";
	   }
	   /*
	      요청URI : /register2/hongkd/pw01
	      pathVariable : hongkd, pw01
	      요청방식 : post
	      */
	   @ResponseBody
	   @PostMapping("/register2/{userId}/{password}")
	   public String register02(
			   @PathVariable("userId") String userId,
			   @PathVariable("password") String password
			   ) {
		   log.info("userId: " +userId);
		   log.info("password: " +password);
		   return "SUCCESS";
	   }
	   /*
	      요청URI : /register03
	      요청파라미터(JSON-> String) : {userId:a001,password:java}
	      요청방식 : post
	      */
	   @ResponseBody
	   @PostMapping("/register03")
	   public String register03(@RequestBody MemberVO member) {
		   log.info("userId:" +member.getUserId());
		   log.info("password:" +member.getPassword());
		   return "SUCCESS";
	   }
	   /*
	      요청URI : /register04
	      요청파라미터(JSON->String) : {userId:a001,password:java}
	      요청방식 : post
	      */
	   @ResponseBody
	   @PostMapping("/register04")
	   public String register04(String userId, String password) {
		   log.info("userId:"+ userId);
		   log.info("password:"+ password);
		   return "FAIDED";
		   
	   }
	   /*
	      요청URI : /register05
	      요청파라미터(JSON->String) : {userId:a001,password:java}
	      요청방식 : post
	    */
	   @ResponseBody
	   @PostMapping("/register05")
	   public String register05(String userId, String password) {
		   log.info("userId:"+ userId);
		   log.info("password:"+ password);
		   return "SUCCESS";
	   }
	   /*
	      요청URI : /register0501
	      요청파라미터(JSON->String) : {userId:a001,password:java}
	      요청방식 : post
	    */
	   @ResponseBody
	   @PostMapping("/register0501")
	   public String register0501(String userId, String password) {
		   log.info("userId:"+ userId);
		   log.info("password:"+ password);
		   return "SUCCESS";
	   }
	   /*
	      요청URI : /register06
	      요청파라미터(JSON->String) : {userId:a001,password:java}
	      요청방식 : post
	    */
	   @ResponseBody
	   @PostMapping("/register06/{userId}")
	   public String register06(@PathVariable("userId") String userId,
			   @RequestBody MemberVO member) {
		   log.info("userId:"+ userId);
		   log.info("Member userId:"+ member.getUserId());
		   log.info("Member password:"+ member.getPassword());
		   return "SUCCESS";
	   }
	   @ResponseBody
	   @PostMapping("/register07")
	   public String register07(
			 @RequestBody List<MemberVO> memberList
			   ) {
		   for(MemberVO member:memberList) {
			   log.info("userId:"+member.getUserId());
			   log.info("password:"+member.getPassword());
		   }
		   return "SUCCESS";
	   }
	   @ResponseBody
	   @PostMapping("/register08")
	   public String register08(
			   @RequestBody MemberVO member
			   ) {
		   log.info("member : "+member); //전체 확인
		   log.info("userId: "+member.getUserId());
		   log.info("password: "+member.getPassword());
		   Address address=member.getAddress();
		   if(address!=null) {
			   log.info("postCode: "+ address.getPostCode());
			   log.info("location: "+ address.getLocation());
		   }
		   List<Card> cardList=member.getCardList();
		   if(cardList !=null) {
			   for(Card card:cardList) {
				   log.info("no:"+card.getNo());
				   log.info("validMonth:"+card.getValidMonth());
			   }
		   }
		   
		   return "SUCCESS";
	   }
	   /*
	     		<form>
			<input type="file" name ="file"/>
		</form>
	    */
	   @ResponseBody
	   @PostMapping("/uploadAjax")
	   public Map<String, Object> uploadAjax(String userId, String password, MultipartFile file) {
		   String fileName=file.getOriginalFilename();
		   log.info("userId:"+ userId);
		   log.info("password:"+ password);
		   log.info("fileName:"+ fileName);
		   
		   Map<String , Object> map = new HashMap<String, Object>();
		   map.put("userId",userId);
		   map.put("password",password);
		   map.put("fileName",fileName);
		   
		   //ResponseBody -> map객체 -> json string으로 serialize 됨
		   return map;
	   }
	   
	   //요청URI : /read01
	   //Model 객체를 통해서 다양한 데이터를 뷰(View)에 전달
	   @GetMapping("/read01")
	   public String read01(Model model,@RequestParam String userId) {
		   log.info("read ->userId" +userId);
		   
		   //회원정보 및 회원의 카드 정보를 가져와 보자
		   //MEMBER : CARD = 1 : N member(회원)1명이기 때문에 List 안쓴다!!
		MemberVO member = this.memberService.read01(userId);
		log.info("read01->member : " + member);
//		model.addAttribute("userId","hongkd");오로로로로롤롤로로
//		model.addAttribute("password","1234");
//		model.addAttribute("email","aaaa@ccc.com");
//		model.addAttribute("userName","홍길동");
//		model.addAttribute("birthDay","1989-09-07");
		model.addAttribute("member",member);
		
		// /views/read01.jsp
		   
		   return "read01";
	   }
	   //요청URI : /read02
	 //Model 객체에 자바빈즈 클래스 객체를 값으로만 전달할 때는 뷰에서
	   //참조할 이름을 클래스명의 앞글자를 소문자로 변환하여 처리함
	   @GetMapping("/read02")
	   public String read02(Model model) {
		   MemberVO member = new MemberVO();
		   member.setUserId("hongkd");
		   member.setPassword("1234");
		   member.setUserName("홍길동");
		   member.setEmail("aaaa@ccc.com");
		   member.setBirthDay("1989-09-07");
		   
		   Calendar cal = Calendar.getInstance();
		   cal.set(1988,10,7);
		   
		   member.setDateOfBirth(cal.getTime());
		   
		   log.info("member: "+member);
		   
		   model.addAttribute("member",member);
		 //Model 객체에 자바빈즈 클래스 객체를 특정한 이름을
         // 지정하여 전달할 수 있음		   
		   model.addAttribute("user",member);
		   
		   // /views/read02.jsp
		   return "read02";
	   }
	   @GetMapping("/read04")
	   public String roead04(Model model) {
		   String[] carArray = {"saab","audi"};
		   
		   List<String> carList = 
				   new ArrayList<String>();
		   carList.add("saab");
		   carList.add("audi");
		   String[] hobbyArray  = {"Music","Movie"};
		   
		   List<String> hobbyList = new ArrayList<String>();
		   hobbyList.add("Music");
		   hobbyList.add("Movie");
		   
		   model.addAttribute("carArray",carArray);
		   model.addAttribute("carList",carList);
		   model.addAttribute("hobbyArray",hobbyArray);
		   model.addAttribute("hobbyList",hobbyList);
		   
		   // /views/read04.jsp 포워딩
		   return "read04";
	   }
	   
	   @GetMapping("/read05")
	   public String read05(Model model) {
		   MemberVO member = new MemberVO();
		   
		   		Address address = new Address();
		   		address.setPostCode("080908");
		   		address.setLocation("seoul");
		   member.setAddress(address);
		   
		   		List<Card> cardList = new ArrayList<Card>();
		   		
		   		Card card1 = new Card();
		   		card1.setNo("123456");
		   		Calendar cal1 = Calendar.getInstance();
		   		cal1.set(2024,5,3);
		   		card1.setValidMonth(cal1.getTime());
		   		cardList.add(card1);
		   		
		   		Card card2 = new Card();
		   		card2.setNo("1111");
		   		Calendar cal2 = Calendar.getInstance();
		   		cal2.set(2024,6,12);
		   		card2.setValidMonth(cal2.getTime());
		   		cardList.add(card2);
		   
		   member.setCardList(cardList);
		   
		   Calendar cal = Calendar.getInstance();
		   cal.set(2000,05,07);
		   
		   member.setDateOfBirth(cal.getTime());
		   
		   model.addAttribute("member",member);
		   
		   return "read05";
	   }
	   //스프링 폼
	   //2. 폼요소
	   //화면(뷰,jsp)에 전달할 데이터를 위한 모델을 매개변수로 지정함
	   @GetMapping("/registerForm01")
	   public String registerForm01(Model model) {
		   
		   //속성명에"member"를 지정하고 폼 객체(new Member())를 모델에 추가함
		   //<form:form modelAttribute="member"
		   model.addAttribute("member", new MemberVO());
		   // /views/registerForm.jsp 포워딩
		   return "registerForm01";
	   }
	   //스프링 폼
	   //2. 폼요소
	   //화면(뷰,jsp)에 전달할 데이터를 위한 모델을 매개변수로 지정함
	   @GetMapping("/registerForm02")
	   public String registerForm02(Model model) {
		   
		   //폼 객체의 속성명(member)과 스프링 폼 태그(<form콜론form>)의 
		   //modelAttribute 속성값이 일치하지 않으면
		      //      에러 발생
		   //<form:form modelAttribute="member"
		   model.addAttribute("user", new MemberVO());
		   // /views/registerForm.jsp 포워딩
		   return "registerForm01";
	   }
	   
	 //1)컨트롤러 메서드의 매개변수로 자바빈즈 객체가
	   //  전달이 되면 기본적으로 다시 화면으로 전달
	   //컨트롤러는 기본적으로 자바빈즈 규칙(필드, 기본생성자, getter/setter)
	   //에 맞는 객체는
	   //   다시 화면(뷰,jsp)으로 폼 객체를 전달함
	 //2) 폼 객체의 속성명은 직접 지정하지 않으면 폼 객체의
	   // 클래스명의 맨처음 문자를 소문자로 변환하여 처리함
	 //3) ModelAttribute 애너테이션으로 폼 객체의 속성명을
	   //   직접 지정할 수 있음
	   @GetMapping("/registerForm05")
	   //2)public String registerForm05(MemberVO user) {
	   public String registerForm05(@ModelAttribute("user") MemberVO member,
			   Model model) {
		   //폼 객체의 프로퍼티에 값 지정
		   member.setUserId("gadddongi");
		   member.setUserName("개똥이");
		   member.setCoin(1000);
		  member.setPassword("java");
		  member.setIntroduction("저는 개똥이 입니다.\n왜 일까요?");
		  
		  //모델에 Map 타입의 데이터를 생성하여 추가한 후 화면(jsp)전달
		  Map<String, String> hobbyMap = new HashMap<String, String>();
		  hobbyMap.put("Music","음악");
		  hobbyMap.put("ksy","FootBall");
		  hobbyMap.put("jmj","Book");
		  
		  member.setHobbyMap(hobbyMap);
		  
		  //Music을 미리 체크 처리
		  String[] hobbyArray= {"kmj"};
		  member.setHobbyArray(hobbyArray);
		  
		  //보유자동차
		  Map<String, String> carMap= new HashMap<String, String>();
		  carMap.put("qm5","qm5");
		  carMap.put("sm6","sm5");
		  carMap.put("volvo","volvo");
		  
		  member.setCarMap(carMap);
		  
		  //volov를 미리 체크 처리
		  String[] carArray= {"volvo"};
		  member.setCarArray(carArray);
		  
		  //성별
		  Map<String,String> genderCodeMap = 
				  new HashMap<String,String>();
		  genderCodeMap.put("Male","남성");
		  genderCodeMap.put("Female","여성");
		  genderCodeMap.put("etc","기타");
		  //미리 선택처리
		  member.setGenderCodeMap(genderCodeMap);
		  member.setGender("Female");
		  //11.셀렉트 박스요소
		  //국적선택
		  Map<String,String> notionalityCodeMap=
				  new HashMap<String, String>();
		  notionalityCodeMap.put("Korea","대한민국");
		  notionalityCodeMap.put("Germany","독일");
		  notionalityCodeMap.put("Australia","오스트레일리아");
		  notionalityCodeMap.put("Canada","캐나다");
		  
		  member.setNationalityCodeMap(notionalityCodeMap);
		  
		  String[] strArr = {"Korea","Germany","Australia","Canada"};
		  model.addAttribute("strArr", strArr);
		  
		  //국저 미리 선택
		  member.setNationality("Korea");
		  
		  // 국적을 공통코드로부터 가져와보자
		  ComCodeVO comCodeVO = this.comCodeMapper.getComCode("natn");
		  log.info("registerForm05-> comCodeVO: "+ comCodeVO);
		  
		  model.addAttribute("comCodeVO", comCodeVO);
		  //forwarding
		   return "registerForm05";
	   }

	   /*
	    입력값 검증을 하기 위해서는 메서드 매개변수에 도메인 클래스를 정의하고 골뱅이Validated를 지정
	    입력값 검증 대상의 도메인 클래스 직후에 BindingResult를 정의함
	    BindingResult에는 요청 데이터의 바인딩 오류와 입력값 검증 오류 정보가 저장됨
	    */
	   @PostMapping("/registerForm01Post")
	   public String registerForm01Post(@Validated @ModelAttribute("user")MemberVO member
			   ,BindingResult brResult
			   ,Model model) {
		   log.info("registerForm01Post member: "+ member);
		   //1)true : 문제발생, 2) false : 문제없음
		   log.info("brResult.hasErrors():"+brResult.hasErrors());
		   /*----*/
		   /* 2. 입력값 검증 결과
		         입력값 검증 대상의 도메인 클래스 직후에 BindingResult를 정의함
		    BindingResult에 요청 데이터의 바인딩 에러와 입력값 검증 에러 정보가 저장됨
		    */
		   //검증 오류 발생 시
		   if(brResult.hasErrors()) {//true : 오류 발생함
			   //검사 결과 오류 확인
			   List<ObjectError> allErrors=brResult.getAllErrors();
			   //객체와 관련된 오류(클래스)
			   List<ObjectError> globalErrors 
			   		= brResult.getGlobalErrors();
			   //멤버변수와 관련된 오류
			   List<FieldError> fieldErrors 
			   = brResult.getFieldErrors();
			   
			  for(ObjectError objectError:allErrors) {
				  log.info("allError: "+objectError);
			  }
			  for(ObjectError objectError:globalErrors) {
				  log.info("objectError: "+objectError);
			  }
			  for(FieldError fieldError:fieldErrors) {
				  log.info("fieldError: "+fieldError);
			  }
			  /*----*/
		      //폼 객체의 프로퍼티에 값을 지정
		      
		      member.setCoin(1000);
		      member.setPassword("java");
		      member.setIntroduction("저는 개똥이 입니다.\n왜일까요?");
		      
		      //모델에 Map 타입의 데이터를 생성하여 추가한 후에 화면(jsp)에 전달
		      Map<String,String> hobbyMap = 
		            new HashMap<String, String>();
		      hobbyMap.put("Music", "음악");
		      hobbyMap.put("FootBall", "축구");
		      hobbyMap.put("Book", "도서");
		      hobbyMap.put("Travel", "여행");
		      
		      member.setHobbyMap(hobbyMap);
		      
		      //Music을 미리 체크 처리
		      String[] hobbyArray = {"kmj"};
		      member.setHobbyArray(hobbyArray);
		      
		      member.setHobby("kmj");
		      
		      //보유자동차
		      Map<String,String> carMap = 
		            new HashMap<String, String>();      
		      carMap.put("qm5", "qm5");
		      carMap.put("sm6", "sm6");
		      carMap.put("volvo", "volvo");
		      
		      member.setCarMap(carMap);
		      
		      //volvo를 미리 체크 처리
		      String[] carArray = {"volvo"};
		      member.setCarArray(carArray);
		      
		      //성별
		      Map<String,String> genderCodeMap = 
		            new HashMap<String, String>();
		      genderCodeMap.put("Male", "남성");
		      genderCodeMap.put("Female", "여성");
		      genderCodeMap.put("etc", "기타");
		      
		      member.setGenderCodeMap(genderCodeMap);
		      
		      //미리 선택 처리
		      member.setGender("Female");
		      
		      //11. 셀렉트 박스 요소
		      //국적 선택
		      Map<String,String> notionalityCodeMap = 
		            new HashMap<String, String>();
		      notionalityCodeMap.put("Korea", "대한민국");
		      notionalityCodeMap.put("Germany", "독일");
		      notionalityCodeMap.put("Australia", "오스트레일리아");
		      notionalityCodeMap.put("Canada", "캐나다");
		      
		      member.setNationalityCodeMap(notionalityCodeMap);
		      //국적 미리 선택
		      member.setNationality("Korea");
		      
		      //국적을 공통코드로부터 가져와보자
		      ComCodeVO comCodeVO = this.comCodeMapper.getComCode("natn");
		      log.info("registerForm05->comCodeVO : " + comCodeVO);
		      
		      model.addAttribute("comCodeVO", comCodeVO);
		      /*----*/
			  return "registerForm05";
		   }
		      //폼 객체의 프로퍼티에 값을 지정
		      
		      member.setCoin(1000);
		      member.setPassword("java");
		      member.setIntroduction("저는 개똥이 입니다.\n왜일까요?");
		      
		      //모델에 Map 타입의 데이터를 생성하여 추가한 후에 화면(jsp)에 전달
		      Map<String,String> hobbyMap = 
		            new HashMap<String, String>();
		      hobbyMap.put("Music", "음악");
		      hobbyMap.put("FootBall", "축구");
		      hobbyMap.put("Book", "도서");
		      hobbyMap.put("Travel", "여행");
		      
		      member.setHobbyMap(hobbyMap);
		      
		      //Music을 미리 체크 처리
		      String[] hobbyArray = {"kmj"};
		      member.setHobbyArray(hobbyArray);
		      
		      member.setHobby("kmj");
		      
		      //보유자동차
		      Map<String,String> carMap = 
		            new HashMap<String, String>();      
		      carMap.put("qm5", "qm5");
		      carMap.put("sm6", "sm6");
		      carMap.put("volvo", "volvo");
		      
		      member.setCarMap(carMap);
		      
		      //volvo를 미리 체크 처리
		      String[] carArray = {"volvo"};
		      member.setCarArray(carArray);
		      
		      //성별
		      Map<String,String> genderCodeMap = 
		            new HashMap<String, String>();
		      genderCodeMap.put("Male", "남성");
		      genderCodeMap.put("Female", "여성");
		      genderCodeMap.put("etc", "기타");
		      
		      member.setGenderCodeMap(genderCodeMap);
		      
		      //미리 선택 처리
		      member.setGender("Female");
		      
		      //11. 셀렉트 박스 요소
		      //국적 선택
		      Map<String,String> notionalityCodeMap = 
		            new HashMap<String, String>();
		      notionalityCodeMap.put("Korea", "대한민국");
		      notionalityCodeMap.put("Germany", "독일");
		      notionalityCodeMap.put("Australia", "오스트레일리아");
		      notionalityCodeMap.put("Canada", "캐나다");
		      
		      member.setNationalityCodeMap(notionalityCodeMap);
		      //국적 미리 선택
		      member.setNationality("Korea");
		      
		      //국적을 공통코드로부터 가져와보자
		      ComCodeVO comCodeVO = this.comCodeMapper.getComCode("natn");
		      log.info("registerForm05->comCodeVO : " + comCodeVO);
		      
		      model.addAttribute("comCodeVO", comCodeVO);
		      /*----*/
		   return "registerForm05";
	   }
	   
}
