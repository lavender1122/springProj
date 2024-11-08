package kr.or.ddit.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dao.BookDao;
import kr.or.ddit.service.BookService;
import kr.or.ddit.service.dao.AttachDao;
import kr.or.ddit.utils.UploadController;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;

//서비스 클래스 : 비즈니스 로직
//스프링 MVC 구조에서 Controller와 DAO를 연결하는 역할
/*
스프링 프레임워크는 개발자가 직접 클래스를 생성하는 것을 지양하고,
* 프링은 인터페이스를 좋아해. 자꾸자꾸 좋아지면 Impl은 어떡해
인터페이스를 통해 접근하는 것을 권장하고 있기 때문.(확장성)
그래서 서비스 레이어는 인터페이스(BookService)와 클래스(BookServiceImpl)를 함께 사용함

Impl : implement의 약자 
*/
//"프링아 이 클래스 서비스 클래야"라고 알려주자. 프링이가 자바빈으로 등록해줌.
@Slf4j
@Service
public class BookServiceImpl implements BookService {
	//데이터베이스 접근을 위해 BookDao 인스턴스를 주입받자
	   //DI(Dependency Injection):의존성 주입
	   //IoC(Inversion of Control):제어의 역전
	@Autowired
	BookDao bookDao;
	@Autowired
	String uploadFolder;
	@Autowired
	AttachDao attachDao;
	@Autowired
	UploadController uploadController;
	
	//매서드 재정의
	@Override
	public int createPost(BookVO bookVO) {
		//1) BOOK 테이블에 insert
		int result =  this.bookDao.createPost(bookVO);
		//2)파일업로드
			//연월일 폴더 처리 시작
		File uploadPath = new File(this.uploadFolder, uploadController.getFolder());
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs(); // 파일생성
		}
		//스프링 파일 객체 타입의 배열로 부터 파일 객체를 하나씩 거내기
		MultipartFile[] pictures = bookVO.getPictures();
		
		String uploadFileName="";//업로드용
		String fileName="";//DB용
		int seq=1;
		for(MultipartFile multipartFile:pictures) {
			log.info("----------------------------");
			log.info("파일명: "+multipartFile.getOriginalFilename());
			log.info("파일크리: "+ multipartFile.getSize());
			log.info("MIME:"+ multipartFile.getContentType());
			log.info("----------------------------");
			uploadFileName = multipartFile.getOriginalFilename();
			
			//UUID
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+ uploadFileName;
			
			File saveFile = new File(uploadPath, uploadFileName);
			try {
				multipartFile.transferTo(saveFile);
				fileName ="/"+uploadController.getFolder().replace("\\", "/")+uploadFileName;
				
				AttachVO attachVO = new AttachVO();
				attachVO.setGlobalCode(bookVO.getBookId()+"");
				attachVO.setSeq(seq++);
				attachVO.setFilename(fileName);
				attachVO.setFileSize(multipartFile.getSize());
				attachVO.setContentType(multipartFile.getContentType());
				attachVO.setRegDate(null);
				log.info("attachVO"+attachVO);
				
				result  += this.attachDao.insertAttach(attachVO);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
			//연월일 폴더 처리 끝
		//3) ATTACH 테이블에 insert
		return result;
	}
	@Override
	public List<BookVO> list(Map<String, Object> map) {
		return this.bookDao.list(map);
	}
	//도서 상세
	@Override
	public BookVO detail(BookVO bookVO) {
		return this.bookDao.detail(bookVO);
	}
	@Override
	public int updatePost(BookVO bookVO) {
		return this.bookDao.updatePost(bookVO);
	}
	@Override
	public int deletePost(BookVO bookVO) {
		return this.bookDao.deletePost(bookVO);
	}
	@Override
	public int getTotal(Map<String, Object> map) {
		return this.bookDao.getTotal(map);
	}

}
