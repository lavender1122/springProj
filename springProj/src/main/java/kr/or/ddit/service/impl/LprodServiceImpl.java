package kr.or.ddit.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dao.LprodDao;
import kr.or.ddit.mapper.LprodMapper;
import kr.or.ddit.service.LprodService;
import kr.or.ddit.service.dao.AttachDao;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProductVO;
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
public class LprodServiceImpl implements LprodService {
	//데이터베이스 접근을 위해 BookDao 인스턴스를 주입받자
	//DI(Dependency Injection):의존성 주입
    //IoC(Inversion of Control):제어의 역전
	@Autowired
	LprodDao lprodDao;
	
	//어디에 업로드?
	@Autowired
	String uploadFolder; //root-context.xml 에서 자바빈 있음
	
	@Autowired
	AttachDao attachDao;
	
	//DI,Ioc
	@Inject
	LprodMapper lprodMapper;
	
	
	@Override
	public int createPost(LprodVO lprodVO) {
		/*
	       LprodVO(lprodId=76, lprodGu=P501, lprodNm=분식류, 
	          productVOList=[
	             ProductVO(productId=P5011, pname=라면, unitPrice=1, ..), 
	             ProductVO(productId=P5012, pname=떡볶이, unitPrice=2, ..), 
	             ProductVO(productId=P5013, pname=순대, unitPrice=3, ..)
	          ]
	       )
	       */
		//1) LPROD 테이블에 insert
		int result = this.lprodDao.createPost(lprodVO);
		//2) RPODUCT 테이블에 insert
		List<ProductVO> productVOList =lprodVO.getProductVOList();
		for(ProductVO productVO:productVOList) {
			result += this.lprodDao.insertProduct(productVO);
		}
		//3) 파일업로드 및 ATTACH 테이블에 insert
	      /*
	       LprodVO(lprodId=76, lprodGu=P501, lprodNm=분식류, 
	          productVOList=[
	             ProductVO(productId=P5011, pname=라면, unitPrice=1, ..), 
	             ProductVO(productId=P5012, pname=떡볶이, unitPrice=2, ..), 
	             ProductVO(productId=P5013, pname=순대, unitPrice=3, ..)
	          ],
	          pictures=[파일객체1,파일객체2]
	       )
	       */
		//연월일 폴더 처리 시작/////
	      //c:\\...\\upload + "\\" + 2024\\05\\07
	      File uploadPath = new File(this.uploadFolder,getFolder());
	    if(uploadPath.exists()==false) {
	    	uploadPath.mkdirs();//파일 생성
	    }
	      //연월일 폴더 처리 끝/////
		
	    //스프링 파일객체 타입의 배열로부터 파일 객체를 하나씩 꺼내보자
	    MultipartFile[] pictures =lprodVO.getPictures();
	    
	    String uploadFileName =""; //업로드용
	    String fileName=""; // DB용
	    int seq = 1;
	    
	    for(MultipartFile multipartFile:pictures) {
	    	log.info("-------------------------");
	    	log.info("파일명:"+multipartFile.getOriginalFilename());
	    	log.info("파일크기 : "+multipartFile.getSize());
	    	log.info("MIME"+multipartFile.getContentType());
	    	log.info("-------------------------");
	    	uploadFileName = multipartFile.getOriginalFilename();
	    	
	    	//UUID
	    	UUID uuid = UUID.randomUUID();
	    	uploadFileName = uuid.toString()+"_"+uploadFileName;
	    	
	    	//파일 복사 계획 
	    	//File 객체 설계(복사할 대상 경로 , 파일명)
//          File saveFile = new File(uploadFolder, uploadFileName);
          //uploadPath : D:\\A_TeachingMaterial\\06_spring\\springProj\\src\\
          //               main\\webapp\\resources\\upload\\2022\\07\\22
	    					   //복사할 파일 설치 경로, 파일명
	    	File saveFile = new File(uploadPath,uploadFileName);
	    	
	    	//파일 복사 실행
	    	try {
				multipartFile.transferTo(saveFile);
				//2024\\05\\07 (윈도우경로) 그래서 웹경로(/)로 대체
				fileName="/"+getFolder().replace("\\", "/")+"/"+uploadFileName;
				
				AttachVO attachVO = new AttachVO();
				attachVO.setGlobalCode(lprodVO.getLprodGu()); //기본키 등록
				attachVO.setSeq(seq++);//복합키
				attachVO.setFilename(fileName);//경로 까지 들어가야함
				attachVO.setFileSize(multipartFile.getSize());
				attachVO.setContentType(multipartFile.getContentType());
				attachVO.setRegDate(null);
				log.info("attachVO"+attachVO);
				
				result +=this.attachDao.insertAttach(attachVO);
			} catch (IllegalStateException e) {
				log.error(e.getMessage());
			} catch (IOException e) {
				log.error(e.getMessage());
			}
	    	
	    }
		
	    return result;
		
	}

	@Override
	public List<LprodVO> list(Map<String, Object> map) {
		log.info("impl->list");
		return this.lprodDao.list(map);
	}

	@Override
	public LprodVO detail(LprodVO lprodVO) {
		return this.lprodDao.detail(lprodVO);
	}

	@Override
	public int updatePost(LprodVO lprodVO) {
		return  this.lprodDao.updatePost(lprodVO);
	}

	@Override
	public int deletePost(LprodVO lprodVO) {
		return this.lprodDao.deletePost(lprodVO);
	}

	@Override
	public int lastLprodId() {
		return this.lprodDao.lastLprodId();

	}
	//연/월/일 폴더 생성
	   public String getFolder() {
	      //2022-11-16 형식(format) 지정
	      //간단한 날짜 형식
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      //날짜 객체 생성(java.util 패키지)
	      Date date = new Date();
	      //2022-11-16
	      String str = sdf.format(date);
	      //2024-01-30 -> 2024\\01\\30
	      //File.separator => \\ 윈도우 경로
//	      return str.replace("-", "\\"); 아래 코드랑 같은 의미
	      return str.replace("-", File.separator);
	   }
	//전체 행의 수 mapper 로 요청함
	@Override
	public int getTotal(Map<String, Object> map) {
		return this.lprodMapper.getTotal(map);
	}

}
