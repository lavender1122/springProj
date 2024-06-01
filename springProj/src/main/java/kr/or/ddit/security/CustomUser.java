/**
 * 
 */
package kr.or.ddit.security;

import java.util.Collection;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.vo.EmployeeVO;


//User: 스프링 시큐리티의 사용자 정보를 관리하는 최상위 클래스
public class CustomUser extends User {
	
	private EmployeeVO employeeVO;
	//User의 생성자를 처리해줌
	
	/*
	 User 클래스의 있는 프로퍼티
	 private String password;
	private final String username;
	private final Set<GrantedAuthority> authorities;
	private final boolean accountNonExpired;
	private final boolean accountNonLocked;
	private final boolean credentialsNonExpired;
	private final boolean enabled;
	 */
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(EmployeeVO employeeVO) {
		//사용자가 정의한 (select한) EmployeeVO 타입의 객체 employeeVO를
	      //스프링 시큐리티에서 제공해주고 있는 UsersDetails 타입으로 변환
	      //회원정보를 보내줄테니 이제부터 프링이 너가 관리해줘
		super(employeeVO.getEmpNo(),employeeVO.getEmpPwd(),
				employeeVO.getEmployeeAuthVOList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList())
				);
		this.employeeVO=employeeVO;
	}

	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}

	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
	

}
