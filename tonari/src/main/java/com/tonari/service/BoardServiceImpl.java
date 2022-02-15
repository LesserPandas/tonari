package com.tonari.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonari.domain.Addr_searchVO;
import com.tonari.domain.VBoardSearchVO;
import com.tonari.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Override
		public List<VBoardSearchVO> searchBoard(String orderby) {
			List<VBoardSearchVO> list = new ArrayList<VBoardSearchVO>();
			switch(orderby) {
			case "teacher":
				 list = mapper.searchBoardTeacherbno();
				break;
			case "score":
				list = mapper.searchBoardScore();
				break;
			default: 
				Addr_searchVO vo = mapper.shortarea(orderby);
				list = mapper.searchBoardArea(vo);
				break;
			}
			return list;
		}
}











