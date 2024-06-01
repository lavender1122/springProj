package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class ComCodeVO {
	private String comCode;
	private String comCodeNm;
	
	//COM_CODE : COM_CODE_DETAIL = 1:N
	private List<ComCodeDetailVO> comCodeDetailVOList;

}
