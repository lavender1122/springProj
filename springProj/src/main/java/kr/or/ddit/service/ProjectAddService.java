package kr.or.ddit.service;

import org.springframework.stereotype.Service;

import kr.or.ddit.vo.ProjectAddVO;


public interface ProjectAddService {

	public int createPost(ProjectAddVO projectAddVO);
}
