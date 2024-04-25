package kr.or.ddit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.dao.ProjectAddDao;
import kr.or.ddit.service.ProjectAddService;
import kr.or.ddit.vo.ProjectAddVO;
@Service
public class ProjectAddServiceImpl implements ProjectAddService {
	@Autowired
	ProjectAddDao projectAddDao;

	@Override
	public int createPost(ProjectAddVO projectAddVO) {
		return this.projectAddDao.createPost(projectAddVO);
	}
}
