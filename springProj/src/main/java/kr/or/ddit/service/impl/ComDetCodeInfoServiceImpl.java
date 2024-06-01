package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ComCodeInfoMapper;
import kr.or.ddit.mapper.ComDetCodeInfoMapper;
import kr.or.ddit.service.ComCodeInfoService;
import kr.or.ddit.service.ComDetCodeInfoService;
import kr.or.ddit.vo.ComDetCodeInfoVO;

@Service
public class ComDetCodeInfoServiceImpl implements ComDetCodeInfoService {
	@Autowired
	ComDetCodeInfoMapper comDetCodeInfoMapper;
	
	//입력 실행
	@Override
	public List<ComDetCodeInfoVO> create(){
		return this.comDetCodeInfoMapper.create();
	}
	//입력 실행
	@Override
	public int createPost(ComDetCodeInfoVO comCodeInfoVO) {
		
		return this.comDetCodeInfoMapper.createPost(comCodeInfoVO);
	}
	//상세뷰
	@Override
	public ComDetCodeInfoVO detail(ComDetCodeInfoVO comCodeInfoVO) {
		
		return this.comDetCodeInfoMapper.detail(comCodeInfoVO);
	}
	//수정실행
	@Override
	public int updatePost(ComDetCodeInfoVO comCodeInfoVO) {
		
		return this.comDetCodeInfoMapper.updatePost(comCodeInfoVO);
	}
	//삭제 실행
	@Override
	public int deletePost(ComDetCodeInfoVO comCodeInfoVO) {
		
		return this.comDetCodeInfoMapper.deletePost(comCodeInfoVO);
	}
	//목록뷰
	@Override
	public List<ComDetCodeInfoVO> list(Map<String, Object> map){
		
		return this.comDetCodeInfoMapper.list(map);
	}
	@Override
	public String getNextComCode(ComDetCodeInfoVO comDetCodeInfoVO) {
		return this.comDetCodeInfoMapper.getNextComCode(comDetCodeInfoVO);
	}
}
