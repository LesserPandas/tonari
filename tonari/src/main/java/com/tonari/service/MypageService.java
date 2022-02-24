package com.tonari.service;

import java.util.List;

import com.tonari.domain.PayListVO;

import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.TeacherVO;
import com.tonari.domain.Teacherinfo_viewVO;

import com.tonari.domain.PayListVO;

public interface MypageService {

	public void payInfo(PayListVO pay);

	
	public MemberAuthVO tjoinpage(String nick);
	public void teacherjoin(TeacherVO tvo);
	public Teacherinfo_viewVO getTeacherVO(int bno);
	public List<Integer> getdate(int date);

	public void payInfo(PayListVO pay);

	
}
