package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

//공통 코드 정보
@Data
public class ComCodeInfoVO {
	private String comCode;
	private String comCodeNm;
	private String descriptions;
	
	//COM_CODE_INFO : COM_DET_CODE_INFO = 1:N
	private List<ComDetCodeInfoVO> comDetCodeInfoVOList;
	
}
