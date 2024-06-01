package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Activity {
	private String userId;
	private String postId;
	private String postType;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date postDate;
	private String activityComment;
	
}
