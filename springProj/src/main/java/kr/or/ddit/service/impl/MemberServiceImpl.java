package kr.or.ddit.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dao.MemberDao;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.dao.AttachDao;
import kr.or.ddit.vo.Address;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.Card;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberDao;
	
	//첨부파일 처리용 DateaccessObject
	@Autowired
	AttachDao attachDao;
	
	//<bean id="uploadFolder" class="java.lang.String"> => root-context
	@Autowired
	String uploadFolder;
	
	
	@Override
	public int registerUserId(MemberVO member) {
		int result = this.memberDao.registerUserId(member);
		log.info("registerUserId -> result :" + result);
		//2)Address
		//address{userId = null,postCode =54321,location = 대전서구 321}
		Address address = member.getAddress();
		address.setUserId(member.getUserId());
		//address{userId = b001,postCode =54321,location = 대전서구 321}
		log.info("registerUserId -> address :" + address);
		result += this.memberDao.insertAddress(address);
		log.info("registerUserId -> result(2) :" + result);
		
		// 3)CARD
		List<Card> cardList =member.getCardList();
		for(Card card : cardList) {
			card.setUserId(member.getUserId());
			
		result +=this.memberDao.insertCard(card);
		}
		
		return result;
	}

	@Override
	public int registerFile08(MemberVO member) {
		log.info("userId: "+member.getUserId());
		log.info("password: "+member.getPassword());
		//업로드 대상 경로
		log.info("uploadFolder:" + this.uploadFolder);
		
		//make folder 시작
		//                          \\c:\\..\\upload \\ 2024\\05\\03
		File uploadPath = new File(this.uploadFolder,getFolder()); 
		log.info("uploadPath:"+uploadPath);
		//만약 연/월/일 해당 폴더가 없으면 생성
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		//make folder 끝
		  
		  //1) MEMBER 테이블에 insert
		member.setUserName("개똥이"); //임의로 넣은값
		member.setCoin(1000);//임의로 넣은값
		  int result = this.memberDao.registerUserId(member);
		  log.info("registerFile08 ->result(1):"+result);
		   //스프링파일객체 배열 타입
		   MultipartFile[] picures =member.getPictures();
		   
		   String fileName="";
		   long size=0;
		   String contentType="";
		   int seq = 1;
		   
		   for(MultipartFile multipartFile : picures) {
			   fileName = multipartFile.getOriginalFilename();
			   size = multipartFile.getSize();
			   contentType=multipartFile.getContentType();
			   
			   log.info("=======================================");
			   log.info("fileName:"+fileName);
			   log.info("size:"+size);
			   log.info("contentType:"+contentType);
			   log.info("=======================================");
			   
			   //파일업로드 처리
			   //같은 날 같은 이미지명을 업로드 시 파일 중독시 중복 방지 시작
			   //java.util.UUID => 랜덤값 생성
			   UUID uuid = UUID.randomUUID();
			   // asdf_개똥이.jpg
			   fileName= uuid.toString()+"_"+"fileName";
			   //같은 날 같은 이미지명을 업로드 시 파일 중독시 중복 방지 끝
			   
			   //File 객체 설계 (복사할 대상 경로, 파일명)
			   //    c:\\..\\upload, 2024\\05\\03, asdf_개똥이.jpg
			   File saveFile = new File(uploadPath, fileName);
			   
			   
			   //2) ATTACH 테이블에 insert
			   AttachVO attachVO = new AttachVO();
			   attachVO.setGlobalCode(member.getUserId());
			   attachVO.setSeq(seq++);
			   attachVO.setFilename(fileName);
			   attachVO.setFileSize(size);
			   attachVO.setContentType(contentType);
			   attachVO.setRegDate(null);
			   
			   result += this.attachDao.insertAttach(attachVO);
			   
		   }
		return result;
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

	@Override
	public MemberVO read01(String userId) {
		return this.memberDao.read01(userId);
	}
}
