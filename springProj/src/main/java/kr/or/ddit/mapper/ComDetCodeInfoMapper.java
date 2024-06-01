package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;


import kr.or.ddit.vo.ComDetCodeInfoVO;

public interface ComDetCodeInfoMapper {
		//입력 뷰
		public List<ComDetCodeInfoVO> create();
		
		public int createPost(ComDetCodeInfoVO comDetCodeInfoVO); 
		
		public ComDetCodeInfoVO detail(ComDetCodeInfoVO comDetCodeInfoVO);
		
		public int updatePost(ComDetCodeInfoVO comDetCodeInfoVO); 
		
		public int deletePost(ComDetCodeInfoVO comDetCodeInfoVO);
		
		public List<ComDetCodeInfoVO> list(Map<String, Object> map);

		public String getNextComCode(ComDetCodeInfoVO comDetCodeInfoVO);
}
