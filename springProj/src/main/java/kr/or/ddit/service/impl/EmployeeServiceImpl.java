package kr.or.ddit.service.impl;

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
}