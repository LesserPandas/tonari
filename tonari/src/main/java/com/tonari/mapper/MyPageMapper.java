package com.tonari.mapper;


import java.util.List;

import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.studentpaylistVO;
import com.tonari.domain.PayListVO;
import com.tonari.domain.TeacherVO;
import com.tonari.domain.Teacherinfo_viewVO;

public interface MyPageMapper {
	public MemberAuthVO tjoinpage(String nick);

	public void teacherjoin(TeacherVO tvo);

	public Teacherinfo_viewVO getTeacherVO(int bno);

	public void teacherUpdate(TeacherVO tvo);

	public void payInsert(PayListVO pay);

	
	
	
	//구독결과 출력
	public PayListVO subResult(int bno);

	//좋아요 리스트
	public List<Teacherinfo_viewVO> likeList(int member_bno);
	
	//좋아요 선생 결제 결과 저장
	public void teacherlikePay(studentpaylistVO list);

	public List<Teacherinfo_viewVO> payTeacherList(int bno);
	
	
}
