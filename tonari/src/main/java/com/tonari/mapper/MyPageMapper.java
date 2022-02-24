package com.tonari.mapper;

import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.PayListVO;
import com.tonari.domain.TeacherVO;
import com.tonari.domain.Teacherinfo_viewVO;

public interface MyPageMapper {
	
	public MemberAuthVO tjoinpage(String nick);
	public void teacherjoin(TeacherVO tvo);
	public Teacherinfo_viewVO getTeacherVO(int bno);
	public void payInsert(PayListVO pay);
}
