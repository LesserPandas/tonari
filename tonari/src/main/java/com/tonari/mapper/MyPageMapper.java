package com.tonari.mapper;

import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.TeacherVO;

public interface MyPageMapper {
	
	public MemberAuthVO tjoinpage(String nick);
	public void teacherjoin(TeacherVO tvo);
}
