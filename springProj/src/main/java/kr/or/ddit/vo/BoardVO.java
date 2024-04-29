package kr.or.ddit.vo;

import lombok.Data;

@Data
public class BoardVO {
	//포로퍼티, 멤버변수, 필드
	private int boardNo; //식별자, 기본키(P.K)
	private String title;
	private String content;
	private String writer;
	
}
