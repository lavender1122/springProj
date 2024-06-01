package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;
//매퍼xml(lprod_SQL.xml)을 실행시키는 
//DAO(Data Access Object) 클래스
//Repository 어노테이션 : 데이터에 접근하는 클래스
//스프링이 데이터를 관리하는 클래스라고 인지하여 자바빈으로 등록하여 관리함
@Slf4j
@Repository
public class LprodDao {
	//DI(Dependency Injection) : 의존성 주입
	   //개발자가 new 키워드를 통해 직접 객체를 생성하지 않고!!!
	   //스프링이 미리 만들어 놓은(서버 실행 시 스프링이 미리 xml을 읽어
	   //객체를 인스턴스화 해놓음)
	   //sqlSessionTemplate 타입 객체를 LprodDao 객체에 주입함
	//Ioc(제어의 역전)
	@Autowired 
	SqlSessionTemplate sqlSessionTemplate;  //root-context.xml bean id="sqlSessionTemplate" 똑같이 써야한다
	//lprod_SQL.xml 파일의 namespace가 lprod이고, id가 createPost인
    //태그를 찾아 그 안에 들어있는 sql을 실행함
    //lprodVO=>{lprodId=14, lprodGu=P501, lprodNm=분식류}
    //insert,update,delete는 반영된 건수가 return됨
    //insert성공 : 1이상, 실패면 0
//	public int createPost(LprodVO lprodVO) {
//		return this.sqlSessionTemplate.insert("lprod.createPost", lprodVO);
//	}
	
	public List<LprodVO> list(Map<String, Object> map) {
		log.info("dao->list");
		//.selectList("매퍼xml파일의 namvespace.id")
		return this.sqlSessionTemplate.selectList("lprod.list",map);
	}

	public LprodVO detail(LprodVO lprodVO) {
		return this.sqlSessionTemplate.selectOne("lprod.detail", lprodVO);
	}

	public int updatePost(LprodVO lprodVO) {
		return this.sqlSessionTemplate.update("lprod.updatePost", lprodVO);
	}

	public int deletePost(LprodVO lprodVO) {
		return this.sqlSessionTemplate.delete("lprod.deletePost", lprodVO);
	}

	public int lastLprodId() {
		return this.sqlSessionTemplate.selectOne("lprod.lastLprodId");
	}
	
	//PRODUCT 테이블에 insert
	public int insertProduct(ProductVO productVO) {
		return this.sqlSessionTemplate.insert("lprod.insertProduct",productVO);
	}

	public int createPost(LprodVO lprodVO) {
		return this.sqlSessionTemplate.insert("lprod.createPost", lprodVO);
	}

}
