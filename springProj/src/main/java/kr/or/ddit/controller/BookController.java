package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.BookService;
import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;

/*
Controller 어노테이션
스프링 프레임워크에게 "이 클래스는 웹 브라우저의 요청(request)를
받아들이는 컨트롤러야" 라고 알려주는 것임.
스프링은 servlet-context.xml의 context:component-scan의 설정에 의해
이 클래스를 자바빈 객체로 등록(메모리에 바인딩).
*/
@Slf4j
@Controller
public class BookController {
	//서비스를 호출하기 위해 의존성 주입(Dependency Injection-DI)
	//IoC(Inversion of Control) - 제어의 역전.(개발자가 객체생성하지 않고 스프링이 객체를 미리 생성해놓은 것을 개발자가 요청)
	//의존성 ( Injection)
	@Autowired
	BookService bookService;
	//요청URI : /create
	   //요청파라미터 : 
	   //요청방식 : get
	@RequestMapping(value="/create",method=RequestMethod.GET)
	public ModelAndView create() {
		/*
    ModelAndView
    1) Model : Controller가 반환할 데이터(String, int, List, Map, VO..)를 담당
    2) View : 화면을 담당(뷰(View : JSP)의 경로)
		 */
		ModelAndView mav = new ModelAndView();
		//데이터 -> name :title / value : "도서생성" 데이터 담기
		mav.addObject("title", "도서생성");
		//jsp
//      <beans:property name="prefix" value="/WEB-INF/views/" />
//      <beans:property name="suffix" value=".jsp" />
      // prefix(접두어) : /WEB-INF/views/
      // suffix(접미어) : .jsp
      // /WEB-INF/views/ + book/create + .jsp
      //forwarding
		mav.setViewName("book/create");
		
		return mav;
	}
	
	/* 
	요청URI : /crate
	요청파라미터 : {title=개똥이의 모험, category=소설, price=12000}
	요청방식 : post
	*/
	@RequestMapping(value="/create",method=RequestMethod.POST)
	public ModelAndView createPost(BookVO bookVO) {
		log.info("bookVO:"+bookVO);
		ModelAndView mav = new ModelAndView();
		//도서 등록
		int result =this.bookService.createPost(bookVO);
//		log.info("createPost->result : "+result);
		//데이터
		mav.addObject("bookVO", bookVO); //redirect 하면 의미 사라짐
		//redirect : 새로운 URL 요청
		mav.setViewName("redirect:/list");
		
		return mav;
	}
	/* 
	요청URI : /createAjax
	요청파라미터(JSON->String) :
	  {bookId:0,title:개똥이의 모험, category:소설, price:12000,insertDate=null||기본값}
	요청방식 : post
	
	@ResponseBody : BookVO -> String 형태(serialize) why? 네트워크에서 네트워크 데이터 전송할려면 String 형태(serialize)이어야 한다
	
	 */
	@ResponseBody
	@RequestMapping(value="/createAjax",method=RequestMethod.POST)
	public BookVO createAjax(@RequestBody BookVO bookVO) {
		log.info("bookVO:"+bookVO);
		//도서 등록
		int result =this.bookService.createPost(bookVO);
		log.info("createPost->result : "+result);
		return bookVO;
	}
	/*
    요청URI : /list?keyword=알탄 or /list or /list?keyword=
    요청파라미터 : keyword=알탄
    요청방식 : get
    
    required=false : 선택사항. 파라미터가 없어도 무관, 필수가 아니다
    				defaultValue => 기본값
    */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mav,
			@RequestParam(value = "keyword",required=false,defaultValue = "")  String keyword) {
//		log.info("list에 왔다");
		log.info("list -> keyword:" +keyword);
		
		//map{"keyword":"알탄"}
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		
//		도서목록
		List<BookVO> bookVOList = this.bookService.list(map);
//		log.info("list ->bookVOList >>>"+bookVOList);
//		Model: 데이터
		mav.addObject("bookVOList", bookVOList);
		//View : jsp
		//forwarding
		mav.setViewName("book/list");
		return mav;
	}
	/*
    요청URI : /listAjax
    요청파라미터 : {keyword:알탄} or {keyword:""}
    요청방식 : post
    */
	@ResponseBody
	@RequestMapping(value="/listAjax",method=RequestMethod.POST)
	public List<BookVO> listAjax(@RequestBody Map<String, Object> map) {
		
//		도서목록
		List<BookVO> bookVOList = this.bookService.list(map);
		log.info("listAjax ->bookVOList >>>"+bookVOList);
		
		return bookVOList;
	}
	//책 상세보기
	   //요청된 URI 주소 : http://localhost/detail?bookId=3
	   //요청파라미터(HTTP 파라미터), 쿼리 스트링(Query String) : bookId=3 
	   //요청방식 : get
	   //매개변수 : bookVO => {"bookId":"3","title":null,"category":null,"price":0,"insertDate":null}
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public ModelAndView detail(BookVO bookVO, ModelAndView mav) {
//		log.info("detail -> bookVO: "+bookVO);
		//호출 전 :  {"bookId":"3","title":null,"category":null,"price":0,"insertDate":null}
		//도서 상세
		bookVO=this.bookService.detail(bookVO);
		//호출 후 : {"bookId":"3","title":"개똥이의 모험","category":"소설","price":12000,"insertDate":"2024-04-22"}
//		log.info("detail 후 -> bookVO: "+bookVO);
		
		//Model : 데이터
		mav.addObject("title", "도서 상세");
		mav.addObject("bookVO", bookVO);
		//view : jsp
		mav.setViewName("book/detail");
		
		return mav;
	}
