package com.tonari.mapper;

import java.util.List;

import com.tonari.domain.BoardlistVO;
import com.tonari.domain.Review_viewVO;

public interface HomeMapper {
	public List<Review_viewVO> review();
	public List<BoardlistVO> notice();
	public List<BoardlistVO> event();
}
