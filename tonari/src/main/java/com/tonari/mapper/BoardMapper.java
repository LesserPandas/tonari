package com.tonari.mapper;

import java.util.List;

import com.tonari.domain.Addr_searchVO;
import com.tonari.domain.VBoardSearchVO;

public interface BoardMapper {

	public List<VBoardSearchVO> searchBoardTeacherbno();
	public List<VBoardSearchVO> searchBoardScore();
	public Addr_searchVO shortarea(String orderby);
	public List<VBoardSearchVO> searchBoardArea(Addr_searchVO vo);
}
