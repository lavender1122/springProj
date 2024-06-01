package kr.or.ddit.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.dao.AttachDao;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.ContUsVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class UploadController {
//	static String uploadFolder; 
	//root-context.xml 랑 같음 static 쓰는 이유 => uploadOne 쓰기 위해서
	//null이 메모리에 올라감 
	//@Autowired 무쓸모
	//static 사용할려면 경로 작성해야함 String uploadFolder="C://...";
	@Autowired
	String uploadFolder; //root-context.xml 랑 같음 static 쓰는 이유 => uploadOne 쓰기 위해서
	@Autowired
	AttachDao attachDao;
	@Autowired
	String uploadFolderDirect;
	
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

	public int uploadOne(MultipartFile uploadFile, String globalCode) {
		int result = 0;
		
		//c:\\..\\upload + "\\"+ 2024\\05\07
		File uploadPath = new File(uploadFolder,getFolder());
		if(uploadPath.exists()==false){
			uploadPath.mkdirs();
		}
		log.info("-----------------");
		log.info("파일명:"+ uploadFile.getOriginalFilename());
		log.info("파일크기:"+ uploadFile.getSize());
		log.info("MIME: "+ uploadFile.getContentType());
		
		String uploadFileName = uploadFile.getOriginalFilename();
		
		//UUID : 랜덤값 생성
		UUID uuid = UUID.randomUUID();
		//asdfasdf개똥이.jsp
		uploadFileName = uuid.toString()+"_"+ uploadFileName;
		
		//복사 설계
		File saveFile = new File(uploadPath,uploadFileName);
		
		try {
			uploadFile.transferTo(saveFile);
			
			//웹경로
			String fileName = "/"+getFolder().replace("\\", "/") + "/"+uploadFileName;
			
			AttachVO attachVO = new AttachVO();
			attachVO.setGlobalCode(globalCode);
			attachVO.setSeq(1);
			attachVO.setFilename(fileName);
			attachVO.setFileSize(uploadFile.getSize());
			attachVO.setContentType(uploadFile.getContentType());
			attachVO.setRegDate(null);
			
			log.info("upload attachVO"+ attachVO);
			
			result += attachDao.insertAttach(attachVO);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public int uploadMulti(MultipartFile[] upload,String globalCode) {
		int result = 0;
		
		//c:\\..\\upload + "\\"+ 2024\\05\07
		File uploadPath = new File(uploadFolder,getFolder());
		if(uploadPath.exists()==false){
			uploadPath.mkdirs();
		}
		//스프링파일객체 타입의 배열로 부터 파일 객체를 하나씩 꺼냄
		
	    String uploadFileName =""; //업로드용
	    String fileName=""; // DB용
	    int seq = 1;
	    for(MultipartFile multipartFile:upload) {
		log.info("-----------------");
		log.info("파일명:"+ multipartFile.getOriginalFilename());
		log.info("파일크기:"+ multipartFile.getSize());
		log.info("MIME: "+ multipartFile.getContentType());
		uploadFileName = multipartFile.getOriginalFilename();
	
		//UUID : 랜덤값 생성
		UUID uuid = UUID.randomUUID();
		//asdfasdf개똥이.jsp
		uploadFileName = uuid.toString()+"_"+ uploadFileName;
		
		//복사 설계
		File saveFile = new File(uploadPath,uploadFileName);
		
		try {
			multipartFile.transferTo(saveFile);
			
			//웹경로
			fileName = "/"+getFolder().replace("\\", "/") + "/"+uploadFileName;
			
			AttachVO attachVO = new AttachVO();
			attachVO.setGlobalCode(globalCode);
			attachVO.setSeq(seq++);
			attachVO.setFilename(fileName);
			attachVO.setFileSize(multipartFile.getSize());
			attachVO.setContentType(multipartFile.getContentType());
			attachVO.setRegDate(null);
			
			log.info("upload attachVO"+ attachVO);
			
			result += attachDao.insertAttach(attachVO);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    }
	    return result;
	}
	
	//CKEditor5 파일 업로드
	// /image/upload
	// ckeditor는 이미지 업로드 후 이미지 표시하기 위해 uploaded 와 url을 json 형식으로 받아야 함
	// modelandview를 사용하여 json 형식으로 보내기위해 모델앤뷰 생성자 매개변수로 jsonView 라고 써줌
	// jsonView 라고 쓴다고 무조건 json 형식으로 가는건 아니고 @Configuration 어노테이션을 단 
	// WebConfig 파일에 MappingJackson2JsonView 객체를 리턴하는 jsonView 매서드를 만들어서 bean으로 등록해야 함
	@ResponseBody
	@PostMapping("/image/upload")
	public Map<String,Object> image(MultipartHttpServletRequest request) throws IllegalStateException, IOException{
		ModelAndView mav = new ModelAndView("jsonView");//json 형식으로 보내기위해 모델앤뷰 생성자 매개변수로 jsonView 라고 써줌
		// ckeditor 에서 파일을 보낼 때 upload : [파일] 형식으로 해서 넘어오기 때문에 upload라는 키의 밸류를 받아서
	    // uploadFile에 저장함
		MultipartFile uploadFile = request.getFile("upload");
		log.info("uploadFile:"+uploadFile);
		
		//파일명
		String originalFileName = uploadFile.getOriginalFilename();
		log.info("originalFileName: "+originalFileName);
		
		//originalFileName : 개똥이.jpg -> .jpg (확장자)
		String ext = originalFileName.substring(originalFileName.indexOf("."));//확장자.의 위치
		
		// 서버에 저장될 때 중복된 파일 이름인 경우를 방지하기 위해 UUID에 확장자를 붙여 새로운 파일 이름을 생성
		//asdfsdf.jpg
		String newFileName=UUID.randomUUID()+ext;
		
		File f = new File(uploadFolderDirect);
		if(f.exists()==false) {
			f.mkdirs();
		}
		
		
		//저장 경로로 파일 객체를 저장하겠다라는 계획
		// \\업로드 경로\\asdffasdf.jsp
		File file = new File(uploadFolderDirect,newFileName);
		
		//파일복사
		uploadFile.transferTo(file);//복사
		// 브라우저에서 이미지 불러올 때 절대 경로로 불러오면 보안의 위험 있어 상대경로를 쓰거나 이미지 불러오는 jsp 또는 클래스 파일을 만들어
	    // 가져오는 식으로 우회해야 함
	    // 때문에 savePath와 별개로 상대 경로인 uploadPath 만들어줌
		String uploadPath ="/springProj/resources/upload/"+newFileName;
		
		// uploaded, url 값을 modelandview를 통해 보냄
//      mav.addObject("uploaded", true); // 업로드 완료
//      mav.addObject("url", uploadPath); // 업로드 파일의 경로
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uploaded", true);
		map.put("url", uploadPath);
		
		log.info("map:"+map);
		
		return map;
	}
}
