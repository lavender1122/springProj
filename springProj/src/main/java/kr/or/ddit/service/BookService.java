package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BookVO;

public interface BookService {
	
	
	//도서등록
	public int createPost(BookVO bookVO);
	
	//도서목록
	public List<BookVO> list(Map<String, Object> map);
	
	//도서 상세
	public BookVO detail(BookVO bookVO);
	//도서 수정
	public int updatePost(BookVO bookVO);
	//도서 삭제
	public int deletePost(BookVO bookVO);

	//도서 전체 행수
	public int getTotal(Map<String, Object> map);
}
