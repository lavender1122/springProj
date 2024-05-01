package kr.or.ddit;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
@RequestMapping("/") //상위 분류 localhost 오는 url
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@GetMapping("/")//하위 분류
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		//request.setAttribute("serverTime",formattedDate); 비슷
		model.addAttribute("serverTime", formattedDate ); //현재시간 들어 있음
		
		// /WEB-INF/views/+home+.jsp
		return "home";
	}
	//GetMapping : method=RequestMethod.GET
	//속성이 하나인 경우 속성명을 생략할 수 있음
	//void타입 : 호출하는 URL과 동일한 뷰 이름을 나타냄 => mav.setViewName("goHome0101")
	@GetMapping("/goHome0101")
	public void home0101() {
		log.info("home0101");
		
		//return "goHome0101"=> /views/goHome0101.jsp
	}
	@GetMapping("/sub/goHome0102")
	public void home0102() {
		log.info("home0102");
		
		// /views/sub/goHome0102.jsp => 생략함
	}
	
	//2.String타입
	//뷰 파일의 경로와 파일이름 나타냄
	@GetMapping("/goHome0201")
	public String home0201() {
		log.info("home0201");
		// /views/home0201.jsp
		return "home0201";
	}
	
	@GetMapping("/sub/goHome0202")
	public String home0202() {
		log.info("home0202");
		
		//forwarding :jsp
		// /views/home0202.jsp
		return "home0202";
	}
	
	@GetMapping("/sub/goHome0203")
	public String home0203() {
		log.info("home0202");
		
		//forwarding :jsp
		// /views/home0202.jsp
		return "sub/home0203";
	}
	
	//반환값이 "redirect:"로 시작하면
	//리다이렉트 방식으로 처리함
	@GetMapping("/goHome0204")
	public String home0204() {
		log.info("home0204");
		
		return"redirect:/sub/goHome0205";
	}
	@GetMapping("/sub/goHome0205")
	public String home0205() {
		log.info("home0205");
		
		//forwarding
		//"/"로 시작하면 웹 애플리케이션의
		//컨텍스트 경로에 영향을 받지 않는
		//절대 경로 의미
		return"/sub/home0205";
	}
	
	//JSON : JavaScript Object Notation
	//3.자바빈즈 클래스타입
	//@ResponseBody:  JSON 객체 타입의 데이터를 만들어서 반환
	//MemberVO타입의 member 객체 => String(serialize)
	@ResponseBody
	@GetMapping("/goHome0301")
	public MemberVO home0301() {
		log.info("home0301");
		
		MemberVO member = new MemberVO();
		
		return member;
	}
	//4. 컬렉션 List 타입
   //JSON 객체 배열 타입의 데이터를 만들어서 반환
	//@ResponseBody : 반환값이 컬렉션 List 타입이면 JSON객체 배열 타입으로
   //자동으로 변환	
	@ResponseBody
	@GetMapping("/goHome04")
	public List<MemberVO> home04(){
		
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		MemberVO member = new MemberVO();
		list.add(member);
		MemberVO member2 = new MemberVO();
		list.add(member2);
		
		return list;
	}
	
	/*
	 5. 컬렉션 Map 타입
	 JSON: JavaScripty Object Natation(문자열)
	 Map 형태의 컬렉션 자료를 JSON 객체 타입의 데이터로 만들어서 반환
	 
	 */
	@ResponseBody //데이터로서 응답이됨
	@GetMapping("/goHome05")
	public Map<String, MemberVO> home05(){
		log.info("home05");
		
		Map<String, MemberVO> map
			= new HashMap<String, MemberVO>();
		MemberVO member = new MemberVO();
		member.setUserId("a001");
		MemberVO member2 = new MemberVO();
		member2.setUserId("b001");
		
		map.put("key1",member);
		map.put("key2",member2);
		// view: /views/goHome05.jsp => @ResponseBody 없으면 views 로 감
		return map;
	}
	/* 6. ResponseEntity<Void> 타입
    response 할 때 Http 헤더 정보와 내용을 가공
    */
	@ResponseBody//데이터로서 응답이됨
	@GetMapping("/goHome06")
	public ResponseEntity<Void> home06(){
		log.info("home06");
		
		//응답데이터가 없음(void)
		//Http 상태 코드 : 200 성공
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	/* 7. ResponseEntity<String> 타입
    response 할 때 Http 헤더 정보와 문자열 데이터를 전달 
    Object: 객체(인스턴스) / Entity: 객체
    */
	@ResponseBody
	@GetMapping("/goHome07")
	public ResponseEntity<String> home07(){
		log.info("home07");
		return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}
	
	   /* 8. ResponseEntity<자바빈즈 클래스:VO> 타입
	    * 자바빈 규약 : 1. 프로퍼티 2. 기본생성자 3. getter/setter메서드
	    * response 할 때 Http 헤더 정보와
	    * 객체 데이터를 전달
	    */
	@GetMapping("/goHome08")
	public ResponseEntity<MemberVO> home08(){
		log.info("home08");
		MemberVO member = new MemberVO();
		member.setUserId("a001");
		
		ResponseEntity<MemberVO> entity
		 = new ResponseEntity<MemberVO>(member,HttpStatus.NOT_FOUND);
		
		if(member.getUserId()==null) {
			return new ResponseEntity<MemberVO>(member,HttpStatus.NOT_FOUND);
		}else {
			return new ResponseEntity<MemberVO>(member,HttpStatus.OK);
		}
	}
	//9. ResponseEntity<List> 타입
	   //response할 때 Http 헤더 정보와
	   // 객체 배열 데이터를 전달
	   @ResponseBody
	   @GetMapping("/goHome09")
	   public ResponseEntity<List<MemberVO>> home09(){
	      
	      List<MemberVO> list = new ArrayList<MemberVO>();
	      
	      MemberVO member = new MemberVO();
	      list.add(member);
	      MemberVO member2 = new MemberVO();
	      list.add(member2);
	      
	      return new ResponseEntity<List<MemberVO>>(list,HttpStatus.OK);
	   }
	   /* 10. ResponseEntity<Map> 타입
	    response할 때 Http헤더 정보과 객체 데이터를
	    Map 형태로 전달
	    */
	   @ResponseBody
	   @GetMapping("/goHome10")
	   public ResponseEntity<Map<String, MemberVO>> home10(){
	      log.info("home10");
	      
	      Map<String, MemberVO> map
	       = new HashMap<String, MemberVO>();
	      
	      MemberVO member = new MemberVO();
	      member.setUserId("a001");
	      
	      MemberVO member2 = new MemberVO();
	      member2.setUserId("b001");
	      
	      map.put("key1", member);
	      map.put("key2", member2);
	      
	      // View : /views/goHome10.jsp (x)
	      return new ResponseEntity<Map<String, MemberVO>>(map, HttpStatus.OK);
	   }
	   /* 11. ResponseEntity<byte[]>타입
	   response 할 때 Http 헤더 정보와 바이너리(binary)
	   binary : 2개(0,1) => 사진, 영상, 음성
	   파일 데이터를 전달하는 용도로 사용
	   */
	   @ResponseBody
	   @GetMapping("/goHome1101")
	   public ResponseEntity<byte[]> home1101() throws IOException {
	      log.info("home1101");
	      
	      //00111011110011...
	      InputStream in = null;
	      //응답객체
	      ResponseEntity<byte[]> entity = null;
	      
	      HttpHeaders headers = new HttpHeaders();
	      
	      try {
	         //이미지 읽음
	         //                     이미지가 있는 경로 찾아야함
	         in = new FileInputStream("C:\\Users\\PC-15\\git\\repository\\springProj\\src\\main\\webapp\\resources\\img\\avatar5.png");
	         
	         //png 이미지라는 것을 헤더에 알려줘서 세팅함
	         headers.setContentType(MediaType.IMAGE_PNG);
	         
	         //이미지를 읽은 결과 객체를 응답 개체에 할당
	         entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      } finally {
	         in.close();
	      }
	      
	      return entity;
	   }
	@ResponseBody
	@GetMapping("/goHome1102")   
	public ResponseEntity<byte[]> home1102(RedirectAttributes ra) throws IOException{
		log.info("home1102");
		//Stream : 파일을 읽거나 쓸 때, 네트워크 소켓을 거쳐 통신할 때 쓰이는 추상적인 개념
        //         데이터가 전송되는 통로
        //InputStream : 추상 클래스. 데이터가 들어오는 통로의 역할에 관해 규정하고 있음
        //            1) 데이터를 읽어야 함 2) 남은 데이터 확인 3) 데이터 skip 가능 4) close가능(통로 제거)
        //            5) 특정 시점부터 다시 읽을 수 있음
		InputStream in =null;
		ResponseEntity<byte[]> entity= null;
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			in = new FileInputStream("C:\\Users\\PC-15\\git\\repository\\springProj\\src\\main\\webapp\\resources\\img\\avatar5.png");
			
			headers.setContentType(MediaType.IMAGE_PNG);
			
			//IOUtils : commons - io에서 제공. byte로 관리
			//HttpStatus.CREATED : HTTP 상태 201 
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			//Bad Request: 400
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
	}
}
