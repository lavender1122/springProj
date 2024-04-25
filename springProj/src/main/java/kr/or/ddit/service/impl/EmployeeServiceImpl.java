package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.EmployeeDao;
import kr.or.ddit.service.EmployeeService;
import kr.or.ddit.vo.EmployeeVO;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	EmployeeDao employeeDao;

	public int createPost(EmployeeVO employeeVO) {
		return this.employeeDao.createPost(employeeVO);
	}

	@Override
	public List<EmployeeVO> list(Map<String, Object> map) {
		return this.employeeDao.list(map);
	}

	@Override
	public EmployeeVO detail(EmployeeVO employeeVO) {
		return this.employeeDao.detail(employeeVO);
	}

	@Override
	public int updatePost(EmployeeVO employeeVO) {
		return this.employeeDao.updatePost(employeeVO);
	}

	@Override
	public int deletePost(EmployeeVO employeeVO) {
		return this.employeeDao.deletePost(employeeVO);
	}
}
