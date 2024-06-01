package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ComCodeInfoVO;

public interface ComCodeInfoService {
	public List<ComCodeInfoVO> create();
	
	public int createPost(ComCodeInfoVO comCodeInfoVO); 
	public ComCodeInfoVO detail(ComCodeInfoVO comCodeInfoVO);
	public int updatePost(ComCodeInfoVO comCodeInfoVO); 
	public int deletePost(ComCodeInfoVO comCodeInfoVO);
	public List<ComCodeInfoVO> list(Map<String, Object> map);
}
