package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.CustomerVO;

@Repository
public class CustomerDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int create(CustomerVO customerVO) {
		return this.sqlSessionTemplate.insert("customer.create",customerVO);
	}

	public List<CustomerVO> list(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("customer.list",map);
	}

	public CustomerVO detail(CustomerVO customerVO) {
		return this.sqlSessionTemplate.selectOne("customer.detail", customerVO);
	}

	public int updatePost(CustomerVO customerVO) {
		return this.sqlSessionTemplate.update("customer.updatePost", customerVO);
	}

	public int deletePost(CustomerVO customerVO) {
		return this.sqlSessionTemplate.delete("customer.deletePost", customerVO);
	}
}
