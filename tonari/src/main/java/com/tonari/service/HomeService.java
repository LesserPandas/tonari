package com.tonari.service;

import java.util.List;

import com.tonari.domain.BoardlistVO;
import com.tonari.domain.Review_viewVO;
import com.tonari.domain.TeacherSearch_viewVO;

public interface HomeService {
	
	public List<Review_viewVO> review();
	public List<BoardlistVO> board(int category);
	public List<TeacherSearch_viewVO> likelist();
}
