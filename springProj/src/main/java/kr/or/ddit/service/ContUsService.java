package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.ContUsVO;

public interface ContUsService {

	public int createPost(ContUsVO contUsVO);

	public List<ContUsVO> list();

}
