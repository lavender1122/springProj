package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ComCodeInfoMapper;
import kr.or.ddit.service.ComCodeInfoService;
import kr.or.ddit.vo.ComCodeInfoVO;

@Service
public class ComCodeInfoServiceImpl implements ComCodeInfoService {
	@Autowired
	ComCodeInfoMapper comCodeInfoMapper;
	
	//입력 실행
	@Override
	public List<ComCodeInfoVO> create(){
		return this.comCodeInfoMapper.create();
	}
	//입력 실행
	@Override
	public int createPost(ComCodeInfoVO comCodeInfoVO) {
		
		return this.comCodeInfoMapper.createPost(comCodeInfoVO);
	}
	//상세뷰
	@Override
	public ComCodeInfoVO detail(ComCodeInfoVO comCodeInfoVO) {
		
		return this.comCodeInfoMapper.detail(comCodeInfoVO);
	}
	//수정실행
	@Override
	public int updatePost(ComCodeInfoVO comCodeInfoVO) {
		
		return this.comCodeInfoMapper.updatePost(comCodeInfoVO);
	}
	//삭제 실행
	@Override
	public int deletePost(ComCodeInfoVO comCodeInfoVO) {
		
		return this.comCodeInfoMapper.deletePost(comCodeInfoVO);
	}
	//목록뷰
	@Override
	public List<ComCodeInfoVO> list(Map<String, Object> map){
		
		return this.comCodeInfoMapper.list(map);
	}
}
