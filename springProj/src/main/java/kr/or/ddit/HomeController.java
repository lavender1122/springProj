package kr.or.ddit;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
