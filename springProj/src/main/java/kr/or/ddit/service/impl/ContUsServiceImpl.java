package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dao.ContUsDao;
import kr.or.ddit.service.ContUsService;
import kr.or.ddit.service.dao.AttachDao;
import kr.or.ddit.utils.UploadController;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.ContUsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ContUsServiceImpl implements ContUsService {
	@Autowired
	ContUsDao contUsDao;
	@Autowired
	UploadController uploadController;
	@Autowired
	AttachDao attachDao;
	
	@Override
	public int createPost(ContUsVO contUsVO) {
		int result = this.contUsDao.createPost(contUsVO);
		//파일 업로드
		MultipartFile[] upload= contUsVO.getUploadFiles();
		result+= this.uploadController.uploadMulti(upload, contUsVO.getCuCode());
		
		return result;
	}

	@Override
	public List<ContUsVO> list() {
		return this.contUsDao.list();
	}
	
}
