package kr.or.ddit.service.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.AttachVO;

@Repository
public class AttachDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//ATTACH 테이블에 isnert
	public int insertAttach(AttachVO attachVO) {
		return this.sqlSessionTemplate.insert("attach.insertAttach",attachVO);
	}
	//글로벌코드를 조건으로 하여 첫번째 첨부파일 객체를 가져옴
	public AttachVO getFileName(String globalCode) {
		return this.sqlSessionTemplate.selectOne("attach.getFileName", globalCode);
	}
	
}
