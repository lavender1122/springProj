package kr.or.ddit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.Address;
import kr.or.ddit.vo.Card;
import kr.or.ddit.vo.MemberVO;

@Repository
public class MemberDao {
	//쿼리 실행 객체
	//DI / IoC
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int registerUserId(MemberVO member) {
		return this.sqlSessionTemplate.insert("member.registerUserId",member);
	}
	//ADDRESS 테이블 insert
	public int insertAddress(Address address) {
		return this.sqlSessionTemplate.insert("member.insertAddress",address);
	}
	public int insertCard(Card card) {
		return this.sqlSessionTemplate.insert("member.insertCard",card);
	}
	public MemberVO read01(String userId) {
		return this.sqlSessionTemplate.selectOne("member.read01",userId);
	}
}
