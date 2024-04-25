package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.LprodVO;

public interface LprodService {

	public int createPost(LprodVO lprodVO);

	public List<LprodVO> list();

	public LprodVO detail(LprodVO lprodVO);

}
