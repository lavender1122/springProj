package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.License;

@Repository
public class EmployeeDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int createPost(EmployeeVO employeeVO) {
		return this.sqlSessionTemplate.insert("employee.createPost", employeeVO);
	}

	public List<EmployeeVO> list(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("employee.list",map);
	}

	public EmployeeVO detail(EmployeeVO employeeVO) {
		return this.sqlSessionTemplate.selectOne("employee.detail", employeeVO);
	}

	public int updatePost(EmployeeVO employeeVO) {
		return this.sqlSessionTemplate.update("employee.updatePost", employeeVO);
	}
	public int deletePost(EmployeeVO employeeVO) {
		return this.sqlSessionTemplate.delete("employee.deletePost", employeeVO);
	}

	public int insertLicense(License license) {
		return this.sqlSessionTemplate.insert("employee.insertLicense", license);
	}

	public int updateFileName(AttachVO attachVO) {
		return this.sqlSessionTemplate.update("employee.updateFileName",attachVO);
	}

	public int getTotal(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("employee.getTotal",map);
	}

}
