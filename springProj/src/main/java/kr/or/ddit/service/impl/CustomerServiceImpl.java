package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.CustomerDao;
import kr.or.ddit.service.CustomerService;
import kr.or.ddit.vo.CustomerVO;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	CustomerDao customerDao;


	@Override
	public int create(CustomerVO customerVO) {
		return this.customerDao.create(customerVO);
	}


	@Override
	public List<CustomerVO> list(Map<String, Object> map) {
		return this.customerDao.list(map);
	}


	@Override
	public CustomerVO detail(CustomerVO customerVO) {
		return this.customerDao.detail(customerVO);
	}


	@Override
	public int updatePost(CustomerVO customerVO) {
		return this.customerDao.updatePost(customerVO);
	}


	@Override
	public int deletePost(CustomerVO customerVO) {
		return this.customerDao.deletePost(customerVO);
	}
}
