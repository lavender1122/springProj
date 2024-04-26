package kr.or.ddit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.ContUsVO;

@Repository
public class ContUsDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int createPost(ContUsVO contUsVO) {
		return this.sqlSessionTemplate.insert("contUs.createPost",contUsVO);
	}

	public List<ContUsVO> list() {
		return this.sqlSessionTemplate.selectList("contUs.list");
	}

}
