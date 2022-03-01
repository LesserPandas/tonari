package com.tonari.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tonari.domain.BoardlistVO;
import com.tonari.domain.Review_viewVO;
import com.tonari.domain.TeacherSearch_viewVO;
import com.tonari.mapper.HomeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class HomeServiceImpl implements HomeService {
	
	private HomeMapper mapper;
	private BoardServiceImpl bservice;

	@Override
	public List<Review_viewVO> review() {
		List<Review_viewVO> list = mapper.review();
		for(int i=0;i<list.size();i++) {
			Review_viewVO rvo = new Review_viewVO();
			rvo.setStar(bservice.star(list.get(i).getScore()));
			rvo.setNick(bservice.nickname(list.get(i).getNick()));
			rvo.setContent(list.get(i).getContent());
			rvo.setMember_bno(list.get(i).getMember_bno());
			rvo.setReview_bno(list.get(i).getReview_bno());
			rvo.setTeacher_bno(list.get(i).getTeacher_bno());
			list.set(i,rvo);
		}
		return list;
	}
	
	@Override
	public List<BoardlistVO> notice() {
		return mapper.notice();
	}

	@Override
	public List<BoardlistVO> event() {
		return mapper.event();
	}
}
