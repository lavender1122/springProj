package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LprodVO;

public interface LprodService {

	public int createPost(LprodVO lprodVO);

	public List<LprodVO> list(Map<String, Object> map);

	public LprodVO detail(LprodVO lprodVO);

	public int updatePost(LprodVO lprodVO);

	public int deletePost(LprodVO lprodVO);

}
