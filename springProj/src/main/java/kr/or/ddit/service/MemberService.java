package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.MemberVO;

public interface MemberService {
	//MEMBER, ADDRESS, CARD 테이블에 INSERT
	public int registerUserId(MemberVO member);

	public int registerFile08(MemberVO member);

	public MemberVO read01(String userId);

}
