package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dao.EmployeeDao;
import kr.or.ddit.service.EmployeeService;
import kr.or.ddit.service.dao.AttachDao;
import kr.or.ddit.utils.UploadController;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.License;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	EmployeeDao employeeDao;
	
	@Autowired
	AttachDao attachDao;
	@Autowired
	UploadController uploadController;
	
	@Transactional
	@Override
	public int createPost(EmployeeVO employeeVO) {
		//1) employee 테이블에 insert
		//employeeVO.getUploadFile() :MultipartFile
		String fileName = employeeVO.getUploadFile().getOriginalFilename();
		fileName ="/"+uploadController.getFolder().replace("\\", "/")+"/"
				+UUID.randomUUID().toString()+"_"+fileName;
		employeeVO.setFilename(fileName);
		int result = this.employeeDao.createPost(employeeVO);
		
		List<License> licenseList = employeeVO.getLicenseList();
		for(License license:licenseList) {
			license.setEmpNo(employeeVO.getEmpNo()); 
			result+= this.employeeDao.insertLicense(license);
		}
		//3) 파일업로드
		MultipartFile uploadFile= employeeVO.getUploadFile();
											//파일객체 , attachVO.globalCode
		result+= uploadController.uploadOne(uploadFile,employeeVO.getEmpNo());
		
		//4) employeeVO.filename=null
		//글로벌 코드를 조건으로 하여 첫번째 첨부파일 객체를 가져옴
		AttachVO attachVO = this.attachDao.getFileName(employeeVO.getEmpNo());//ATTACH
		log.info("attachVO>>"+attachVO);
		
		//5) employeeVO.filename을 업데이트
		result +=this.employeeDao.updateFileName(attachVO);
		return result;
	}

	@Override
	public List<EmployeeVO> list(Map<String, Object> map) {
		return this.employeeDao.list(map);
	}

	@Override
	public EmployeeVO detail(EmployeeVO employeeVO) {
		return this.employeeDao.detail(employeeVO);
	}

	@Override
	public int updatePost(EmployeeVO employeeVO) {
		return this.employeeDao.updatePost(employeeVO);
	}

	@Override
	public int deletePost(EmployeeVO employeeVO) {
		return this.employeeDao.deletePost(employeeVO);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.employeeDao.getTotal(map);
	}
}
