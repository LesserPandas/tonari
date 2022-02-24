package com.tonari.service;

import com.tonari.domain.PayListVO;

import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.TeacherVO;

public interface MypageService {

	public void payInfo(PayListVO pay);

	
	public MemberAuthVO tjoinpage(String nick);
	public void teacherjoin(TeacherVO tvo);
	public TeacherVO getTeacherVO(int bno);

}
