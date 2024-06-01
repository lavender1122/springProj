package kr.or.ddit.mapper;

import kr.or.ddit.vo.ComCodeVO;

public interface ComCodeMapper {

	//국적을 공통코드로부터 가져오기
	ComCodeVO getComCode(String comCode);

}
