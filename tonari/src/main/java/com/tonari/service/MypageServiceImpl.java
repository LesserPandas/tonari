package com.tonari.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.PayListVO;
import com.tonari.domain.StudentVO;
import com.tonari.domain.TeacherVO;
import com.tonari.domain.Teacherinfo_viewVO;
import com.tonari.domain.studentpaylistVO;
import com.tonari.mapper.MyPageMapper;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MyPageMapper mapper;

	@Override
	public void payInfo(PayListVO pay) {
		mapper.payInsert(pay);
		
	}	
	
	@Override
	public MemberAuthVO tjoinpage(String nick) {
		return mapper.tjoinpage(nick);
	}
	
	@Override
	public void teacherjoin(TeacherVO tvo) {
		mapper.teacherjoin(tvo);
	}
	
	@Override
	public Teacherinfo_viewVO getTeacherVO(int bno) {
		Teacherinfo_viewVO tvo = mapper.getTeacherVO(bno);
		return tvo;
	}
	
	@Override
	public List<Integer> getdate(int date) {
		String dodate = String.format("%07d",Integer.parseInt(Integer.toBinaryString(date)));
		List<Integer> result = new ArrayList<Integer>();
		Integer[] list =new Integer[]{64,32,16,8,4,2,1};
		for(int i=0; i<7;i++) {
			if(dodate.charAt(i)=='1') {
				result.add(list[i]);
			}
		}
		return result;
	}
	
	//구독결과
	@Override
	public PayListVO subResult(int bno) {
		PayListVO subResult = mapper.subResult(bno);
		return subResult;
	}
	
	//좋아요 리스트
	@Override
	public List<Teacherinfo_viewVO> likeList(int teacher_bno) {
		return mapper.likeList(teacher_bno);
	}
	
	//좋아요 선생 결제 결과 저장
	@Override
	public void teacherlikePay(List<studentpaylistVO> mylist) {
		for(studentpaylistVO list : mylist) {
			mapper.teacherlikePay(list);
		}
	}	
	
	@Override
	public List<Teacherinfo_viewVO> payTeacherList(int bno) {
		return mapper.payTeacherList(bno);
	}
	
	@Override
	public void teacherUpdate(TeacherVO tvo) {
		mapper.teacherUpdate(tvo);
	}
	
	@Override
	public List<StudentVO> mystudentList(int bno) {
		return mapper.mystudentList(bno);
	}
}
