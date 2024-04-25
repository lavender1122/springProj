package kr.or.ddit.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.EmployeeVO;

@Repository
public class EmployeeDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int createPost(EmployeeVO employeeVO) {
		return this.sqlSessionTemplate.insert("employee.createPost", employeeVO);
	}

}
