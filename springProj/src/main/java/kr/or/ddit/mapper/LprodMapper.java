package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProductVO;

public interface LprodMapper {
	public List<LprodVO> list(Map<String, Object> map);
	

	public LprodVO detail(LprodVO lprodVO);

	public int updatePost(LprodVO lprodVO);

	public int deletePost(LprodVO lprodVO);

	public int lastLprodId();
	
	//PRODUCT 테이블에 insert
	public int insertProduct(ProductVO productVO);

	public int createPost(LprodVO lprodVO);
	
	//전체 행의 수
	public int getTotal(Map<String, Object> map);

}
