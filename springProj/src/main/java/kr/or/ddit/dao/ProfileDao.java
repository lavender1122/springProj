package kr.or.ddit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.Activity;
import kr.or.ddit.vo.ProfileVO;
import kr.or.ddit.vo.Setting;

@Repository
public class ProfileDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ProfileVO profileInfo(String userId) {
		return this.sqlSessionTemplate.selectOne("profile.profileInfo", userId);
	}

	public List<Activity> activityAjax(String userId) {
		return this.sqlSessionTemplate.selectList("profile.activityAjax",userId);
	}

	public int settingCreateAjax(Setting setting) {
		return this.sqlSessionTemplate.insert("profile.settingCreateAjax", setting);
	}

	public int profileUpdateAjax(ProfileVO profileVO) {
		return this.sqlSessionTemplate.update("profile.profileUpdateAjax", profileVO);
	}
}
