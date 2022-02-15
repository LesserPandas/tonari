package com.tonari.service;

import java.util.List;

import com.tonari.domain.VBoardSearchVO;

public interface BoardService {
	
	public List<VBoardSearchVO> searchBoard(String orderby);
}
