package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AttachVO {
	private String globalCode;
	private int seq;
	private String filename;
	private long fileSize;
	private String contentType;
	private Date regDate;
}
