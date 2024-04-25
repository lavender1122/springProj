package kr.or.ddit.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.ProjectAddVO;

@Repository
public class ProjectAddDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int createPost(ProjectAddVO projectAddVO) {
		return this.sqlSessionTemplate.insert("projectAdd.createPost", projectAddVO);
	}

}
