package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ComDetCodeInfoVO;

public interface ComDetCodeInfoService {
	public List<ComDetCodeInfoVO> create();
	
	public int createPost(ComDetCodeInfoVO comCodeInfoVO); 
	public ComDetCodeInfoVO detail(ComDetCodeInfoVO comCodeInfoVO);
	public int updatePost(ComDetCodeInfoVO comCodeInfoVO); 
	public int deletePost(ComDetCodeInfoVO comCodeInfoVO);
	public List<ComDetCodeInfoVO> list(Map<String, Object> map);

	public String getNextComCode(ComDetCodeInfoVO comDetCodeInfoVO);
}
