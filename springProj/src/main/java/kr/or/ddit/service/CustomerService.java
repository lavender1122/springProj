package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CustomerVO;

public interface CustomerService {

	public int create(CustomerVO customerVO);

	public List<CustomerVO> list(Map<String, Object> map);

	public CustomerVO detail(CustomerVO customerVO);

	public int updatePost(CustomerVO customerVO);

	public int deletePost(CustomerVO customerVO);

}
