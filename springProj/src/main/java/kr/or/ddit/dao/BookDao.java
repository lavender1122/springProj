package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.BookVO;

//매퍼xml(book_SQL.xml)을 실행시키는 
//DAO(Data Access Object) 클래스
//Repository 어노테이션 : 데이터에 접근하는 클래스
//스프링이 데이터를 관리하는 클래스라고 인지하여 자바빈으로 등록하여 관리함
@Repository //자바빈으로 등록
public class BookDao {
	//DI(Dependency Injection) : 의존성 주입
	   //개발자가 new 키워드를 통해 직접 객체를 생성하지 않고!!!
	   //스프링이 미리 만들어 놓은(서버 실행 시 스프링이 미리 xml을 읽어
	   //객체를 인스턴스화 해놓음)
	   //sqlSessionTemplate 타입 객체를 BookDao 객체에 주입함
	@Autowired // 메모리에 있는것 사용하는것,(DI)
	SqlSessionTemplate sqlSessionTemplate; //root-context.xml bean id="sqlSessionTemplate" 똑같이 써야한다
	public int createPost(BookVO bookVO) {
		//book_SQL.xml 파일의 namespace가 book이고, id가 createPost인
	      //태그를 찾아 그 안에 들어있는 sql을 실행함
	      //bookVO=>{"bookId":"","title":"총알탄 개똥이","category":"소설","price":10000,"insertDate":""}
	      //insert,update,delete는 반영된 건수가 return됨
	      //insert성공 : 1이상, 실패면 0
		return this.sqlSessionTemplate.insert("book.createPost", bookVO);
	}
	public List<BookVO> list(Map<String, Object> map) {
		//.selectList("namespace.id",파라미터)
		return this.sqlSessionTemplate.selectList("book.list",map);
	}
	public BookVO detail(BookVO bookVO) {
		return this.sqlSessionTemplate.selectOne("book.detail", bookVO);
	}
	public int updatePost(BookVO bookVO) {
		return this.sqlSessionTemplate.update("book.updatePost", bookVO);
	}
	public int deletePost(BookVO bookVO) {
		return this.sqlSessionTemplate.delete("book.deletePost", bookVO);
	}
}
