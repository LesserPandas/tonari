package com.tonari.service;

import org.springframework.stereotype.Service;

import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.TeacherVO;
import com.tonari.mapper.MyPageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MypageServiceImpl implements MypageService {
	
	@Setter
	private MyPageMapper mapper;

	@Override
	public MemberAuthVO tjoinpage(String nick) {
		return mapper.tjoinpage(nick);
	}
	
	@Override
	public void teacherjoin(TeacherVO tvo) {
		mapper.teacherjoin(tvo);
	}
	
	@Override
	public TeacherVO getTeacherVO(int bno) {
		TeacherVO tvo = mapper.getTeacherVO(bno);
		
		return tvo;
	}

}