//	@RequestMapping(value="/detail", method=RequestMethod.GET)
	//              value라는 속성이 하나 -> 생략 가능
	@GetMapping("/detail2")
	public String detail2(BookVO bookVO, Model model) {
//		log.info("detail -> bookVO: "+bookVO);
		//호출 전 :  {"bookId":"3","title":null,"category":null,"price":0,"insertDate":null}
		//도서 상세
		bookVO=this.bookService.detail(bookVO);
		//호출 후 : {"bookId":"3","title":"개똥이의 모험","category":"소설","price":12000,"insertDate":"2024-04-22"}
//		log.info("detail 후 -> bookVO: "+bookVO);
		
		//Model : 데이터
		model.addAttribute("title", "도서 상세");
		model.addAttribute("bookVO", bookVO);
		//view : jsp
//		mav.setViewName("book/detail"); 사라지고 지런으로 가
		
		return "book/detail";
	}
	/* 
	요청URI : /updatePost
	요청파라미터 : {bookId=127, title=개똥이의 모험2, category=소설2, price=12002}
	요청방식 : post
	*/
	@RequestMapping(value = "/updatePost", method = RequestMethod.POST)
	public ModelAndView updatePost(BookVO bookVO, ModelAndView mav) {
		log.info("updatePost-> bookVO:"+bookVO);
		//insert, update, delete의 return 타입 : int타입
		int result =this.bookService.updatePost(bookVO);
		log.info("updatePost ->result"+result);
		// redirect -> 새로운 URI를 재요청  /detail?bookId=127
		mav.setViewName( "redirect:/detail?bookId="+bookVO.getBookId());
		return mav;
	}
	/* 
	요청URI : /updateAjax
	요청파라미터 (JSON -> String): {bookId=127, title=개똥이의 모험2, category=소설2, price=12002}
	요청방식 : post
	 */
	@ResponseBody
	@RequestMapping(value = "/updateAjax", method = RequestMethod.POST)
	public BookVO updateAjax(@RequestBody BookVO bookVO){
		log.info("updatePost-> bookVO:"+bookVO);
		int result =this.bookService.updatePost(bookVO);
		log.info("updatePost ->result"+result);
		
		//상세보기
		bookVO = this.bookService.detail(bookVO);
		
		return bookVO;
	}
	/*
	요청URI : /deletePost
	요청파라미터 : {bookId=127, title=개똥이의 모험2, category=소설2, price=12002}
	요청방식 : post
*/
	@RequestMapping(value="/deletePost",method = RequestMethod.POST)
	public ModelAndView deletePost(BookVO bookVO, ModelAndView mav) {
//		BookVO(bookId=131, title=test, category=test, price=1234, insertDate=null)
		log.info("deletePost->bookVO "+bookVO);
		int result =this.bookService.deletePost(bookVO);
		log.info("deletePost ->result"+result);
		//redirect -> list로 보냄
		mav.setViewName("redirect:/list");
		return mav;
	}
	/*
	요청URI : /deleteAjax
	요청파라미터 : {bookId=127, title=개똥이의 모험2, category=소설2, price=12002}
	요청방식 : post
	 */
	@ResponseBody
	@RequestMapping(value="/deleteAjax",method = RequestMethod.POST)
	public int deleteAjax(@RequestBody BookVO bookVO) {
//		BookVO(bookId=131, title=test, category=test, price=1234, insertDate=null)
		log.info("deletePost->bookVO "+bookVO);
		int result =this.bookService.deletePost(bookVO);
		log.info("deletePost ->result"+result);
		//redirect -> list로 보냄
		return result;
	}
}
