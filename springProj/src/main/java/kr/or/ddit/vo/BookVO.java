package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

//자바빈 클래스
//1) 멤버변수(프로퍼티) 2) 기본생성자 3) getter/setter메소드
//@Data=> PoJo(Plain순수한 old Java object)에 위배
@Data
public class BookVO {
	private int      rnum;
	private int      bookId;
	private String   title;
	private String 	 category;
	private int 	 price;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date	 insertDate;
	private String   insertDateStr;
	//BOOK: ATTACH = 1:N
	private MultipartFile[] pictures;
}
