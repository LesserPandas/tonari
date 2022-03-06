package com.tonari.service;

import java.util.List;

import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.studentpaylistVO;
import com.tonari.domain.PayListVO;
import com.tonari.domain.TeacherVO;
import com.tonari.domain.Teacherinfo_viewVO;

public interface MypageService {

	public MemberAuthVO tjoinpage(String nick);

	public void teacherjoin(TeacherVO tvo);

	public Teacherinfo_viewVO getTeacherVO(int bno);

	public List<Integer> getdate(int date);

	public void payInfo(PayListVO pay);

	//구독결과 출력 
	public PayListVO subResult(int bno);

	 //좋아요 LikeJoin LikeView(int bno);
	public List<Teacherinfo_viewVO> likeList(int teacher_bno);
	//TODO:추후 체크
	
	//좋아요 선생 결제 결과 저장
	public void teacherlikePay(List<studentpaylistVO> mylist);

	public List<Teacherinfo_viewVO> payTeacherList(int bno);
	
}
