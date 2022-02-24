package com.tonari.service;

import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.TeacherVO;

public interface MypageService {

	public MemberAuthVO tjoinpage(String nick);
	public void teacherjoin(TeacherVO tvo);
	

}
