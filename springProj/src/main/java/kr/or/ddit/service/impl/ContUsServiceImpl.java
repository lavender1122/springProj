package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.ContUsDao;
import kr.or.ddit.service.ContUsService;
import kr.or.ddit.vo.ContUsVO;

@Service
public class ContUsServiceImpl implements ContUsService {
	@Autowired
	ContUsDao contUsDao;
	
	@Override
	public int createPost(ContUsVO contUsVO) {
		return this.contUsDao.createPost(contUsVO);
	}

	@Override
	public List<ContUsVO> list() {
		return this.contUsDao.list();
	}
	
}
